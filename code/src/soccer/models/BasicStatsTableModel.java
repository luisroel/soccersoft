/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.BasicStats;

/**
 *
 * @author luis.espinoza
 */
public class BasicStatsTableModel extends AbstractTableModel{
    private final List<BasicStats> list;
    private final String columnNames[] = { 
              "SeasonId"
            , "FixtureId"
            , "WeekNo"
            , "Association"
            , "Tournament"
            , "Time"
            , "Home"
            , "Visit"
            , "Odd_1"
            , "Odd_X"
            , "Odd_2"
            , "Last5H"
            , "Last5V"
            , "OH"
            , "OV"
            , "Diff"
            , "Max_OH"
            , "Max_OV"
            , "SH"
            , "SV"
            , "FC"
            , "Rsl"
            , "Odd_2"
            , "Ok"
    };
    
    public BasicStatsTableModel(List<BasicStats> list){
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
        BasicStats data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setSeasonId((Long)aValue);
                break;
            case 1:
                data.setFixtureId((Long)aValue);
                break;
            case 2:
                data.setWeekno((Integer)aValue);
                break;
            case 3:
                data.setAssociation((String)aValue);
                break;
            case 4:
                data.setTournament((String)aValue);
                break;
            case 5:
                data.setTime((Timestamp)aValue);
                break;
            case 6:
                data.setHome((String)aValue);
                break;
            case 7:
                data.setVisit((String)aValue);
                break;
            case 8:
                data.setOdd_1((Float)aValue);
                break;
            case 9:
                data.setOdd_x((Float)aValue);
                break;
            case 10:
                data.setOdd_2((Float)aValue);
                break;
            case 11:
                data.setLast5H((String)aValue);
                break;
            case 12:
                data.setLast5V((String)aValue);
                break;
            case 13:
                data.setOH((Float)aValue);
                break;
            case 14:
                data.setOV((Float)aValue);
                break;
            case 15:
                data.setDiff((Float)aValue);
                break;
            case 16:
                data.setMax_OH((Float)aValue);
                break;
            case 17:
                data.setMax_OV((Float)aValue);
                break;
            case 18:
                data.setSH((Integer)aValue);
                break;
            case 19:
                data.setSV((Integer)aValue);
                break;
            case 20:
                data.setFC((String)aValue);
                break;
            case 21:
                data.setRsl((String)aValue);
                break;
            case 22:
                data.setOdd((Float)aValue);
                break;
            case 23:
                data.setOk((Integer)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getSeasonId();
            case 1:
                return list.get(rowIndex).getFixtureId();
            case 2:
                return list.get(rowIndex).getWeekno();
            case 3:
                return list.get(rowIndex).getAssociation();
            case 4:
                return list.get(rowIndex).getTournament();
            case 5:
                return list.get(rowIndex).getTime();
            case 6:
                return list.get(rowIndex).getHome();
            case 7:
                return list.get(rowIndex).getVisit();
            case 8:
                return list.get(rowIndex).getOdd_1();
            case 9:
                return list.get(rowIndex).getOdd_x();
            case 10:
                return list.get(rowIndex).getOdd_2();
            case 11:
                return list.get(rowIndex).getLast5H();
            case 12:
                return list.get(rowIndex).getLast5V();
            case 13:
                return list.get(rowIndex).getOH();
            case 14:
                return list.get(rowIndex).getOV();
            case 15:
                return list.get(rowIndex).getDiff();
            case 16:
                return list.get(rowIndex).getMax_OH();
            case 17:
                return list.get(rowIndex).getMax_OV();
            case 18:
                return list.get(rowIndex).getSH();
            case 19:
                return list.get(rowIndex).getSV();
            case 20:
                return list.get(rowIndex).getFC();
            case 21:
                return list.get(rowIndex).getRsl();
            case 22:
                return list.get(rowIndex).getOdd();
            case 23:
                return list.get(rowIndex).getOk();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
