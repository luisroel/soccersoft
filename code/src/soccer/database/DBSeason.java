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
import soccer.entities.Season;
import security.entities.TrackChange;
import soccer.entities.SeasonPhase;
import soccer.entities.Week;

/**
 *
 * @author Administrator
 */
public class DBSeason {
    DBConnection connection;

    public DBSeason(){
        connection = new DBConnection();
    }
    
    public List<Season> getList(long tournamentId) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Season> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_SeasonList(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("TournamentId_p", tournamentId);
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
                Season obj = new Season(
                          rs.getLong("SeasonId")
                        , rs.getTimestamp("StartDate")
                        , rs.getTimestamp("EndDate")
                        , rs.getString("ShortName")
                        , rs.getString("Name")
                        , new Item(rs.getLong("TournamentId"),rs.getString("TournamentName"))
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<SeasonPhase> getPhasesList(long seasonId) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<SeasonPhase> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_SeasonPhaseList(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
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
                SeasonPhase obj = new SeasonPhase(
                          new Item(rs.getLong("PhaseId"),rs.getString("Phase"))
                        , rs.getString("Description")
                        , rs.getLong("Records")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Week> getWeekList(long seasonId){
        List<Week> list = new ArrayList<>();
        
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_SeasonWeeks(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
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
                Week node = new Week(
                      rs.getInt("WeekNo")
                    , rs.getTimestamp("From")
                    , rs.getTimestamp("To")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Season obj, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Insert_Season(?,?,?,?,?,?,?)}");
            cstmt.setTimestamp("StartDate_p", obj.getFrom());
            cstmt.setTimestamp("EndDate_p", obj.getTo());
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setLong("TournamentId_p", obj.getTournament().getId());
            cstmt.setLong("UserId_p", track.getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Season obj, TrackChange track) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_Season(?,?,?,?,?,?,?,?)}");
            cstmt.setLong("SeasonId_p", obj.getId());
            cstmt.setTimestamp("StartDate_p", obj.getFrom());
            cstmt.setTimestamp("EndDate_p", obj.getTo());
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setLong("TournamentId_p", obj.getTournament().getId());
            cstmt.setLong("UserId_p", track.getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
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
                    "{call spCore_Delete_Season(?,?)}");
            cstmt.setLong("SeasonId_p", idObject);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String addPhaseSeason(long seasonId, long phaseId, String desc, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Insert_SeasonPhase(?,?,?,?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setString("Desc_p", desc);
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String updatePhaseSeason(long seasonId, long phaseId, String desc, long userId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_SeasonPhase(?,?,?,?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setString("Desc_p", desc);
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String removePhase(long seasonId, long phaseId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Delete_SeasonPhase(?,?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBSeason.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSeason.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
}
