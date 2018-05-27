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
import security.entities.RoleModule;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBRoleModule {
    DBConnection connection;
    
    public DBRoleModule(){
        connection = new DBConnection();
    }
    
    public List<RoleModule> getList(long roleId) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<RoleModule> roleDetailList = new ArrayList<>();
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_RoleModuleList(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("RoleId_p", roleId);
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
                RoleModule roleDetail = new RoleModule(
                          roleId
                        , new Item(rs.getLong("ModuleId")
                        , rs.getString("ModuleName"))
                        , rs.getBoolean("IsCreated")
                        , rs.getBoolean("IsUpdated")
                        , rs.getBoolean("IsDeleted")
                );
                roleDetailList.add(roleDetail);
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
        return roleDetailList;
    }
    
    public String insert(RoleModule roleDetail, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Insert_RoleModule(?,?,?,?,?,?,?)}");
            cstmt.setLong("RoleId_p", roleDetail.getRoleId());
            cstmt.setLong("ModuleId_p", roleDetail.getModule().getId());
            cstmt.setBoolean("IsCreated_p", roleDetail.getIsCreated());
            cstmt.setBoolean("IsUpdated_p", roleDetail.getIsUpdated());
            cstmt.setBoolean("IsDeleted_p", roleDetail.getIsDeleted());
            cstmt.setLong("UserId_p", track.getEntryUser().getId());
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
    
    public String update(RoleModule roleDetail, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Update_RoleModule(?,?,?,?,?,?,?)}");
            cstmt.setLong("RoleId_p", roleDetail.getRoleId());
            cstmt.setLong("ModuleId_p", roleDetail.getModule().getId());
            cstmt.setBoolean("IsCreated_p", roleDetail.getIsCreated());
            cstmt.setBoolean("IsUpdated_p", roleDetail.getIsUpdated());
            cstmt.setBoolean("IsDeleted_p", roleDetail.getIsDeleted());
            cstmt.setLong("UserId_p", track.getModUser().getId());
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
    
    public String delete(long roleId, long objectId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Delete_RoleModule(?,?,?)}");
            cstmt.setLong("RoleId_p", roleId);
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
