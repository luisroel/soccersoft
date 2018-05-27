/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.Strength;

/**
 *
 * @author luis.espinoza
 */
public class StrengthTableModel extends AbstractTableModel{
    private final List<Strength> list;
    private final String columnNames[] = { 
              "Tournament"
            , "Time"
            , "Home"
            , "Visit"
            , "THGS"
            , "TVAGC"
            , "TVAGS"
            , "THAGC"
            , "THAS"
            , "TVDS"
            , "TVAS"
            , "THDS"
            , "SASH"
            , "SASV"
            , "Rsl"
    };
    
    public StrengthTableModel(List<Strength> list){
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
        Strength data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setTournament((String)aValue);
                break;
            case 1:
                data.setTime((Timestamp)aValue);
                break;
            case 2:
                data.setHome((String)aValue);
                break;
            case 3:
                data.setVisit((String)aValue);
                break;
            case 4:
                data.setTHAGS((Float)aValue);
                break;
            case 5:
                data.setTVAGC((Float)aValue);
                break;
            case 6:
                data.setTVAGS((Float)aValue);
                break;
            case 7:
                data.setTHAGC((Float)aValue);
                break;
            case 8:
                data.setTHAS((Float)aValue);
                break;
            case 9:
                data.setTVDS((Float)aValue);
                break;
            case 10:
                data.setTVAS((Float)aValue);
                break;
            case 11:
                data.setTHDS((Float)aValue);
                break;
            case 12:
                data.setSASH((Float)aValue);
                break;
            case 13:
                data.setSASV((Float)aValue);
                break;
            case 14:
                data.setRsl((String)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getTournament();
            case 1:
                return list.get(rowIndex).getTime();
            case 2:
                return list.get(rowIndex).getHome();
            case 3:
                return list.get(rowIndex).getVisit();
            case 4:
                return list.get(rowIndex).getTHAGS();
            case 5:
                return list.get(rowIndex).getTVAGC();
            case 6:
                return list.get(rowIndex).getTVAGS();
            case 7:
                return list.get(rowIndex).getTHAGC();
            case 8:
                return list.get(rowIndex).getTHAS();
            case 9:
                return list.get(rowIndex).getTVDS();
            case 10:
                return list.get(rowIndex).getTVAS();
            case 11:
                return list.get(rowIndex).getTHDS();
            case 12:
                return list.get(rowIndex).getSASH();
            case 13:
                return list.get(rowIndex).getSASV();
            case 14:
                return list.get(rowIndex).getRsl();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
