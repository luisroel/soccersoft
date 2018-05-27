/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import security.entities.Status;

/**
 *
 * @author Administrator
 */
public class DBStatus {
    DBConnection connection;

    public DBStatus(){
        connection = new DBConnection();
    }
    
    /**
     * CallableStatement example, (2) input parameters, db returns ResultSet
     *
     * @return List<SysObject> of objects
     */
    public List<Status> getList() {

        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<Status> list = new ArrayList<>();

        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_StatusList()}"
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
                Status os = new Status(
                          rs.getLong("StatusId")
                        , rs.getString("Status")
                );
                list.add(os);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBModule.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBModule.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
}
