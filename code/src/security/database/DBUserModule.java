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
import security.entities.UserModule;

/**
 *
 * @author Administrator
 */
public class DBUserModule {
    DBConnection connection;
    
    public DBUserModule(){
        connection = new DBConnection();
    }
    
    public List<UserModule> getList(long userId) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<UserModule> list = new ArrayList<>();
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_UserModuleList(?)}"
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
                UserModule userAccess = new UserModule(
                          userId
                        , new Item(rs.getLong("ModuleId")
                        , rs.getString("ModuleName"))
                        , rs.getBoolean("IsCreated")
                        , rs.getBoolean("IsUpdated")
                        , rs.getBoolean("IsDeleted")
                );
                list.add(userAccess);
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
    
    public String insert(UserModule userAccess, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Insert_UserModule(?,?,?,?,?,?,?)}");
            cstmt.setLong("UserId_p", userAccess.getUserId());
            cstmt.setLong("ModuleId_p", userAccess.getModule().getId());
            cstmt.setBoolean("IsCreated_p", userAccess.getIsCreated());
            cstmt.setBoolean("IsUpdated_p", userAccess.getIsUpdated());
            cstmt.setBoolean("IsDeleted_p", userAccess.getIsDeleted());
            cstmt.setLong("ModUserId_p", track.getEntryUser().getId());
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
    
    public String update(UserModule userAccess, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Update_UserModule(?,?,?,?,?,?,?)}");
            cstmt.setLong("UserId_p", userAccess.getUserId());
            cstmt.setLong("ModuleId_p", userAccess.getModule().getId());
            cstmt.setBoolean("IsCreated_p", userAccess.getIsCreated());
            cstmt.setBoolean("IsUpdated_p", userAccess.getIsUpdated());
            cstmt.setBoolean("IsDeleted_p", userAccess.getIsDeleted());
            cstmt.setLong("ModUserId_p", track.getModUser().getId());
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
    
    public String delete(long userId, long objectId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Delete_UserModule(?,?,?)}");
            cstmt.setLong("UserId_p", userId);
            cstmt.setLong("ModuleId_p", objectId);
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
