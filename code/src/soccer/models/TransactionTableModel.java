/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.sql.Timestamp;
import java.util.List;
import javax.swing.table.AbstractTableModel;
import soccer.entities.Rawdata;

/**
 *
 * @author luis.espinoza
 */
public class TransactionTableModel  extends AbstractTableModel{
    private final List<Rawdata> list;
    private final String columnNames[] = { 
        "Date"
      , "Type"
      , "Association"
      , "Tournament"
      , "Grp"
      , "Home"
      , "Visit"
      , "OH"
      , "OV"
      , "Diff"
      , "Pb_Home"
      , "Pb_Draw"
      , "Pb_Visit"
      , "Max_POH"
      , "Max_POV"
      , "Max_OH"
      , "Max_OV"
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
    
    public TransactionTableModel(List<Rawdata> list){
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
        Rawdata data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:
                data.setDate((Timestamp)aValue);
                break;
            case 1:
                data.setType((String)aValue);
                break;
            case 2:
                data.setAssociation((String)aValue);
                break;
            case 3:
                data.setTournament((String)aValue);
                break;
            case 4:
                data.setGroupId((Integer)aValue);
                break;
            case 5:
                data.setHome((String)aValue);
                break;
            case 6:
                data.setVisit((String)aValue);
                break;
            case 7:
                data.setOH((Float)aValue);
                break;
            case 8:
                data.setOV((Float)aValue);
                break;
            case 9:
                data.setDiff((Float)aValue);
                break;
            case 10:
                data.setPb_Home((Float)aValue);
                break;
            case 11:
                data.setPb_Draw((Float)aValue);
                break;
            case 12:
                data.setPb_Visit((Float)aValue);
                break;
            case 13:
                data.setMax_POH((Float)aValue);                
                break;
            case 14:
                data.setMax_POV((Float)aValue);
                break;
            case 15:
                data.setMax_OH((Float)aValue);
                break;
            case 16:
                data.setMax_OV((Float)aValue);
                break;
            case 17:
                data.setSH((Integer)aValue);
                break;
            case 18:
                data.setSV((Integer)aValue);
                break;
            case 19:
                data.setFC((String)aValue);
                break;
            case 20:
                data.setRsl((String)aValue);
                break;
            case 21:
                data.setOk((Integer)aValue);
                break;
            case 22:
                data.setOdd((Float)aValue);
                break;
            case 23:
                data.setIdealBet((Float)aValue);
                break;
            case 24:
                data.setIdealPayment((Float)aValue);
                break;
            case 25:
                data.setIdealBalance((Float)aValue);
                break;
            case 26:
                data.setAddlProfit((Float)aValue);
                break;
            case 27:
                data.setActualBet((Float)aValue);
                break;
            case 28:
                data.setActualPayment((Float)aValue);
                break;
            case 29:
                data.setActualBalance((Float)aValue);
                break;
            case 30:
                data.setLevel((Float)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch (columnIndex){
            case 0:
                return list.get(rowIndex).getDate();
            case 1:
                return list.get(rowIndex).getType();
            case 2:
                return list.get(rowIndex).getAssociation();
            case 3:
                return list.get(rowIndex).getTournament();
            case 4:
                return list.get(rowIndex).getGroupId();
            case 5:
                return list.get(rowIndex).getHome();
            case 6:
                return list.get(rowIndex).getVisit();
            case 7:
                return list.get(rowIndex).getOH();
            case 8:
                return list.get(rowIndex).getOV();
            case 9:
                return list.get(rowIndex).getDiff();
            case 10:
                return list.get(rowIndex).getPb_Home();
            case 11:
                return list.get(rowIndex).getPb_Draw();
            case 12:
                return list.get(rowIndex).getPb_Visit();
            case 13:
                return list.get(rowIndex).getMax_POH();
            case 14:
                return list.get(rowIndex).getMax_POV();
            case 15:
                return list.get(rowIndex).getMax_OH();
            case 16:
                return list.get(rowIndex).getMax_OV();
            case 17:
                return list.get(rowIndex).getSH();
            case 18:
                return list.get(rowIndex).getSV();
            case 19:
                return list.get(rowIndex).getFC();
            case 20:
                return list.get(rowIndex).getRsl();
            case 21:
                return list.get(rowIndex).getOk();
            case 22:
                return list.get(rowIndex).getOdd();
            case 23:
                return list.get(rowIndex).getIdealBet();
            case 24:
                return list.get(rowIndex).getIdealPayment();
            case 25:
                return list.get(rowIndex).getIdealBalance();
            case 26:
                return list.get(rowIndex).getAddlProfit();
            case 27:
                return list.get(rowIndex).getActualBet();
            case 28:
                return list.get(rowIndex).getActualPayment();
            case 29:
                return list.get(rowIndex).getActualBalance();
            case 30:
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
