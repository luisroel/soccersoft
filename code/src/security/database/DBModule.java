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
import security.entities.Module;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBModule {
    
    DBConnection connection;

    public DBModule(){
        connection = new DBConnection();
    }
    
    public List<Module> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Module> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_ModuleList(?)}"
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
                Module module = new Module(
                          rs.getLong("ModuleId")
                        , rs.getString("Name")
                        , rs.getString("Description")
                        , new Item(rs.getLong("MenuId"), rs.getString("MenuName"))
                        , rs.getInt("Order")
                        , rs.getBoolean("IsActive")
                        , new TrackChange(
                              rs.getTimestamp("EntryDate")
                            , new Item(rs.getLong("EntryUserId"), rs.getString("EntryUser"))
                            , rs.getTimestamp("ModDate")
                            , new Item(rs.getLong("ModUserId"),rs.getString("ModUser"))
                        )
                );
                list.add(module);
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
    
    public String insert(Module obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Insert_Module(?,?,?,?,?,?)}");
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setLong("MenuId_p", obj.getMenu().getId());
            cstmt.setInt("Order_p", obj.getOrder());
            cstmt.setLong("UserId_p", obj.getTrack().getEntryUser().getId());
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
    
    public String update(Module obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_update_Module(?,?,?,?,?,?,?,?)}");
            cstmt.setLong("ModuleId_p", obj.getId());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setLong("MenuId_p", obj.getMenu().getId());
            cstmt.setInt("Order_p", obj.getOrder());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setLong("UserId_p", obj.getTrack().getModUser().getId());
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

    public String delete(long idObject) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_delete_Module(?,?)}");
            cstmt.setLong("ModuleId_p", idObject);
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
