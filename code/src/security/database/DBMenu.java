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
import security.entities.Menu;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBMenu {
    
    DBConnection connection;

    public DBMenu(){
        connection = new DBConnection();
    }
    
    public List<Menu> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Menu> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_MenuList(?)}"
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
                Menu Menu = new Menu(
                          rs.getLong("MenuId")
                        , rs.getString("Name")
                        , rs.getString("Description")
                        , rs.getInt("Order")
                        , rs.getBoolean("IsActive")
                        , new TrackChange(
                              rs.getTimestamp("EntryDate")
                            , new Item(rs.getLong("EntryUserId"), rs.getString("EntryUser"))
                            , rs.getTimestamp("ModDate")
                            , new Item(rs.getLong("ModUserId"),rs.getString("ModUser"))
                        )
                );
                list.add(Menu);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBMenu.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMenu.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMenu.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Menu obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Insert_Menu(?,?,?,?,?)}");
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setInt("Order_p", obj.getOrder());
            cstmt.setLong("UserId_p", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBMenu.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMenu.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Menu obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_update_Menu(?,?,?,?,?,?,?)}");
            cstmt.setLong("MenuId_p", obj.getId());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("Description_p", obj.getDescription());
            cstmt.setInt("Order_p", obj.getOrder());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setLong("UserId_p", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBMenu.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMenu.class.getName()).log(
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
                    "{call spSecurity_delete_Menu(?,?)}");
            cstmt.setLong("MenuId_p", idObject);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBMenu.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMenu.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
}
