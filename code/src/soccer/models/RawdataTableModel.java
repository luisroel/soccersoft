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
public class RawdataTableModel extends AbstractTableModel{
    private final List<Rawdata> list;
    private final String columnNames[] = { 
              "Date"
            , "Type"
            , "Association"
            , "Tournament"
            , "Time"
            , "Home"
            , "Visit"
            , "SeasonId"
            , "WeekNo"
            , "FixtureId"
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
            , "OH"
            , "OV"
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
            , "Pb_Home"
            , "Pb_Draw"
            , "Pb_Visit"
            , "Max_POH"
            , "Max_POV"
            , "Max_OH"
            , "Max_OV"
            , "Diff"
            , "SH"
            , "SV"
            , "FC"
            , "Rsl"
            , "Ok"
            , "Odd"
    };
    
    public RawdataTableModel(List<Rawdata> list){
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
                data.setTime((Timestamp)aValue);
                break;
            case 5:
                data.setHome((String)aValue);
                break;
            case 6:
                data.setVisit((String)aValue);
                break;
            case 7:
                data.setSeasonId((Long)aValue);
                break;
            case 8:
                data.setWeekno((Integer)aValue);
                break;
            case 9:
                data.setFixtureId((Long)aValue);
                break;
            case 10:
                data.setTHAGS((Float)aValue);
                break;
            case 11:
                data.setTVAGC((Float)aValue);
                break;
            case 12:
                data.setTVAGS((Float)aValue);
                break;
            case 13:
                data.setTHAGC((Float)aValue);
                break;
            case 14:
                data.setTHAS((Float)aValue);
                break;
            case 15:
                data.setTVDS((Float)aValue);
                break;
            case 16:
                data.setTVAS((Float)aValue);
                break;
            case 17:
                data.setTHDS((Float)aValue);
                break;
            case 18:
                data.setSASH((Float)aValue);
                break;
            case 19:
                data.setSASV((Float)aValue);
                break;
            case 20:
                data.setOH((Float)aValue);
                break;
            case 21:
                data.setOV((Float)aValue);
                break;
            case 22:
                data.setPOH_0((Float)aValue);
                break;
            case 23:
                data.setPOH_1((Float)aValue);
                break;
            case 24:
                data.setPOH_2((Float)aValue);
                break;
            case 25:
                data.setPOH_3((Float)aValue);
                break;
            case 26:
                data.setPOH_4((Float)aValue);
                break;
            case 27:
                data.setPOH_5((Float)aValue);
                break;
            case 28:
                data.setPOH_6((Float)aValue);
                break;
            case 29:
                data.setPOV_0((Float)aValue);
                break;
            case 30:
                data.setPOV_1((Float)aValue);
                break;
            case 31:
                data.setPOV_2((Float)aValue);
                break;
            case 32:
                data.setPOV_3((Float)aValue);
                break;
            case 33:
                data.setPOV_4((Float)aValue);
                break;
            case 34:
                data.setPOV_5((Float)aValue);
                break;
            case 35:
                data.setPOV_6((Float)aValue);
                break;
            case 36:
                data.setPb_Home((Float)aValue);
                break;
            case 37:
                data.setPb_Draw((Float)aValue);
                break;
            case 38:
                data.setPb_Visit((Float)aValue);
                break;
            case 39:
                data.setMax_POH((Float)aValue);
                break;
            case 40:
                data.setMax_POV((Float)aValue);
                break;
            case 41:
                data.setMax_OH((Float)aValue);
                break;
            case 42:
                data.setMax_OV((Float)aValue);
                break;
            case 43:
                data.setDiff((Float)aValue);
                break;
            case 44:
                data.setSH((Integer)aValue);
                break;
            case 45:
                data.setSV((Integer)aValue);
                break;
            case 46:
                data.setFC((String)aValue);
                break;
            case 47:
                data.setRsl((String)aValue);
                break;
            case 48:
                data.setOk((Integer)aValue);
                break;
            case 49:
                data.setOdd((Float)aValue);
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
                return list.get(rowIndex).getTime();
            case 5:
                return list.get(rowIndex).getHome();
            case 6:
                return list.get(rowIndex).getVisit();
            case 7:
                return list.get(rowIndex).getSeasonId();
            case 8:
                return list.get(rowIndex).getWeekno();
            case 9:
                return list.get(rowIndex).getFixtureId();
            case 10:
                return list.get(rowIndex).getTHAGS();
            case 11:
                return list.get(rowIndex).getTVAGC();
            case 12:
                return list.get(rowIndex).getTVAGS();
            case 13:
                return list.get(rowIndex).getTHAGC();
            case 14:
                return list.get(rowIndex).getTHAS();
            case 15:
                return list.get(rowIndex).getTVDS();
            case 16:
                return list.get(rowIndex).getTVAS();
            case 17:
                return list.get(rowIndex).getTHDS();
            case 18:
                return list.get(rowIndex).getSASH();
            case 19:
                return list.get(rowIndex).getSASV();
            case 20:
                return list.get(rowIndex).getOH();
            case 21:
                return list.get(rowIndex).getOV();
            case 22:
                return list.get(rowIndex).getPOH_0();
            case 23:
                return list.get(rowIndex).getPOH_1();
            case 24:
                return list.get(rowIndex).getPOH_2();
            case 25:
                return list.get(rowIndex).getPOH_3();
            case 26:
                return list.get(rowIndex).getPOH_4();
            case 27:
                return list.get(rowIndex).getPOH_5();
            case 28:
                return list.get(rowIndex).getPOH_6();
            case 29:
                return list.get(rowIndex).getPOV_0();
            case 30:
                return list.get(rowIndex).getPOV_1();
            case 31:
                return list.get(rowIndex).getPOV_2();
            case 32:
                return list.get(rowIndex).getPOV_3();
            case 33:
                return list.get(rowIndex).getPOV_4();
            case 34:
                return list.get(rowIndex).getPOV_5();
            case 35:
                return list.get(rowIndex).getPOV_6();
            case 36:
                return list.get(rowIndex).getPb_Home();
            case 37:
                return list.get(rowIndex).getPb_Draw();
            case 38:
                return list.get(rowIndex).getPb_Visit();
            case 39:
                return list.get(rowIndex).getMax_POH();
            case 40:
                return list.get(rowIndex).getMax_POV();
            case 41:
                return list.get(rowIndex).getMax_OH();
            case 42:
                return list.get(rowIndex).getMax_OV();
            case 43:
                return list.get(rowIndex).getDiff();
            case 44:
                return list.get(rowIndex).getSH();
            case 45:
                return list.get(rowIndex).getSV();
            case 46:
                return list.get(rowIndex).getFC();
            case 47:
                return list.get(rowIndex).getRsl();
            case 48:
                return list.get(rowIndex).getOk();
            case 49:
                return list.get(rowIndex).getOdd();
            default:
                return null;
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }
}
