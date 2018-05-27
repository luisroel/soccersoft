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
import soccer.entities.Position;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBPosition {
    DBConnection connection;

    public DBPosition(){
        connection = new DBConnection();
    }
    
    public List<Position> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Position> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call dbo.spCore_Get_PositionList(?)}"
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
                Position module = new Position(
                          rs.getLong("PositionId")
                        , rs.getString("Position")
                        , rs.getString("Abbrev")
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
            Logger.getLogger(DBPosition.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPosition.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPosition.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Position obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Insert_Position(?,?,?,?)}");
            cstmt.setString("Position", obj.getPosition());
            cstmt.setString("Abbrev", obj.getAbbrev());
            cstmt.setLong("UserId", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPosition.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPosition.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Position obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Update_Position(?,?,?,?,?,?)}");
            cstmt.setLong("PositionId", obj.getId());
            cstmt.setString("Position", obj.getPosition());
            cstmt.setString("Abbrev", obj.getAbbrev());
            cstmt.setBoolean("IsActive", obj.getIsActive());
            cstmt.setLong("UserId", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPosition.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPosition.class.getName()).log(
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
                    "{call dbo.spCore_Delete_Position(?,?)}");
            cstmt.setLong("PositionId", idObject);
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPosition.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPosition.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
