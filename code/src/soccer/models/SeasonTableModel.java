/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import soccer.entities.Season;

/**
 *
 * @author Administrator
 */
public class SeasonTableModel extends AbstractTableModel{
    private final List<Season> list;
    private final String columnNames[] = {"Id", "Type", "Name", "Description"};
    
    public SeasonTableModel(List<Season> list){
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
        Season data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setId((Long)aValue);
                break;
            case 1:
                data.setShortName((String)aValue);
                break;
            case 2:
                data.setName((String)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getId();
            case 1:
                return list.get(rowIndex).getShortName();
            case 2:
                return list.get(rowIndex).getName();
            default:
                return null;
        }
    }
}
