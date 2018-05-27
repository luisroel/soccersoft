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
import soccer.entities.Summary;
import soccer.entities.TableData;

/**
 *
 * @author luis.espinoza
 */
public class DBTableData {
    DBConnection connection;

    public DBTableData(){
        connection = new DBConnection();
    }
    
    public List<TableData> getList(Timestamp fromDate, Timestamp toDate) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<TableData> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spstats_get_tabledatalist(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("from_p", fromDate);
            cstmt.setTimestamp("to_p", toDate);
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
                TableData obj = new TableData(
                    rs.getInt("NO")
                  , new Item(rs.getLong("AssociationId"), rs.getString("CT"))
                  , new Item(rs.getLong("TournamentId"),rs.getString("LG"))
                  , new Item(rs.getLong("SeasonId"),rs.getString("SS"))
                  , new Item(rs.getLong("PhaseId"),rs.getString("PH"))
                  , rs.getTimestamp("DT")
                  , new Item(rs.getLong("HomeTeamId"),rs.getString("HM"))
                  , new Item(rs.getLong("VisitorTeamId"),rs.getString("VS"))
                  , rs.getInt("SH")
                  , rs.getInt("SV")
                  , rs.getString("RSL")
                  , rs.getFloat("O1")
                  , rs.getFloat("OX")
                  , rs.getFloat("O2")
                  , rs.getFloat("VAL")
                  , rs.getInt("PW1")
                  , rs.getInt("PWX")
                  , rs.getInt("PW2")
                  , rs.getInt("GSH")
                  , rs.getInt("GAH")
                  , rs.getInt("PTH")
                  , rs.getString("LH")
                  , rs.getInt("GSV")
                  , rs.getInt("GAV")
                  , rs.getInt("PTV")
                  , rs.getString("LV")
                  , rs.getFloat("DPT")
                  , rs.getFloat("DFT")
                  , rs.getInt("DFS")
                  , rs.getInt("DFA")
                  , rs.getInt("DFH")
                  , rs.getInt("DFV")
                  , rs.getFloat("DGS")
                  , rs.getFloat("DGA")
                  , rs.getFloat("GPR")
                  , rs.getFloat("PWI")
                  , rs.getFloat("PDR")
                  , rs.getFloat("PLT")
                  , rs.getString("TD")
                  , rs.getFloat("DO1")
                  , rs.getFloat("DOX")
                  , rs.getFloat("DO2")
                  , rs.getString("mask")
                  , rs.getInt("lvd")
                  , rs.getFloat("prc1")
                  , rs.getFloat("prcX")
                  , rs.getFloat("prc2")
                  , rs.getLong("fixtureid")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }        

    public List<TableData> getListByGoals(Timestamp fromDate, Timestamp toDate) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<TableData> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spstats_get_tabledatalistbygoals(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("from_p", fromDate);
            cstmt.setTimestamp("to_p", toDate);

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
                TableData obj = new TableData(
                    rs.getInt("NO")
                  , new Item(rs.getLong("AssociationId"), rs.getString("CT"))
                  , new Item(rs.getLong("TournamentId"),rs.getString("LG"))
                  , new Item(rs.getLong("SeasonId"),rs.getString("SS"))
                  , new Item(rs.getLong("PhaseId"),rs.getString("PH"))
                  , rs.getTimestamp("DT")
                  , new Item(rs.getLong("HomeTeamId"),rs.getString("HM"))
                  , new Item(rs.getLong("VisitorTeamId"),rs.getString("VS"))
                  , rs.getInt("SH")
                  , rs.getInt("SV")
                  , rs.getString("RSL")
                  , rs.getFloat("O1")
                  , rs.getFloat("OX")
                  , rs.getFloat("O2")
                  , rs.getFloat("VAL")
                  , rs.getInt("PW1")
                  , rs.getInt("PWX")
                  , rs.getInt("PW2")
                  , rs.getInt("GSH")
                  , rs.getInt("GAH")
                  , rs.getInt("PTH")
                  , rs.getString("LH")
                  , rs.getInt("GSV")
                  , rs.getInt("GAV")
                  , rs.getInt("PTV")
                  , rs.getString("LV")
                  , rs.getFloat("DPT")
                  , rs.getFloat("DFT")
                  , rs.getInt("DFS")
                  , rs.getInt("DFA")
                  , rs.getInt("DFH")
                  , rs.getInt("DFV")
                  , rs.getFloat("DGS")
                  , rs.getFloat("DGA")
                  , rs.getFloat("GPR")
                  , rs.getFloat("PWI")
                  , rs.getFloat("PDR")
                  , rs.getFloat("PLT")
                  , rs.getString("TD")
                  , rs.getFloat("DO1")
                  , rs.getFloat("DOX")
                  , rs.getFloat("DO2")
                  , rs.getString("mask")
                  , rs.getInt("lvd")
                  , rs.getFloat("prc1")
                  , rs.getFloat("prcX")
                  , rs.getFloat("prc2")
                  , rs.getLong("fixtureid")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }        
    
    public List<TableData> getTableDataMask(Timestamp fromDate, Timestamp toDate, float fromValue, float toValue, String mask) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<TableData> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spStats_Get_TableDataMask(?,?,?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("from_p", fromDate);
            cstmt.setTimestamp("to_p", toDate);
            cstmt.setFloat("pwi_from_p", fromValue);
            cstmt.setFloat("pwi_to_p", toValue);
            cstmt.setString("mask_p", mask);
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
                TableData obj = new TableData(
                    rs.getInt("NO")
                  , new Item(rs.getLong("AssociationId"), rs.getString("CT"))
                  , new Item(rs.getLong("TournamentId"),rs.getString("LG"))
                  , new Item(rs.getLong("SeasonId"),rs.getString("SS"))
                  , new Item(rs.getLong("PhaseId"),rs.getString("PH"))
                  , rs.getTimestamp("DT")
                  , new Item(rs.getLong("HomeTeamId"),rs.getString("HM"))
                  , new Item(rs.getLong("VisitorTeamId"),rs.getString("VS"))
                  , rs.getInt("SH")
                  , rs.getInt("SV")
                  , rs.getString("RSL")
                  , rs.getFloat("O1")
                  , rs.getFloat("OX")
                  , rs.getFloat("O2")
                  , rs.getFloat("VAL")
                  , rs.getInt("PW1")
                  , rs.getInt("PWX")
                  , rs.getInt("PW2")
                  , rs.getInt("GSH")
                  , rs.getInt("GAH")
                  , rs.getInt("PTH")
                  , rs.getString("LH")
                  , rs.getInt("GSV")
                  , rs.getInt("GAV")
                  , rs.getInt("PTV")
                  , rs.getString("LV")
                  , rs.getFloat("DPT")
                  , rs.getFloat("DFT")
                  , rs.getInt("DFS")
                  , rs.getInt("DFA")
                  , rs.getInt("DFH")
                  , rs.getInt("DFV")
                  , rs.getFloat("DGS")
                  , rs.getFloat("DGA")
                  , rs.getFloat("GPR")
                  , rs.getFloat("PWI")
                  , rs.getFloat("PDR")
                  , rs.getFloat("PLT")
                  , rs.getString("TD")
                  , rs.getFloat("DO1")
                  , rs.getFloat("DOX")
                  , rs.getFloat("DO2")
                  , rs.getString("mask")
                  , rs.getInt("lvd")
                  , rs.getFloat("prc1")
                  , rs.getFloat("prcX")
                  , rs.getFloat("prc2")
                  , rs.getLong("fixtureid")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }        

    public List<Summary> getSummaryResults(Timestamp fromDate, int hour, int days) {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Summary> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spstats_get_summaryresults(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("current_date_p", fromDate);
            cstmt.setFloat("hour_p", hour);
            cstmt.setFloat("days_p", days);
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
                Summary obj = new Summary(
                    new Item(rs.getLong("associationid"), rs.getString("association"))
                  , new Item(rs.getLong("tournamentid"),rs.getString("tournament"))
                  , new Item(rs.getLong("seasonid"),rs.getString("season"))
                  , new Item(rs.getLong("phaseid"),rs.getString("phase"))
                  , rs.getInt("plays")
                  , rs.getInt("homes")
                  , rs.getInt("draws")
                  , rs.getInt("visitors")
                );
                list.add(obj);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    } 
    
    public void createRawData(Timestamp fromDate, Timestamp toDate) {
        CallableStatement cstmt = null;
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spstats_create_tabledatalist(?,?)}");
            cstmt.setTimestamp("from_p", fromDate);
            cstmt.setTimestamp("to_p", toDate);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
    
    public void createGoalsProjection(Timestamp fromDate, Timestamp toDate) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spstats_create_goalsprojection(?,?)}");
            cstmt.setTimestamp("from_p", fromDate);
            cstmt.setTimestamp("to_p", toDate);
            cstmt.execute();
        } catch (Exception ex) {
            Logger.getLogger(DBTableData.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTableData.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
    }
    
    /*
    public List<Item> getAssociationListByDate(Timestamp fromDate, Timestamp toDate) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_AssociationListByDate(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("From_p", fromDate);
            cstmt.setTimestamp("To_p", toDate);
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

    public List<Item> getTournamentListByDate(Timestamp fromDate, Timestamp toDate, long id) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_TournamentListByDate(?,?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setTimestamp("From_p", fromDate);
            cstmt.setTimestamp("To_p", toDate);
            cstmt.setLong("AssociationId_p", id);
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
*/

}
