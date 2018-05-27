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
import soccer.entities.Player;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class DBPlayer {
    DBConnection connection;

    public DBPlayer(){
        connection = new DBConnection();
    }
    
    public List<Player> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Player> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call dbo.spCore_Get_PlayerList(?)}"
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
                Player module = new Player(
                          rs.getLong("PlayerId")
                        , rs.getString("NickName")
                        , rs.getString("FirstName")
                        , rs.getString("MiddleName")
                        , rs.getString("LastName")
                        , new Item(rs.getLong("PositionId"),rs.getString("Position"))
                        , rs.getBoolean("IsActive")
                        , rs.getTimestamp("Birthdate")
                        , new Item(rs.getLong("CountryId"),rs.getString("CountryName"))
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
            Logger.getLogger(DBPlayer.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPlayer.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPlayer.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Player obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Insert_Player(?,?,?,?,?,?,?,?,?)}");
            cstmt.setString("NickName", obj.getNickName());
            cstmt.setString("FirstName", obj.getFirstName());
            cstmt.setString("MiddleName", obj.getMiddleName());
            cstmt.setString("LastName", obj.getLastName());
            cstmt.setLong("PositionId", obj.getPosition().getId());
            cstmt.setTimestamp("Birthdate", obj.getBirthdate());
            cstmt.setLong("CountryId", obj.getCountry().getId());
            cstmt.setLong("UserId", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPlayer.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPlayer.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Player obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Update_Player(?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setLong("PlayerId", obj.getId());
            cstmt.setString("NickName", obj.getNickName());
            cstmt.setString("FirstName", obj.getFirstName());
            cstmt.setString("MiddleName", obj.getMiddleName());
            cstmt.setString("LastName", obj.getLastName());
            cstmt.setLong("PositionId", obj.getPosition().getId());
            cstmt.setBoolean("IsActive", obj.getIsActive());
            cstmt.setTimestamp("Birthdate", obj.getBirthdate());
            cstmt.setLong("CountryId", obj.getCountry().getId());
            cstmt.setLong("UserId", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPlayer.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPlayer.class.getName()).log(
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
                    "{call dbo.spCore_Delete_Player(?,?)}");
            cstmt.setLong("PlayerId", idObject);
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBPlayer.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBPlayer.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
