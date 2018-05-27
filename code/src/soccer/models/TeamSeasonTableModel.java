/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import soccer.entities.TeamSeason;

/**
 *
 * @author lespinoza
 */
public class TeamSeasonTableModel extends AbstractTableModel{
    private final List<TeamSeason> list;
    
    private final String columnNames[] = {"Association", "Tournament", "Season", "Team"};
    
    public TeamSeasonTableModel(List<TeamSeason> list){
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
        TeamSeason data = this.list.get(rowIndex);
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
                data.setTeam((Item)aValue);
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
                return list.get(rowIndex).getTeam();
            default:
                return null;
        }
    }
}
