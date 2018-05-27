/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import security.entities.Item;
import soccer.entities.SeasonPhase;

/**
 *
 * @author lespinoza
 */
public class SeasonPhaseTableModel extends AbstractTableModel{
    
    private final List<SeasonPhase> list;
    private final String columnNames[] = {"Phase", "Description", "Records"};
    
    public SeasonPhaseTableModel(List<SeasonPhase> list){
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
        SeasonPhase data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setPhase((Item)aValue);
                break;
            case 1:
                data.setDescription((String)aValue);
                break;
            case 2:
                data.setRecords((long)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getPhase();
            case 1:
                return list.get(rowIndex).getDescription();
            case 2:
                return list.get(rowIndex).getRecords();
            default:
                return null;
        }
    }

}

