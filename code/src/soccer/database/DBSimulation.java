/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.database.DBConnection;
import security.entities.Item;

/**
 *
 * @author luis.espinoza
 */
public class DBSimulation {
   DBConnection connection;

    public DBSimulation(){
        connection = new DBConnection();
    }
    
    public List<Item> getList() {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Item> list = new ArrayList<>();

        try {
            cstmt = connection.getApplicationConnection().prepareCall(
                      "{call spCore_Get_SimulationList()}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                Item module = new Item(
                          rs.getLong("SimId")
                        , rs.getString("Description")
                );
                list.add(module);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBSimulation.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSimulation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBSimulation.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
}
