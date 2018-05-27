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
import security.entities.Item;
import security.entities.UserRight;

/**
 *
 * @author Administrator
 */
public class DBLogin {
    DBConnection connection;

    public DBLogin(){
        connection = new DBConnection();
    }
    
    public Item getAccess(String username, String password){
        CallableStatement cstmt = null;
        Item result = null;
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                    "{call spSecurity_Verify_Access(?,?,?)}");
            cstmt.setString("Username_p", username);
            cstmt.setString("Password_p", password);
            cstmt.registerOutParameter("UserId_p", java.sql.Types.BIGINT);
            cstmt.execute();
            result = new Item(cstmt.getLong("UserId_p"), username);
        } catch (Exception ex) {
            Logger.getLogger(DBMenu.class.getName()).log(
                    Level.SEVERE, null, ex);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBLogin.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return result;
    }
    
    public List<UserRight> getRights(long userId){
        CallableStatement cstmt = null;
        ResultSet rs = null;
        List<UserRight> list = new ArrayList<>();
        
        try {
            cstmt = connection.getSecurityConnection().prepareCall(
                      "{call spSecurity_Get_UserRights(?)}"
                    , ResultSet.TYPE_SCROLL_INSENSITIVE
                    , ResultSet.CONCUR_READ_ONLY);
            cstmt.setLong("UserId_p", userId);
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
                UserRight userRights = new UserRight(
                          rs.getLong("menuOrder")
                        , rs.getLong("itemOrder")
                        , new Item(rs.getLong("MenuId"),rs.getString("MenuName"))
                        , new Item(rs.getLong("ModuleId"),rs.getString("ModuleName"))
                        , rs.getBoolean("IsCreated")
                        , rs.getBoolean("IsUpdated")
                        , rs.getBoolean("IsDeleted")
                );
                list.add(userRights);
            }
        } catch (Exception ex) {
            Logger.getLogger(DBLogin.class.getName()).log(
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
                    Logger.getLogger(DBLogin.class.getName()).log(
                            Level.WARNING, null, ex);
                }
            }
        }
        return list;
    }
}
