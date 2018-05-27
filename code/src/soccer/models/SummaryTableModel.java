/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import soccer.entities.Summary;

/**
 *
 * @author lespinoza
 */
public class SummaryTableModel extends AbstractTableModel{
    private final List<Summary> list;
    private final String columnNames[] = { 
              "Association"
            , "Tournament"
            , "Season"
            , "Phase"
            , "Plays"
            , "Homes"
            , "Draws"
            , "Visitors"
    };
    
    public SummaryTableModel(List<Summary> list){
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
        Summary data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setAssociation((Item)aValue);
                break;
            case 1:
                data.setTournament((Item)aValue);
                break;
            case 2:
                data.setSeason((Item)aValue);
                break;
            case 3:
                data.setPhase((Item)aValue);
                break;
            case 4:
                data.setPlays((Integer)aValue);
                break;
            case 5:
                data.setHomes((Integer)aValue);
                break;
            case 6:
                data.setDraws((Integer)aValue);
                break;
            case 7:
                data.setVisitors((Integer)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getAssociation();
            case 1:
                return list.get(rowIndex).getTournament();
            case 2:
                return list.get(rowIndex).getSeason();
            case 3:
                return list.get(rowIndex).getPhase();
            case 4:
                return list.get(rowIndex).getPlays();
            case 5:
                return list.get(rowIndex).getHomes();
            case 6:
                return list.get(rowIndex).getDraws();
            case 7:
                return list.get(rowIndex).getVisitors();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
