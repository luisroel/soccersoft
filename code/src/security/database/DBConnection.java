/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import security.system.ConfigReader;

/**
 *
 * @author Administrator
 */
public class DBConnection {
    ConfigReader connectionProps;

    // Constructor
    public DBConnection(){
        connectionProps = new ConfigReader();
    }
    
    private String getSecurityConnectionURL(){    
        String url;
        if (connectionProps.getSecurityDBType().equalsIgnoreCase("MySQL")) {
            url = "jdbc:mysql://" + connectionProps.getSecurityDBServer()
                    + ":" + connectionProps.getSecurityDBPort()
                    + "/" + connectionProps.getSecurityDBName()
                    + "?user=" + connectionProps.getSecurityDBUser()
                    + "&password=" + connectionProps.getSecurityDBPassword()
                    + "&verifyServerCertificate=false&useSSL=false";
        }
        else if (connectionProps.getSecurityDBType().equalsIgnoreCase("MSSQL")) {
            url = "jdbc:sqlserver://" + connectionProps.getSecurityDBServer()
                    + ":" + connectionProps.getSecurityDBPort()
                    + ";databaseName=" + connectionProps.getSecurityDBName()
                    + ";user=" + connectionProps.getSecurityDBUser()
                    + ";password=" + connectionProps.getSecurityDBPassword()
                    + ";";
        } else {
            url = "";
        }
        return url;
    }
    
    private String getApplicationConnectionURL(){
        String url;
        if (connectionProps.getApplicationDBType().equalsIgnoreCase("MySQL")) {
            url = "jdbc:mysql://" + connectionProps.getApplicationDBServer()
                    + ":" + connectionProps.getApplicationDBPort()
                    + "/" + connectionProps.getApplicationDBName()
                    + "?user=" + connectionProps.getApplicationDBUser()
                    + "&password=" + connectionProps.getApplicationDBPassword()
                    + "&verifyServerCertificate=false&useSSL=false";
        } else if (connectionProps.getApplicationDBType().equalsIgnoreCase("MSSQL")) {
            url = "jdbc:sqlserver://" + connectionProps.getApplicationDBServer()
                    + ":" + connectionProps.getApplicationDBPort()
                    + ";databaseName=" + connectionProps.getApplicationDBName()
                    + ";user=" + connectionProps.getApplicationDBUser()
                    + ";password=" + connectionProps.getApplicationDBPassword()
                    + ";";
        } else{
            url = "";
        }
        return url;
    }
        
    public  Connection getSecurityConnection() {
        Connection conn = null;
        try{
            Class.forName(connectionProps.getSecurityDBDriver());
            conn = DriverManager.getConnection(getSecurityConnectionURL());
        } catch(ClassNotFoundException ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error1 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error2 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } catch(Exception ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error3 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } finally {
            return conn;
        }
    }

    public  Connection getApplicationConnection() {
        Connection conn = null;
        try{
            Class.forName(connectionProps.getApplicationDBDriver());
            conn = DriverManager.getConnection(getApplicationConnectionURL());
        } catch(ClassNotFoundException ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error1 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error2 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } catch(Exception ex){
            JOptionPane.showMessageDialog(null, ex, "DB connection Error3 " + ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            conn=null;
        } finally {
            return conn;
        }
    }

}
