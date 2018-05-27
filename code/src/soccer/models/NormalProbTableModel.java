/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.NormalProb;

/**
 *
 * @author luis.espinoza
 */
public class NormalProbTableModel extends AbstractTableModel{
    private final List<NormalProb> list;
    private final String columnNames[] = {
          "Diff"
        , "Frecuency"
        , "Prob"
        , "Min"
        , "Max"
        , "Avg"
        , "Std"
    };

    public NormalProbTableModel(List<NormalProb> list) {
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
        NormalProb data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:     // Diff
                data.setDiff((Integer)aValue);
                break;
            case 1:     // Frecuency
                data.setFrecuency((Integer)aValue);
                break;
            case 2:     // Probability
                data.setProbability((Float)aValue);
                break;                
            case 3:     // Min
                data.setMin((Integer)aValue);
                break;
            case 4:     // Max
                data.setMax((Integer)aValue);
                break;
            case 5:     // Average: Avg
                data.setAvg((Float)aValue);
                break;
            case 6:     // Standar Deviation
                data.setStd((Float)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:     // Diff
                return this.list.get(rowIndex).getDiff();
            case 1:     // Frecuency
                return this.list.get(rowIndex).getFrecuency();
            case 2:     // Probability
                return this.list.get(rowIndex).getProbability();
            case 3:     // Min
                return this.list.get(rowIndex).getMin();
            case 4:     // Max
                return this.list.get(rowIndex).getMax();
            case 5:     // Average : Avg
                return this.list.get(rowIndex).getAvg();
            case 6:     // Standar Deviation
                return this.list.get(rowIndex).getStd();
            default:
                return null;
        }
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }    
}
