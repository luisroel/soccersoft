/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import security.entities.TrackChange;
import soccer.entities.Fixture;

/**
 *
 * @author luis.espinoza
 */
public class FixtureTableModel extends AbstractTableModel{
    
    private final List<Fixture> list;
    private final String columnNames[] = {
          "Id"
        , "Assoc"
        , "League"
        , "Round"
        , "Sts"
        , "Time"
        , "Home"
        , "SH"
        , "SV"
        , "Visitor"
        , "Odd 1"
        , "Odd X"
        , "Odd 2"
        , "Tncy"
        , "Stadium"
        , "Referee"
        , "Season"
        , "Phase"
        , "Week"
        , "Mod. User"
    };
    
    public FixtureTableModel(List<Fixture> list){
        this.list = list;
    }

    @Override
    public String getColumnName(int column) {
        return this.columnNames[column];
    }
    
    @Override
    public int getRowCount() {
        return this.list.size();
    }

    @Override
    public int getColumnCount() {
        return this.columnNames.length;
    }

    @Override
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        Fixture data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:     // Id
                data.setId((Long)aValue);
                break;
            case 1:     // Association
                data.setAssociation((Item)aValue);
                break;
            case 2:     // League: Tournament
                data.setTournament((Item)aValue);
                break;                
            case 3:     // Round
                data.setRound((Integer)aValue);
                break;
            case 4:     // Sts: Status
                data.setStatus((Item)aValue);
                break;                
            case 5:     // Time
                data.setTime((Timestamp)aValue);
                break;
            case 6:     // Home Team
                data.setHomeTeam((Item)aValue);
                break;
            case 7:     // SH: Scored Home
                data.setScoredHome((Integer)aValue);
                break;
            case 8:     // SV: Scored Visitor
                data.setScoredVisitor((Integer)aValue);
                break;
            case 9:     // Visitor
                data.setVisitorTeam((Item)aValue);
                break;
            case 10:     // Odd_1
                data.setOdd_1((Float)aValue);
                break;
            case 11:     // Odd_X
                data.setOdd_x((Float)aValue);
                break;
            case 12:     // Odd_2
                data.setOdd_2((Float)aValue);
                break;
            case 13:     // Tendency
                data.setTendency((String)aValue);
                break;                
            case 14:     // Stadium
                data.setStadium((Item)aValue);
                break;
            case 15:     // Referee
                data.setReferee((Item)aValue);
                break;
            case 16:     // Season
                data.setSeason((Item)aValue);
                break;
            case 17:     // Phase
                data.setPhase((Item)aValue);
                break;                
            case 18:     // WeekNo
                data.setWeekNo((Integer)aValue);
                break;                
            case 19:    // Tracking changes
                data.setTrack((TrackChange)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:     // Id
                return this.list.get(rowIndex).getId();
            case 1:     // Association
                return this.list.get(rowIndex).getAssociation();
            case 2:     // Tournament
                return this.list.get(rowIndex).getTournament();
            case 3:     // Round
                return this.list.get(rowIndex).getRound();
            case 4:     // Status
                return this.list.get(rowIndex).getStatus();
            case 5:     // Time
                return this.list.get(rowIndex).getTime();
            case 6:     // Home Team
                return this.list.get(rowIndex).getHomeTeam();
            case 7:     // SH: Scored Home
                return this.list.get(rowIndex).getScoredHome();
            case 8:     // SV: Scored Visitor
                return this.list.get(rowIndex).getScoredVisitor();
            case 9:     // Visitor
                return this.list.get(rowIndex).getVisitorTeam();
            case 10:     // Odd_1
                return this.list.get(rowIndex).getOdd_1();
            case 11:     // Odd_X
                return this.list.get(rowIndex).getOdd_x();
            case 12:     // Odd_2
                return this.list.get(rowIndex).getOdd_2();
            case 13:     // Tendency
                return this.list.get(rowIndex).getTendency();
            case 14:     // Stadium
                return this.list.get(rowIndex).getStadium();
            case 15:     // Referee
                return this.list.get(rowIndex).getReferee();
            case 16:     // Season
                return this.list.get(rowIndex).getSeason();
            case 17:     // Phase
                return this.list.get(rowIndex).getPhase();
            case 18:    // WeekNo
                return this.list.get(rowIndex).getWeekNo();
            case 19:    // Track changes
                return this.list.get(rowIndex).getTrack();
            default:
                return null;
        }
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
