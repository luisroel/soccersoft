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
import soccer.entities.TableData;

/**
 *
 * @author luis.espinoza
 */
public class TableDataTableModel extends AbstractTableModel{
    
    private final List<TableData> list;
    private final String columnNames[] = {
          "NO"
        , "CT"
        , "LG"
        , "DT"
        , "HM"
        , "VS"
        , "SH"
        , "SV"
        , "Rsl"
        , "O1"
        , "OX"
        , "O2"
        , "Val"
        , "PW1"
        , "PWX"
        , "PW2"
        , "DGS"
        , "DGA"
        , "GPR"
        , "PWI"
        , "PDR"
        , "PLT"
        , "GSH"
        , "GAH"
        , "PTH"
        , "LH"
        , "GSV"
        , "GAV"
        , "PTV"
        , "LV"
        , "DPT"
        , "DFT"
        , "DFS"
        , "DFA"
        , "DFH"
        , "DFV"
        , "TD"
        , "DO1"
        , "DOX"
        , "DO2"
        , "SS"
        , "PH"
        , "MSK"
        , "LVD"
        , "PRC1"
        , "PRCX"
        , "PRC2"
        , "FT"
    };

    public TableDataTableModel(List<TableData> list){
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
        TableData data = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:     // NO
                data.setNo((Integer)aValue);
                break;
            case 1:     // Country
                data.setCt((Item)aValue);
                break;
            case 2:     // League
                data.setLg((Item)aValue);
                break;                
            case 3:     // Date/Time
                data.setDt((Timestamp)aValue);
                break;
            case 4:     // Home
                data.setHm((Item)aValue);
                break;
            case 5:     // Visitor
                data.setVs((Item)aValue);
                break;
            case 6:     // Scored Home
                data.setSh((Integer)aValue);
                break;
            case 7:     // Scored Visitor
                data.setSv((Integer)aValue);
                break;
            case 8:     // Result
                data.setRsl((String)aValue);
                break;
            case 9:     // Odd_1
                data.setO1((Float)aValue);
                break;
            case 10:    // Odd_X
                data.setOx((Float)aValue);
                break;                
            case 11:    // Odd_2
                data.setO2((Float)aValue);
                break;
            case 12:    // Val
                data.setVal((Float)aValue);
                break;
            case 13:    // PW1 : Number of matches won by home team vs visitor team, negative number means visitor team won
                data.setPw1((Integer)aValue);
                break;
            case 14:    // PWX : Number of matches draw by home team and visitor team 
                data.setPwx((Integer)aValue);
                break;
            case 15:    // PW2 : Number of matches won by the visitor team vs home team, negative number means home team won
                data.setPw2((Integer)aValue);
            case 16:    // DGS
                data.setDgs((Float)aValue);
                break;
            case 17:    // DGA
                data.setDga((Float)aValue);
                break;
            case 18:    // GPR
                data.setGpr((Float)aValue);
                break;
            case 19:    // PWI
                data.setPwi((Integer)aValue);
                break;
            case 20:    // PDR
                data.setPdr((Integer)aValue);
                break;                
            case 21:    // PLT
                data.setPlt((Integer)aValue);
                break;
            case 22:    // GSH
                data.setGsh((Integer)aValue);
                break;
            case 23:    // GAH
                data.setGah((Integer)aValue);
                break;
            case 24:    // PTH
                data.setPth((Integer)aValue);
                break;
            case 25:    // LH
                data.setLh((String)aValue);
                break;
            case 26:    // GSV
                data.setGsv((Integer)aValue);
                break;
            case 27:    // GAV
                data.setGav((Integer)aValue);
                break;
            case 28:    // PTV
                data.setPtv((Integer)aValue);
                break;
            case 29:    // LV
                data.setLv((String)aValue);
                break;
            case 30:    // DPT
                data.setDpt((Float)aValue);
                break;
            case 31:    // DFT
                data.setDft((Float)aValue);
                break;
            case 32:    // DFS
                data.setDfs((Integer)aValue);
                break;
            case 33:    // DFA
                data.setDfa((Integer)aValue);
                break;
            case 34:    // DFH
                data.setDfh((Integer)aValue);
                break;
            case 35:    // DFV
                data.setDfv((Integer)aValue);
                break;
            case 36:    // TD
                data.setTd((String)aValue);
                break;
            case 37:    // DO1
                data.setDo1((Float)aValue);
                break;
            case 38:    // DOX
                data.setDox((Float)aValue);
                break;
            case 39:    // DO2
                data.setDo2((Float)aValue);
                break;
            case 40:    // SS
                data.setSs((Item)aValue);
                break;
            case 41:    // PH
                data.setPh((Item)aValue);
                break;
            case 42:    // MSK
                data.setMask((String)aValue);
                break;
            case 43:    // LVD
                data.setLvd((Integer)aValue);
                break;
            case 44:    // PRC 1
                data.setPrc1((Float)aValue);
                break;
            case 45:    // PRC x
                data.setPrcx((Float)aValue);
                break;
            case 46:    // PRC 2
                data.setPrc2((Float)aValue);
                break;
            case 47:    // FT
                data.setFt((Long)aValue);
                break;
        }
        this.fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        TableData obj = this.list.get(rowIndex);
        switch (columnIndex){
            case 0:     // NO : Number
                return obj.getNo();
            case 1:     // CT : Country
                return obj.getCt();
            case 2:     // LG : League
                return obj.getLg();
            case 3:     // DT : Date
                return obj.getDt();
            case 4:     // HM : Home
                return obj.getHm();
            case 5:     // VS : Visitor
                return obj.getVs();
            case 6:     // SH: Scored Home
                return obj.getSh();
            case 7:     // SV: Scored Visitor
                return obj.getSv();
            case 8:     // Rsl : Result
                return obj.getRsl();
            case 9:     // Odd_1
                return obj.getO1();
            case 10:    // Odd_X
                return obj.getOx();
            case 11:    // Odd_2
                return obj.getO2();
            case 12:    // Val : Value
                return obj.getVal();
            case 13:    // PW1 : Number of matches won by home team vs visitor team, negative number means visitor team won
                return obj.getPw1();
            case 14:    // PWX : Number of matches draw by home team and visitor team
                return obj.getPwx();
            case 15:    // PW2 : Number of matches won by the visitor team vs home team, negative number means home team won
                return obj.getPw2();
            case 16:    // DGS : Relation Goals Scored
                return obj.getDgs();
            case 17:    // DGA : Relation Goals Againts
                return obj.getDga();
            case 18:    // GPR : Goals and Points Relation
                return obj.getGpr();
            case 19:    // PWI : Win Probability (By Games)
                return obj.getPwi();
            case 20:    // PDR : Draw Probability (By Games)
                return obj.getPdr();
            case 21:    // PLT : Lost Probability (By Games)
                return obj.getPlt();
            case 22:    // GSH : Goals Scored Home
                return obj.getGsh();
            case 23:    // GAH : Goals Against Home
                return obj.getGah();
            case 24:    // PTH : Points Home
                return obj.getPth();
            case 25:    // LH : Last 2 Home
                return obj.getLh();
            case 26:    // GSV : Goals Scored Visitor
                return obj.getGsv();
            case 27:    // GAV : Goals Against Visitor
                return obj.getGav();
            case 28:    // Points Visitor
                return obj.getPtv();
            case 29:    // Last 2 Visitor
                return obj.getLv();
            case 30:    // DPT : Difference Porcentace Total
                return obj.getDpt();
            case 31:    // DFT : Difference Total
                return obj.getDft();
            case 32:    // DFS : Difference Scored
                return obj.getDfs();
            case 33:    // DFA : Difference Againts
                return obj.getDfa();
            case 34:    // DFH : Difference Home
                return obj.getDfh();
            case 35:    // Difference Visitor
                return obj.getDfv();
            case 36:    // TD : Tendency
                return obj.getTd();
            case 37:    // DO1 : Difference Odd 1
                return obj.getDo1();
            case 38:    // DOX : Difference Odd X
                return obj.getDox();
            case 39:    // DO2 : Difference Odd 2
                return obj.getDo2();
            case 40:    // SS : Season
                return obj.getSs();
            case 41:    // PH : Phase
                return obj.getPh();
            case 42:    // MSK : Mask
                return obj.getMask();
            case 43:    // LVD : Local (home) - visit difference goals
                return obj.getLvd();
            case 44:    // PRC 1
                return obj.getPrc1();
            case 45:    // PRC x
                return obj.getPrcx();
            case 46:    // PRC 2
                return obj.getPrc2();
            case 47:    // FT
                return obj.getFt();
            default:
                return null;
        }
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
