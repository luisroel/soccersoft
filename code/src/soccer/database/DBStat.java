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
import security.database.DBConnection;
import security.entities.Item;
import soccer.entities.Stat;
import security.entities.TrackChange;
import soccer.entities.NormalProb;
import soccer.entities.Probability;
import soccer.entities.Rawdata;
import soccer.entities.Standing;
import soccer.entities.BasicStats;
import soccer.entities.Simulation;
import soccer.entities.Strength;

/**
 *
 * @author Administrator
 */
public class DBStat {
    DBConnection connection;

    public DBStat(){
        connection = new DBConnection();
    }
    
    public List<Stat> getList(long isActive) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Stat> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_StatList(?)}"
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
                Stat node = new Stat(
                          rs.getLong("StatId")
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
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Standing> getOverallLiveStanding(long seasonId, long phaseId, Timestamp date) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_OverallLiveStanding(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setTimestamp("CutoffDate_p", date);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , 0
                    , rs.getInt("Pos")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Ply")
                    , rs.getInt("Win")
                    , rs.getInt("Drw")
                    , rs.getInt("Lss")
                    , rs.getInt("Gls")
                    , rs.getInt("Agn")
                    , rs.getInt("Dif")
                    , rs.getInt("Pts")
                    , rs.getString("L5")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Standing> getHomeLiveStanding(long seasonId, long phaseId, Timestamp date) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_HomeLiveStanding(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setTimestamp("CutoffDate_p", date);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , 0
                    , rs.getInt("Pos")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Ply")
                    , rs.getInt("Win")
                    , rs.getInt("Drw")
                    , rs.getInt("Lss")
                    , rs.getInt("Gls")
                    , rs.getInt("Agn")
                    , rs.getInt("Dif")
                    , rs.getInt("Pts")
                    , rs.getString("L5")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Standing> getAwayLiveStanding(long seasonId, long phaseId, Timestamp date) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_AwayLiveStanding(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("PhaseId_p", phaseId);
            cstmt.setTimestamp("CutoffDate_p", date);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , 0
                    , rs.getInt("Pos")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Ply")
                    , rs.getInt("Win")
                    , rs.getInt("Drw")
                    , rs.getInt("Lss")
                    , rs.getInt("Gls")
                    , rs.getInt("Agn")
                    , rs.getInt("Dif")
                    , rs.getInt("Pts")
                    , rs.getString("L5")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Standing> getOverallStanding(long seasonId, int weekNo) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_OverallStanding(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("WeekNo_p", weekNo);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , rs.getInt("WeekNo")
                    , rs.getInt("Position")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Played")
                    , rs.getInt("Wins")
                    , rs.getInt("Draws")
                    , rs.getInt("Losses")
                    , rs.getInt("Scored")
                    , rs.getInt("Against")
                    , rs.getInt("Diff")
                    , rs.getInt("Points")
                    , "?????"
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
        
    public List<Standing> getHomeStanding(long seasonId, int weekNo) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_HomeStanding(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("WeekNo_p", weekNo);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , rs.getInt("WeekNo")
                    , rs.getInt("Position")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Played")
                    , rs.getInt("Wins")
                    , rs.getInt("Draws")
                    , rs.getInt("Losses")
                    , rs.getInt("Scored")
                    , rs.getInt("Against")
                    , rs.getInt("Diff")
                    , rs.getInt("Points")
                    , "?????"
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Standing> getAwayStanding(long seasonId, int weekNo) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Standing> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_VisitStanding(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("WeekNo_p", weekNo);
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
                Standing node = new Standing(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , rs.getInt("WeekNo")
                    , rs.getInt("Position")
                    , new Item(rs.getLong("TeamId"),rs.getString("Team"))
                    , rs.getInt("Played")
                    , rs.getInt("Wins")
                    , rs.getInt("Draws")
                    , rs.getInt("Losses")
                    , rs.getInt("Scored")
                    , rs.getInt("Against")
                    , rs.getInt("Diff")
                    , rs.getInt("Points")
                    , "?????"
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    
    public List<NormalProb> getNormalProb(long seasonId, int weekNo) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<NormalProb> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_NormalProb(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("WeekNo_p", weekNo);
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
                NormalProb node = new NormalProb(
                      new Item(rs.getLong("SeasonId"),rs.getString("Season"))
                    , rs.getInt("Diff")
                    , rs.getInt("Frecuency")
                    , rs.getInt("Max")
                    , rs.getInt("Min")
                    , rs.getFloat("Avg")
                    , rs.getFloat("Std")
                    , rs.getFloat("Prob")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<BasicStats> getStatsGoals7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<BasicStats> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7Stats(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7Stats(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7Stats(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7Stats(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7Stats(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7Stats(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7Stats(?,?)}";
                break;                

            case 6:
                sqlStr = "{call spStats_Get_WinFullStats(?,?)}";
                break;
            case 7:
                sqlStr = "{call spStats_Get_WinWinFullStats(?,?)}";
                break;
            case 8:
                sqlStr = "{call spStats_Get_WinTieFullStats(?,?)}";
                break;
            case 9:
                sqlStr = "{call spStats_Get_TieWinFullStats(?,?)}";
                break;
                
                
            default:
                sqlStr = "{call spStats_Get_Home7Stats(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                BasicStats node = new BasicStats(
                      rs.getLong("SeasonId")
                    , rs.getLong("FixtureId")
                    , rs.getInt("WeekNo")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Odd_1")
                    , rs.getFloat("Odd_X")
                    , rs.getFloat("Odd_2")
                    , rs.getString("Last5_H")
                    , rs.getString("Last5_V")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("Diff")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getFloat("Odd")
                    , rs.getInt("Ok")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<Probability> getProbGoals7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Probability> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7Prob(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7Prob(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7Prob(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7Prob(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7Prob(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7Prob(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7Prob(?,?)}";
                break;
                
            case 6:
                sqlStr = "{call spStats_Get_WinFullProb(?,?)}";
                break;
            case 7:
                sqlStr = "{call spStats_Get_WinWinFullProb(?,?)}";
                break;
            case 8:
                sqlStr = "{call spStats_Get_WinTieFullProb(?,?)}";
                break;
            case 9:
                sqlStr = "{call spStats_Get_TieWinFullProb(?,?)}";
                break;
                                
            default:
                sqlStr = "{call spStats_Get_Home7Prob(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Probability node = new Probability(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Strength> getStrengthGoals7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Strength> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7Strength(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7Strength(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7Strength(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7Strength(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7Strength(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7Strength(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7Strength(?,?)}";
                break;
                
            case 6:
                sqlStr = "{call spStats_Get_WinFullStrength(?,?)}";
                break;
            case 7:
                sqlStr = "{call spStats_Get_WinWinFullStrength(?,?)}";
                break;
            case 8:
                sqlStr = "{call spStats_Get_WinTieFullStrength(?,?)}";
                break;
            case 9:
                sqlStr = "{call spStats_Get_TieWinFullStrength(?,?)}";
                break;                
                
            default:
                sqlStr = "{call spStats_Get_Home7Strength(?,?)}";
                break;
        }
        
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Strength node = new Strength(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    
    public List<BasicStats> getStatsGoalsA(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<BasicStats> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_WinAllStats(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWinAllStats(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTieAllStats(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWinAllStats(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_AllAllStats(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_VisitAllStats(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_HomeAllStats(?,?)}";
                break;
                
            default:
                sqlStr = "{call spStats_Get_HomeAllStats(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                BasicStats node = new BasicStats(
                      rs.getLong("SeasonId")
                    , rs.getLong("FixtureId")
                    , rs.getInt("WeekNo")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Odd_1")
                    , rs.getFloat("Odd_X")
                    , rs.getFloat("Odd_2")
                    , rs.getString("Last5_H")
                    , rs.getString("Last5_V")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("Diff")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getFloat("Odd")
                    , rs.getInt("Ok")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<Probability> getProbGoalsA(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Probability> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_WinAllProb(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWinAllProb(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTieAllProb(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWinAllProb(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_AllAllProb(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_VisitAllProb(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_HomeAllProb(?,?)}";
                break;
                
            default:
                sqlStr = "{call spStats_Get_HomeAllProb(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Probability node = new Probability(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Strength> getStrengthGoalsA(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Strength> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_WinAllStrength(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWinAllStrength(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTieAllStrength(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWinAllStrength(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_AllAllStrength(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_VisitAllStrength(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_HomeAllStrength(?,?)}";
                break;                
                
            default:
                sqlStr = "{call spStats_Get_HomeAllStrength(?,?)}";
                break;
        }
        
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Strength node = new Strength(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<BasicStats> getStatsPoints7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<BasicStats> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7PtsStats(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7PtsStats(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7PtsStats(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7PtsStats(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7PtsStats(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7PtsStats(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7PtsStats(?,?)}";
                break;                                
                
            default:
                sqlStr = "{call spStats_Get_Home8PtsStats(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                BasicStats node = new BasicStats(
                      rs.getLong("SeasonId")
                    , rs.getLong("FixtureId")
                    , rs.getInt("WeekNo")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Odd_1")
                    , rs.getFloat("Odd_X")
                    , rs.getFloat("Odd_2")
                    , rs.getString("Last5_H")
                    , rs.getString("Last5_V")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("Diff")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getFloat("Odd")
                    , rs.getInt("Ok")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }

    public List<Probability> getProbPoints7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Probability> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7PtsProb(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7PtsProb(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7PtsProb(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7PtsProb(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7PtsProb(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7PtsProb(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7PtsProb(?,?)}";
                break;
                                                
            default:
                sqlStr = "{call spStats_Get_Home7PtsProb(?,?)}";
                break;
        }

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Probability node = new Probability(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Strength> getStrengthPoints7(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Strength> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7PtsStrength(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7PtsStrength(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7PtsStrength(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7PtsStrength(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7PtsStrength(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7PtsStrength(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7PtsStrength(?,?)}";
                break;
                
            default:
                sqlStr = "{call spStats_Get_Home7PtsStrength(?,?)}";
                break;
        }
        
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Strength node = new Strength(
                      rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getString("Rsl")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Simulation> getSimulation(long spId, Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Simulation> list = new ArrayList<>();
        String sqlStr;
        int id = (int)spId;
        
        switch (id){
            case 1:
                sqlStr = "{call spStats_Get_Win7Simulation(?,?)}";
                break;
            case 2:
                sqlStr = "{call spStats_Get_WinWin7Simulation(?,?)}";
                break;
            case 3:
                sqlStr = "{call spStats_Get_WinTie7Simulation(?,?)}";
                break;
            case 4:
                sqlStr = "{call spStats_Get_TieWin7Simulation(?,?)}";
                break;
            case 5:
                sqlStr = "{call spStats_Get_All7Simulation(?,?)}";
                break;
            case 10:
                sqlStr = "{call spStats_Get_Visit7Simulation(?,?)}";
                break;
            case 11:
                sqlStr = "{call spStats_Get_Home7Simulation(?,?)}";
                break;
                
            case 6:
                sqlStr = "{call spStats_Get_WinFullSimulation(?,?)}";
                break;
            case 7:
                sqlStr = "{call spStats_Get_WinWinFullSimulation(?,?)}";
                break;
            case 8:
                sqlStr = "{call spStats_Get_WinTieFullSimulation(?,?)}";
                break;
            case 9:
                sqlStr = "{call spStats_Get_TieWinFullSimulation(?,?)}";
                break;
                
                
            default:
                sqlStr = "";
                break;
        }
        
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      sqlStr
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
                Simulation node = new Simulation(
                      rs.getString("Type")
                    , rs.getLong("FixtureId")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("Time")
                    , 0
                    , rs.getString("Home")
                    , rs.getString("Visitor")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getInt("Ok")
                    , rs.getFloat("Odd")
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                    , new Float(0.0)
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Rawdata> getPredictionWins(Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Rawdata> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_PredictionWins_t(?,?)}"
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
                Rawdata node = new Rawdata(
                      rs.getTimestamp("Date")
                    , rs.getString("Type")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("time")
                    , rs.getString("Home")
                    , rs.getString("Visit")
                    , rs.getLong("SeasonId")
                    , rs.getInt("WeekNo")
                    , rs.getLong("FixtureId")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getFloat("Diff")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getInt("Ok")
                    , rs.getFloat("Odd")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Rawdata> getHomeAndDrawWins(Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Rawdata> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_HomeAndDrawWins_t(?,?)}"
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
                Rawdata node = new Rawdata(
                      rs.getTimestamp("Date")
                    , rs.getString("Type")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("time")
                    , rs.getString("Home")
                    , rs.getString("Visit")
                    , rs.getLong("SeasonId")
                    , rs.getInt("WeekNo")
                    , rs.getLong("FixtureId")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getFloat("Diff")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getInt("Ok")
                    , rs.getFloat("Odd")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Rawdata> getDoublePredictionWins(Timestamp from, Timestamp to) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Rawdata> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_DoublePredictionWins_t(?,?)}"
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
                Rawdata node = new Rawdata(
                      rs.getTimestamp("Date")
                    , rs.getString("Type")
                    , rs.getString("Association")
                    , rs.getString("Tournament")
                    , rs.getTimestamp("time")
                    , rs.getString("Home")
                    , rs.getString("Visit")
                    , rs.getLong("SeasonId")
                    , rs.getInt("WeekNo")
                    , rs.getLong("FixtureId")
                    , rs.getFloat("THAGS")
                    , rs.getFloat("TVAGC")
                    , rs.getFloat("TVAGS")
                    , rs.getFloat("THAGC")
                    , rs.getFloat("THAS")
                    , rs.getFloat("TVDS")
                    , rs.getFloat("TVAS")
                    , rs.getFloat("THDS")
                    , rs.getFloat("SASH")
                    , rs.getFloat("SASV")
                    , rs.getFloat("OH")
                    , rs.getFloat("OV")
                    , rs.getFloat("POH_0")
                    , rs.getFloat("POH_1")
                    , rs.getFloat("POH_2")
                    , rs.getFloat("POH_3")
                    , rs.getFloat("POH_4")
                    , rs.getFloat("POH_5")
                    , rs.getFloat("POH_6")
                    , rs.getFloat("POV_0")
                    , rs.getFloat("POV_1")
                    , rs.getFloat("POV_2")
                    , rs.getFloat("POV_3")
                    , rs.getFloat("POV_4")
                    , rs.getFloat("POV_5")
                    , rs.getFloat("POV_6")
                    , rs.getFloat("Pb_Home")
                    , rs.getFloat("Pb_Draw")
                    , rs.getFloat("Pb_Visit")
                    , rs.getFloat("Max_POH")
                    , rs.getFloat("Max_POV")
                    , rs.getFloat("Max_OH")
                    , rs.getFloat("Max_OV")
                    , rs.getFloat("Diff")
                    , rs.getInt("SH")
                    , rs.getInt("SV")
                    , rs.getString("FC")
                    , rs.getString("Rsl")
                    , rs.getInt("Ok")
                    , rs.getFloat("Odd")
                );
                list.add(node);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public void updateWeeklyStats(long seasonId, int weekNo) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spstats_create_weeklydata(?, ?, ?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setInt("From_p", weekNo);
            cstmt.setInt("To_p", weekNo);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
    
    public String insert(Stat obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call dbo.spCore_Insert_Stat(?,?,?,?)}");
            cstmt.setString("Name", obj.getName());
            cstmt.setString("ShortName", obj.getShortName());
            cstmt.setLong("UserId", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Stat obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_Stat(?,?,?,?,?,?)}");
            cstmt.setLong("StatId", obj.getId());
            cstmt.setString("Name", obj.getName());
            cstmt.setString("ShortName", obj.getShortName());
            cstmt.setBoolean("IsActive", obj.getIsActive());
            cstmt.setLong("UserId", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
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
                    "{call spCore_Delete_Stat(?,?)}");
            cstmt.setLong("StatId", idObject);
            cstmt.registerOutParameter("Msg", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg");
        } catch (Exception ex) {
            Logger.getLogger(DBStat.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBStat.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }    
}
