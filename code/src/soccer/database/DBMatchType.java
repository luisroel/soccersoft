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
import soccer.entities.MatchType;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBMatchType {
    DBConnection connection;

    public DBMatchType(){
        connection = new DBConnection();
    }
    
    public List<MatchType> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<MatchType> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call dbo.spCore_Get_MatchTypeList(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("IsActive", isActive);
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
                MatchType module = new MatchType(
                          rs.getLong("MatchTypeId")
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
            Logger.getLogger(DBMatchType.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMatchType.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMatchType.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(MatchType obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Insert_MatchType(?,?,?,?)}");
            cstmt.setString("Name", obj.getName());
            cstmt.setString("ShortName", obj.getShortName());
            cstmt.setLong("UserId", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBMatchType.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMatchType.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(MatchType obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Update_MatchType(?,?,?,?,?,?)}");
            cstmt.setLong("MatchTypeId", obj.getId());
            cstmt.setString("Name", obj.getName());
            cstmt.setString("ShortName", obj.getShortName());
            cstmt.setBoolean("IsActive", obj.getIsActive());
            cstmt.setLong("UserId", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBMatchType.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMatchType.class.getName()).log(
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
                    "{call dbo.spCore_Delete_MatchType(?,?)}");
            cstmt.setLong("MatchTypeId", idObject);
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBMatchType.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBMatchType.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
