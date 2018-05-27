/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.TableModel;
import security.database.DBConnection;
import security.entities.Item;
import security.entities.TrackChange;
import soccer.entities.Fixture;

/**
 *
 * @author luis.espinoza
 */
public class DBFixture {
    DBConnection connection;

    public DBFixture(){
        connection = new DBConnection();
    }
    
    public List<Fixture> getList(long seasonId, long phaseId, int round) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Fixture> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_FixtureList(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setInt("Round_p", round);
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
                Fixture obj = new Fixture(
                          rs.getLong("FixtureId")
                        , new Item(rs.getLong("AssociationId"), rs.getString("Association"))
                        , new Item(rs.getLong("TournamentId"), rs.getString("Tournament"))
                        , new Item(rs.getLong("SeasonId"), rs.getString("Season"))
                        , new Item(rs.getLong("PhaseId"), rs.getString("Phase"))
                        , rs.getInt("Round")
                        , rs.getTimestamp("Time")
                        , new Item(rs.getLong("HomeTeamId"), rs.getString("Home"))
                        , rs.getInt("ScoredHome")
                        , new Item(rs.getLong("VisitorTeamId"), rs.getString("Visitor"))
                        , rs.getInt("ScoredVisitor")
                        , new Item(rs.getLong("StadiumId"), rs.getString("Stadium"))
                        , new Item(rs.getLong("RefereeId"), rs.getString("Referee"))
                        , new Item(rs.getLong("FixtureStatusId"), rs.getString("Status"))
                        , rs.getFloat("Odd_1")
                        , rs.getFloat("Odd_X")
                        , rs.getFloat("Odd_2")
                        , rs.getInt("WeekNo")
                        , rs.getString("Tendency")
                        , new TrackChange(
                              rs.getTimestamp("EntryDate")
                            , new Item(rs.getLong("EntryUserId"), rs.getString("EntryUser"))
                            , rs.getTimestamp("ModDate")
                            , new Item(rs.getLong("ModUserId"),rs.getString("ModUser"))
                        )
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
        
    public List<Fixture> getListByDates(Timestamp from, Timestamp to, long associationId, long tournamentId) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Fixture> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_FixtureListByDate(?,?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("From_p", from);
            cstmt.setTimestamp("To_p", to);
            cstmt.setLong("AssociationId_p", associationId);
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
                Fixture obj = new Fixture(
                          rs.getLong("FixtureId")
                        , new Item(rs.getLong("AssociationId"), rs.getString("Association"))
                        , new Item(rs.getLong("TournamentId"), rs.getString("Tournament"))
                        , new Item(rs.getLong("SeasonId"), rs.getString("Season"))
                        , new Item(rs.getLong("PhaseId"), rs.getString("Phase"))
                        , rs.getInt("Round")
                        , rs.getTimestamp("Time")
                        , new Item(rs.getLong("HomeTeamId"), rs.getString("Home"))
                        , rs.getInt("ScoredHome")
                        , new Item(rs.getLong("VisitorTeamId"), rs.getString("Visitor"))
                        , rs.getInt("ScoredVisitor")
                        , new Item(rs.getLong("StadiumId"), rs.getString("Stadium"))
                        , new Item(rs.getLong("RefereeId"), rs.getString("Referee"))
                        , new Item(rs.getLong("FixtureStatusId"), rs.getString("Status"))
                        , rs.getFloat("Odd_1")
                        , rs.getFloat("Odd_X")
                        , rs.getFloat("Odd_2")
                        , rs.getInt("WeekNo")
                        , rs.getString("Tendency")
                        , new TrackChange(
                              rs.getTimestamp("EntryDate")
                            , new Item(rs.getLong("EntryUserId"), rs.getString("EntryUser"))
                            , rs.getTimestamp("ModDate")
                            , new Item(rs.getLong("ModUserId"),rs.getString("ModUser"))
                        )
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
 
    public String insert(Fixture obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
            "{call spCore_Insert_Fixture(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setLong("SeasonId_p", obj.getSeason().getId());
            cstmt.setLong("PhaseId_p", obj.getPhase().getId());
            cstmt.setLong("Round_p", obj.getRound());
            cstmt.setTimestamp("Time_p", obj.getTime());
            cstmt.setLong("HomeTeamId_p", obj.getHomeTeam().getId());
            cstmt.setLong("ScoredHome_p", obj.getScoredHome());
            cstmt.setLong("VisitorTeamId_p", obj.getVisitorTeam().getId());
            cstmt.setLong("ScoredVisitor_p", obj.getScoredVisitor());
            cstmt.setLong("StadiumId_p", obj.getStadium().getId());
            cstmt.setLong("RefereeId_p", obj.getReferee().getId());
            cstmt.setLong("StatusId_p", obj.getStatus().getId());
            cstmt.setFloat("Odd_1_p", obj.getOdd_1());
            cstmt.setFloat("Odd_X_p", obj.getOdd_x());
            cstmt.setFloat("Odd_2_p", obj.getOdd_2());
            cstmt.setInt("WeekNo_p", obj.getWeekNo());
            cstmt.setString("Tendency_p", obj.getTendency());
            cstmt.setLong("UserId_p", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String insertFromImport(TableModel tableModel, int keyNo) {
        Integer round,scoredHome, scoredVisitor, weekNo;
        Timestamp time;
        Float odd_1, odd_X, odd_2;
        Item assocciation, tournament, season, phase, homeTeam, visitorTeam, status;
        TrackChange track;
        int maxRows = tableModel.getRowCount();
        int index = 0;
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
            "{call spCore_Import_Fixture(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            while (index < maxRows && msg.isEmpty()){
                
                // get values
                assocciation = (Item)tableModel.getValueAt(index, 1);
                tournament = (Item)tableModel.getValueAt(index, 2);
                round = (Integer)tableModel.getValueAt(index, 3);
                status = (Item)tableModel.getValueAt(index, 4);
                time = (Timestamp)tableModel.getValueAt(index, 5);
                homeTeam = (Item)tableModel.getValueAt(index, 6);
                scoredHome = (Integer)tableModel.getValueAt(index, 7);
                scoredVisitor = (Integer)tableModel.getValueAt(index, 8);
                visitorTeam = (Item)tableModel.getValueAt(index, 9);
                odd_1 = (Float)tableModel.getValueAt(index, 10);
                odd_X = (Float)tableModel.getValueAt(index, 11);
                odd_2 = (Float)tableModel.getValueAt(index, 12);
                season = (Item)tableModel.getValueAt(index, 16);
                phase = (Item)tableModel.getValueAt(index, 17);
                weekNo = (Integer)tableModel.getValueAt(index, 18);
                track = (TrackChange)tableModel.getValueAt(index, 19);
                
                // Set query parameters
                cstmt.setString("Association_p", assocciation.getName().trim());
                cstmt.setString("Tournament_p", tournament.getName().trim());
                cstmt.setString("Season_p", season.getName().trim());
                cstmt.setString("Phase_p", phase.getName().trim());
                cstmt.setInt("Round_p", round);
                cstmt.setTimestamp("Time_p", time);
                cstmt.setString("HomeTeam_p", homeTeam.getName().trim());
                cstmt.setInt("ScoredHome_p", scoredHome);
                cstmt.setString("VisitorTeam_p", visitorTeam.getName().trim());
                cstmt.setInt("ScoredVisitor_p", scoredVisitor);
                cstmt.setString("Status_p", status.getName().trim());
                cstmt.setFloat("Odd_1_p", odd_1);
                cstmt.setFloat("Odd_X_p", odd_X);
                cstmt.setFloat("Odd_2_p", odd_2);
                cstmt.setInt("WeekNo_p", weekNo);
                cstmt.setLong("UserId_p", track.getModUser().getId());
                cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);

                // query execution
                cstmt.execute();
                msg = cstmt.getString("Msg_p");
                
                // next record
                index++;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String importData(TableModel tableModel) {
        Timestamp time;
        Float odd_1, odd_X, odd_2;
        Integer scoredHome, scoredVisitor;
        String tendency;
        Item phase, tournament, homeTeam, visitorTeam, status, association;
        TrackChange track;
        int maxRows = tableModel.getRowCount();
        int index = 0;
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
            "{call spCore_Import_Data(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            while (index < maxRows && msg.isEmpty()){
                // get values
                association = (Item)tableModel.getValueAt(index, 1);
                tournament = (Item)tableModel.getValueAt(index, 2);
                status = (Item)tableModel.getValueAt(index, 4);
                time = (Timestamp)tableModel.getValueAt(index, 5);
                homeTeam = (Item)tableModel.getValueAt(index, 6);
                scoredHome = (Integer)tableModel.getValueAt(index, 7);
                scoredVisitor = (Integer)tableModel.getValueAt(index, 8);
                visitorTeam = (Item)tableModel.getValueAt(index, 9);
                odd_1 = (Float)tableModel.getValueAt(index, 10);
                odd_X = (Float)tableModel.getValueAt(index, 11);
                odd_2 = (Float)tableModel.getValueAt(index, 12);
                tendency = (String)tableModel.getValueAt(index, 13);
                phase = (Item)tableModel.getValueAt(index, 17);
                track = (TrackChange)tableModel.getValueAt(index, 19);

               // Set query parameters
                cstmt.setString("Association_p", association.getName().trim());
                cstmt.setString("Tournament_p", tournament.getName().trim());
                cstmt.setString("Phase_p", phase.getName().trim());
                cstmt.setTimestamp("Time_p", time);
                cstmt.setString("HomeTeam_p", homeTeam.getName().trim());
                cstmt.setInt("ScoredHome_p", scoredHome);
                cstmt.setString("VisitorTeam_p", visitorTeam.getName().trim());
                cstmt.setInt("ScoredVisitor_p", scoredVisitor);
                cstmt.setString("Status_p", status.getName().trim());
                cstmt.setFloat("Odd_1_p", odd_1);
                cstmt.setFloat("Odd_X_p", odd_X);
                cstmt.setFloat("Odd_2_p", odd_2);
                cstmt.setString("Tendency_p", tendency.trim());
                cstmt.setLong("UserId_p", track.getModUser().getId());
                cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
                
                // query execution
                cstmt.execute();
                msg = cstmt.getString("Msg_p");
                
                // next record
                index++;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
            System.out.println(((Item)tableModel.getValueAt(index, 2)).getName());
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Fixture obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_Fixture(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setLong("FixtureId_p", obj.getId());
            cstmt.setLong("SeasonId_p", obj.getSeason().getId());
            cstmt.setLong("PhaseId_p", obj.getPhase().getId());
            cstmt.setLong("Round_p", obj.getRound());
            cstmt.setTimestamp("Time_p", obj.getTime());
            cstmt.setLong("HomeTeamId_p", obj.getHomeTeam().getId());
            cstmt.setLong("ScoredHome_p", obj.getScoredHome());
            cstmt.setLong("VisitorTeamId_p", obj.getVisitorTeam().getId());
            cstmt.setLong("ScoredVisitor_p", obj.getScoredVisitor());
            cstmt.setLong("StadiumId_p", obj.getStadium().getId());
            cstmt.setLong("RefereeId_p", obj.getReferee().getId());
            cstmt.setLong("StatusId_p", obj.getStatus().getId());
            cstmt.setFloat("Odd_1_p", obj.getOdd_1());
            cstmt.setFloat("Odd_X_p", obj.getOdd_x());
            cstmt.setFloat("Odd_2_p", obj.getOdd_2());
            cstmt.setInt("WeekNo_p", obj.getWeekNo());
            cstmt.setString("Tendency_p", obj.getTendency());
            cstmt.setLong("UserId_p", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }

    public String quickUpdate(
              long fixtureId
            , int scoreH
            , int scoreV
            , float odd_1
            , float odd_X
            , float odd_2
            , long userId){
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_QuickFixture(?,?,?,?,?,?,?,?)}");
            cstmt.setLong("FixtureId_p", fixtureId);
            cstmt.setLong("ScoredHome_p", scoreH);
            cstmt.setLong("ScoredVisitor_p", scoreV);
            cstmt.setFloat("Odd_1_p", odd_1);
            cstmt.setFloat("Odd_X_p", odd_X);
            cstmt.setFloat("Odd_2_p", odd_2);
            cstmt.setLong("UserId_p", userId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
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
                    "{call spCore_Delete_Fixture(?,?)}");
            cstmt.setLong("FixtureId_p", idObject);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }

    public List<Item> getAssociationListByDate(Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_AssociationListByDate(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("From_p", from);
            cstmt.setTimestamp("To_p", to);
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
                Item obj = new Item(
                          rs.getLong("AssociationId")
                        , rs.getString("Association")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<Item> getTournamentListByDate(Timestamp from, Timestamp to, long associationId) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_TournamentListByDate(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("From_p", from);
            cstmt.setTimestamp("To_p", to);
            cstmt.setLong("AssociationId_p", associationId);
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
                Item obj = new Item(
                          rs.getLong("TournamentId")
                        , rs.getString("Tournament")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public void updateWeekno(long seasonId) {
        CallableStatement cstmt = null;
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spUtil_Update_WeekNo(?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
    
    public void updateWeeknoByDate(Timestamp fromDate, Timestamp toDate) {
        CallableStatement cstmt = null;
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spUtil_Update_WeekNoByDate(?,?)}");
            cstmt.setTimestamp("FromDate_p", fromDate);
            cstmt.setTimestamp("ToDate_p", toDate);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
        
    public void updateWeeklyStats(long seasonId, Integer weekFrom, Integer weekTo) {
        CallableStatement cstmt = null;
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spStats_Create_WeeklyData(?,?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("From_p", weekFrom);
            cstmt.setInt("To_p", weekTo);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
    
    public void updateWeeklyStatsByDate(Timestamp fromDate, Timestamp toDate, boolean allWeeks) {
        CallableStatement cstmt = null;
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spStats_Create_WeeklyDataByDate(?,?,?)}");
            cstmt.setTimestamp("FromDate_p", fromDate);
            cstmt.setTimestamp("ToDate_p", toDate);
            cstmt.setBoolean("AllWeeks_p", allWeeks);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBFixture.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBFixture.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
}
