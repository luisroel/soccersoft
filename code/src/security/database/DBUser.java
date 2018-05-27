/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.entities.Item;
import security.entities.TrackChange;
import security.entities.User;

/**
 *
 * @author Administrator
 */
public class DBUser {
    DBConnection connection;
    
    public DBUser(){
        connection = new DBConnection();
    }
    
    public List<User> getList(long isActive){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<User> list = new ArrayList<>();
        
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_UserList(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("IsActive_p", isActive);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                User user = new User(
                          rs.getLong("UserId")
                        , rs.getString("UserName")
                        , rs.getString("Password")
                        , rs.getBoolean("IsActive")
                        , new TrackChange(
                              rs.getTimestamp("EntryDate")
                            , new Item(rs.getLong("EntryUserId"), rs.getString("EntryUser"))
                            , rs.getTimestamp("ModDate")
                            , new Item(rs.getLong("ModUserId"),rs.getString("ModUser"))
                        )
                );
                list.add(user);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(User user) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Insert_User(?,?,?,?)}");
            cstmt.setString("Username_p", user.getUsername());
            cstmt.setString("Password_p", user.getPassword());
            cstmt.setLong("UserId_p", user.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(User user) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Update_User(?,?,?,?,?,?)}");
            cstmt.setLong("UserId_p", user.getUserId());
            cstmt.setString("Username_p", user.getUsername());
            cstmt.setString("Password_p", user.getPassword());
            cstmt.setBoolean("IsActive_p", user.getIsActive());
            cstmt.setLong("UserId2_p", user.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String delete(long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Delete_User(?,?)}");
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public List<Item> getAvailableRoles(long userId){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();
        
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_AvailableRoles(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("UserId_p", userId);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                Item item = new Item(
                      rs.getLong("RoleId")
                    , rs.getString("Name")
                );
                list.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Item> getAssignedRoles(long userId){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();
        
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_AssignedRoles(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("UserId_p", userId);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                Item item = new Item(
                      rs.getLong("RoleId")
                    , rs.getString("Name")
                );
                list.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String applyUserRole(long userId, long roleId, int action, long modUserId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Apply_UserRole(?,?,?,?,?)}");
            cstmt.setLong("UserId_p", userId);
            cstmt.setLong("RoleId_p", roleId);
            cstmt.setLong("Action_p", action);
            cstmt.setLong("ModUserId_p", modUserId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
