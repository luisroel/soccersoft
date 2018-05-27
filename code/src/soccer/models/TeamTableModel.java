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
import soccer.entities.Team;

/**
 *
 * @author luis.espinoza
 */
public class TeamTableModel extends AbstractTableModel{

    private final List<Team> list;
    private final String columnNames[] = {"Id", "Short", "Full", "Sts", "Association", "Alias 1", "Alias 2", "Alias 3", "Alias 4", "Alias 5", "Alias 6", "Alias 7", "Alias 8", "Alias 9", "Alias 10", "Mod. User"};

    public TeamTableModel(List<Team> list){
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
        Team data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:     // Id
                data.setId((Long)aValue);
                break;
            case 1:     // shortName
                data.setShortName((String)aValue);
                break;
            case 2:     // Name
                data.setName((String)aValue);
                break;
            case 3:     // IsActive
                data.setIsActive((Boolean)aValue);
                break;
            case 4:     // Association
                data.setAssociation((Item)aValue);
                break;
            case 5:     // Alias01
                data.setAlias01((String)aValue);
                break;
            case 6:     // Alias02
                data.setAlias02((String)aValue);
                break;
            case 7:     // Alias03
                data.setAlias03((String)aValue);
                break;
            case 8:     // Alias04
                data.setAlias04((String)aValue);
                break;
            case 9:     // Alias05
                data.setAlias05((String)aValue);
                break;
            case 10:     // Alias06
                data.setAlias06((String)aValue);
                break;
            case 11:     // Alias07
                data.setAlias07((String)aValue);
                break;
            case 12:     // Alias08
                data.setAlias08((String)aValue);
                break;
            case 13:     // Alias09
                data.setAlias09((String)aValue);
                break;
            case 14:     // Alias10
                data.setAlias10((String)aValue);
                break;
            case 15:    // Tracking changes
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
            case 1:     // ShortName
                return this.list.get(rowIndex).getShortName();
            case 2:     // Name
                return this.list.get(rowIndex).getName();
            case 3:     // IsActive
                return this.list.get(rowIndex).getIsActive();
            case 4:     // Association
                return this.list.get(rowIndex).getAssociation();
            case 5:     // Alias01
                return this.list.get(rowIndex).getAlias01();
            case 6:     // Alias02
                return this.list.get(rowIndex).getAlias02();
            case 7:     // Alias03
                return this.list.get(rowIndex).getAlias03();
            case 8:     // Alias04
                return this.list.get(rowIndex).getAlias04();
            case 9:     // Alias05
                return this.list.get(rowIndex).getAlias05();
            case 10:     // Alias06
                return this.list.get(rowIndex).getAlias06();
            case 11:     // Alias07
                return this.list.get(rowIndex).getAlias07();
            case 12:     // Alias08
                return this.list.get(rowIndex).getAlias08();
            case 13:     // Alias09
                return this.list.get(rowIndex).getAlias09();
            case 14:     // Alias10
                return this.list.get(rowIndex).getAlias10();
            case 15:    // Track changes
                return this.list.get(rowIndex).getTrack();
            default:
                return null;
        }
    }
}
