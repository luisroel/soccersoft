/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.Probability;

/**
 *
 * @author luis.espinoza
 */
public class ProbabilityTableModel extends AbstractTableModel{
    private final List<Probability> list;
    private final String columnNames[] = { 
              "Tournament"
            , "Time"
            , "Home"
            , "Visit"
            , "Pb_Home"
            , "Pb_Draw"
            , "Pb_Visit"
            , "Max_POH"
            , "Max_POV"
            , "POH_0"
            , "POH_1"
            , "POH_2"
            , "POH_3"
            , "POH_4"
            , "POH_5"
            , "POH_6"
            , "POV_0"
            , "POV_1"
            , "POV_2"
            , "POV_3"
            , "POV_4"
            , "POV_5"
            , "POV_6"
            , "Rsl"
    };
    
    public ProbabilityTableModel(List<Probability> list){
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
        Probability data = this.list.get(rowIndex);
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
                data.setPb_Home((Float)aValue);
                break;
            case 5:
                data.setPb_Draw((Float)aValue);
                break;
            case 6:
                data.setPb_Visit((Float)aValue);
                break;
            case 7:
                data.setMax_POH((Float)aValue);
                break;
            case 8:
                data.setMax_POV((Float)aValue);
                break;
            case 9:
                data.setPOH_0((Float)aValue);
                break;
            case 10:
                data.setPOH_1((Float)aValue);
                break;
            case 11:
                data.setPOH_2((Float)aValue);
                break;
            case 12:
                data.setPOH_3((Float)aValue);
                break;
            case 13:
                data.setPOH_4((Float)aValue);
                break;
            case 14:
                data.setPOH_5((Float)aValue);
                break;
            case 15:
                data.setPOH_6((Float)aValue);
                break;
            case 16:
                data.setPOV_0((Float)aValue);
                break;
            case 17:
                data.setPOV_1((Float)aValue);
                break;
            case 18:
                data.setPOV_2((Float)aValue);
                break;
            case 19:
                data.setPOV_3((Float)aValue);
                break;
            case 20:
                data.setPOV_4((Float)aValue);
                break;
            case 21:
                data.setPOV_5((Float)aValue);
                break;
            case 22:
                data.setPOV_6((Float)aValue);
                break;
            case 23:
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
                return list.get(rowIndex).getPb_Home();
            case 5:
                return list.get(rowIndex).getPb_Draw();
            case 6:
                return list.get(rowIndex).getPb_Visit();
            case 7:
                return list.get(rowIndex).getMax_POH();
            case 8:
                return list.get(rowIndex).getMax_POV();
            case 9:
                return list.get(rowIndex).getPOH_0();
            case 10:
                return list.get(rowIndex).getPOH_1();
            case 11:
                return list.get(rowIndex).getPOH_2();
            case 12:
                return list.get(rowIndex).getPOH_3();
            case 13:
                return list.get(rowIndex).getPOH_4();
            case 14:
                return list.get(rowIndex).getPOH_5();
            case 15:
                return list.get(rowIndex).getPOH_6();
            case 16:
                return list.get(rowIndex).getPOV_0();
            case 17:
                return list.get(rowIndex).getPOV_1();
            case 18:
                return list.get(rowIndex).getPOV_2();
            case 19:
                return list.get(rowIndex).getPOV_3();
            case 20:
                return list.get(rowIndex).getPOV_4();
            case 21:
                return list.get(rowIndex).getPOV_5();
            case 22:
                return list.get(rowIndex).getPOV_6();
            case 23:
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
