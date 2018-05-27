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
import soccer.entities.Team;
import security.entities.TrackChange;
import soccer.entities.TeamSeason;

/**
 *
 * @author Administrator
 */
public class DBTeam {
    DBConnection connection;

    public DBTeam(){
        connection = new DBConnection();
    }
    
    public List<Team> getList(long isActive) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Team> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_TeamList(?)}"
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
                Team module = new Team(
                          rs.getLong("TeamId")
                        , rs.getString("ShortName")
                        , rs.getString("Name")
                        , rs.getBoolean("IsActive")
                        , new Item(rs.getLong("AssociationId"),rs.getString("AssociationName"))
                        , rs.getString("Alias01")
                        , rs.getString("Alias02")
                        , rs.getString("Alias03")
                        , rs.getString("Alias04")
                        , rs.getString("Alias05")
                        , rs.getString("Alias06")
                        , rs.getString("Alias07")
                        , rs.getString("Alias08")
                        , rs.getString("Alias09")
                        , rs.getString("Alias10")
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
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Team> getListByAssociation(long associationId) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Team> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_TeamListByAssociation(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
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
                Team module = new Team(
                          rs.getLong("TeamId")
                        , rs.getString("ShortName")
                        , rs.getString("Name")
                        , rs.getBoolean("IsActive")
                        , new Item(rs.getLong("AssociationId"),rs.getString("AssociationName"))
                        , rs.getString("Alias01")
                        , rs.getString("Alias02")
                        , rs.getString("Alias03")
                        , rs.getString("Alias04")
                        , rs.getString("Alias05")
                        , rs.getString("Alias06")
                        , rs.getString("Alias07")
                        , rs.getString("Alias08")
                        , rs.getString("Alias09")
                        , rs.getString("Alias10")
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
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Team> getListBySeason(long seasonId) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Team> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_TeamListBySeason(?)}"
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
                Team module = new Team(
                          rs.getLong("TeamId")
                        , rs.getString("ShortName")
                        , rs.getString("Name")
                        , rs.getBoolean("IsActive")
                        , new Item(rs.getLong("AssociationId"),rs.getString("AssociationName"))
                        , rs.getString("Alias01")
                        , rs.getString("Alias02")
                        , rs.getString("Alias03")
                        , rs.getString("Alias04")
                        , rs.getString("Alias05")
                        , rs.getString("Alias06")
                        , rs.getString("Alias07")
                        , rs.getString("Alias08")
                        , rs.getString("Alias09")
                        , rs.getString("Alias10")
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
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public List<Item> getAvailableTeams(long associationId, long seasonId) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_AvailableTeams(?,?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("AssociationId_p", associationId);
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
                Item item = new Item(
                          rs.getLong("TeamId")
                        , rs.getString("ShortName")
                );
                list.add(item);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
    
    public String insert(Team obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Insert_Team(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setLong("AssociationId_p", obj.getAssociation().getId());
            cstmt.setString("Alias01_p", obj.getAlias01());
            cstmt.setString("Alias02_p", obj.getAlias02());
            cstmt.setString("Alias03_p", obj.getAlias03());
            cstmt.setString("Alias04_p", obj.getAlias04());
            cstmt.setString("Alias05_p", obj.getAlias05());
            cstmt.setString("Alias06_p", obj.getAlias06());
            cstmt.setString("Alias07_p", obj.getAlias07());
            cstmt.setString("Alias08_p", obj.getAlias08());
            cstmt.setString("Alias09_p", obj.getAlias09());
            cstmt.setString("Alias10_p", obj.getAlias10());
            cstmt.setLong("UserId_p", obj.getTrack().getEntryUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String registerTeam(TeamSeason obj, long usrId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
            "{call spCore_Register_Team(?,?,?,?,?,?)}");
            cstmt.setString("Association_p", obj.getAssociation().getName());
            cstmt.setString("Tournament_p", obj.getTournament().getName());
            cstmt.setString("Season_p", obj.getSeason().getName());
            cstmt.setString("Team_p", obj.getTeam().getName());
            cstmt.setLong("UserId_p", usrId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String insertSeasonTeam(long seasonId, long teamId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Insert_SeasonTeam(?,?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.setLong("TeamId_p", teamId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String update(Team obj) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Update_Team(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cstmt.setLong("TeamId_p", obj.getId());
            cstmt.setString("ShortName_p", obj.getShortName());
            cstmt.setString("Name_p", obj.getName());
            cstmt.setBoolean("IsActive_p", obj.getIsActive());
            cstmt.setLong("AssociationId_p", obj.getAssociation().getId());
            cstmt.setString("Alias01_p", obj.getAlias01());
            cstmt.setString("Alias02_p", obj.getAlias02());
            cstmt.setString("Alias03_p", obj.getAlias03());
            cstmt.setString("Alias04_p", obj.getAlias04());
            cstmt.setString("Alias05_p", obj.getAlias05());
            cstmt.setString("Alias06_p", obj.getAlias06());
            cstmt.setString("Alias07_p", obj.getAlias07());
            cstmt.setString("Alias08_p", obj.getAlias08());
            cstmt.setString("Alias09_p", obj.getAlias09());
            cstmt.setString("Alias10_p", obj.getAlias10());
            cstmt.setLong("UserId_p", obj.getTrack().getModUser().getId());
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
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
                    "{call spCore_Delete_Team(?,?)}");
            cstmt.setLong("TeamId_p", idObject);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    }
    
    public String deleteSeasonTeams(long seasonId) {
        CallableStatement cstmt = null;
        String msg = "";
        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                    "{call spCore_Delete_SeasonTeams(?,?)}");
            cstmt.setLong("SeasonId_p", seasonId);
            cstmt.registerOutParameter("Msg_p", java.sql.Types.VARCHAR);
            cstmt.execute();
            msg = cstmt.getString("Msg_p");
        } catch (Exception ex) {
            Logger.getLogger(DBTeam.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBTeam.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return msg;
    } 
}
