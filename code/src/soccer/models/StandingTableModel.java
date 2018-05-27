/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import soccer.entities.Standing;

/**
 *
 * @author luis.espinoza
 */
public class StandingTableModel extends AbstractTableModel{
    private final List<Standing> list;
    private final String columnNames[] = {
          "#"
        , "Team"
        , "MP"
        , "WN"
        , "DR"
        , "LT"
        , "GL"
        , "AG"
        , "DF"
        , "Pt"
        , "L5"
    };
    
    public StandingTableModel(List<Standing> list){
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
        Standing data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0: // Position
                data.setPosition((Integer)aValue);
                break;
            case 1: // Team
                data.setTeam((Item)aValue);
                break;
            case 2: // Match Played
                data.setPlayed((Integer)aValue);
                break;
            case 3: // Win
                data.setWins((Integer)aValue);
                break;
            case 4: // Draw
                data.setDraws((Integer)aValue);
                break;
            case 5: // Lost
                data.setLosses((Integer)aValue);
                break;
            case 6: // Goals Scored
                data.setScored((Integer)aValue);
                break;
            case 7: // Goals Against
                data.setAgainst((Integer)aValue);
                break;
            case 8: // Goals Diff
                data.setDiff((Integer)aValue);
                break;
            case 9: // Points
                data.setPoints((Integer)aValue);
                break;
            case 10: // last 5
                data.setLast5((String)aValue);
            break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getPosition();
            case 1:
                return list.get(rowIndex).getTeam();
            case 2:
                return list.get(rowIndex).getPlayed();
            case 3:
                return list.get(rowIndex).getWins();
            case 4:
                return list.get(rowIndex).getDraws();
            case 5:
                return list.get(rowIndex).getLosses();
            case 6:
                return list.get(rowIndex).getScored();
            case 7:
                return list.get(rowIndex).getAgainst();
            case 8:
                return list.get(rowIndex).getDiff();
            case 9:
                return list.get(rowIndex).getPoints();
            case 10:
                return list.get(rowIndex).getLast5();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
