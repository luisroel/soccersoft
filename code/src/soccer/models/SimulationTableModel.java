/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.Simulation;

/**
 *
 * @author luis.espinoza
 */
public class SimulationTableModel  extends AbstractTableModel{
    private final List<Simulation> list;
    private final String columnNames[] = { 
        "Type"
      , "Tournament"
      , "Time"
      , "Grp"
      , "Home"
      , "Visit"
      , "SH"
      , "SV"
      , "FC"
      , "Rsl"
      , "Ok"
      , "Odd"
      , "Bet"
      , "Payment"
      , "Balance"
      , "Profit"
      , "Bet"
      , "Payment"
      , "Balance"
      , "Level"
    };
    
    public SimulationTableModel(List<Simulation> list){
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
        Simulation data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setType((String)aValue);
                break;
            case 1:
                data.setTournament((String)aValue);
                break;
            case 2:
                data.setTime((Timestamp)aValue);
                break;
            case 3:
                data.setGroupId((Integer)aValue);
                break;
            case 4:
                data.setHome((String)aValue);
                break;
            case 5:
                data.setVisit((String)aValue);
                break;
            case 6:
                data.setSH((Integer)aValue);
                break;
            case 7:
                data.setSV((Integer)aValue);
                break;
            case 8:
                data.setFC((String)aValue);
                break;
            case 9:
                data.setRsl((String)aValue);
                break;
            case 10:
                data.setOk((Integer)aValue);
                break;
            case 11:
                data.setOdd((Float)aValue);
                break;
            case 12:
                data.setIdealBet((Float)aValue);
                break;
            case 13:
                data.setIdealPayment((Float)aValue);
                break;
            case 14:
                data.setIdealBalance((Float)aValue);
                break;
            case 15:
                data.setAddlProfit((Float)aValue);
                break;
            case 16:
                data.setActualBet((Float)aValue);
                break;
            case 17:
                data.setActualPayment((Float)aValue);
                break;
            case 18:
                data.setActualBalance((Float)aValue);
                break;
            case 19:
                data.setLevel((Float)aValue);               
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getType();
            case 1:
                return list.get(rowIndex).getTournament();
            case 2:
                return list.get(rowIndex).getTime();
            case 3:
                return list.get(rowIndex).getGroupId();
            case 4:
                return list.get(rowIndex).getHome();
            case 5:
                return list.get(rowIndex).getVisit();
            case 6:
                return list.get(rowIndex).getSH();
            case 7:
                return list.get(rowIndex).getSV();
            case 8:
                return list.get(rowIndex).getFC();
            case 9:
                return list.get(rowIndex).getRsl();
            case 10:
                return list.get(rowIndex).getOk();
            case 11:
                return list.get(rowIndex).getOdd();
            case 12:
                return list.get(rowIndex).getIdealBet();
            case 13:
                return list.get(rowIndex).getIdealPayment();
            case 14:
                return list.get(rowIndex).getIdealBalance();
            case 15:
                return list.get(rowIndex).getAddlProfit();
            case 16:
                return list.get(rowIndex).getActualBet();
            case 17:
                return list.get(rowIndex).getActualPayment();
            case 18:
                return list.get(rowIndex).getActualBalance();
            case 19:
                return list.get(rowIndex).getLevel();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
