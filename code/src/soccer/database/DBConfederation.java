/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.database.DBConnection;
import security.entities.Item;
import soccer.entities.Confederation;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBConfederation {
    DBConnection connection;

    public DBConfederation(){
        connection = new DBConnection();
    }
    
    public List<Confederation> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Confederation> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_ConfederationList(?)}"
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
                Confederation module = new Confederation(
                          rs.getLong("ConfederationId")
                        , rs.getString("Name")
                        , rs.getString("ShortName")
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
            Logger.getLogger(DBConfederation.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConfederation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConfederation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Confederation obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Insert_Confederation(?,?,?,?)}");
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setLong("UserId_p", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBConfederation.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConfederation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Confederation obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_Confederation(?,?,?,?,?,?)}");
            cstmt.setLong("ConfederationId_p", obj.getId());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setLong("UserId_p", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBConfederation.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConfederation.class.getName()).log(
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
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Delete_Confederation(?,?)}");
            cstmt.setLong("ConfederationId_p", idObject);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBConfederation.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConfederation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
