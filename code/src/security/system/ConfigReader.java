/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.system;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Administrator
 */
public class ConfigReader {
    private String securityDBType;
    private String securityDBServer;
    private String securityDBPort;
    private String securityDBUser;
    private String securityDBPassword;
    private String securityDBName;
    private String securityDBDriver;
    
    private String applicationDBType;
    private String applicationDBServer;
    private String applicationDBPort;
    private String applicationDBUser;
    private String applicationDBPassword;
    private String applicationDBName;
    private String applicationDBDriver;

    public  ConfigReader()  {
        Properties prop = new Properties();
        String propFileName = "config.properties";
        
        securityDBType = "";
        securityDBServer = "";
        securityDBPort = "";
        securityDBName = "";
        securityDBUser = "";
        securityDBPassword = "";
        securityDBDriver = "";

        applicationDBType = "";
        applicationDBPort = "";
        applicationDBName = "";
        applicationDBUser = "";
        applicationDBPassword = "";
        

        InputStream inputstream = null;
        try {
            //inputstream = new FileInputStream(propFileName);
            inputstream = ConfigReader.class.getResourceAsStream(propFileName);
            prop.load(inputstream);
            securityDBType = prop.getProperty("SecurityDBType");
            securityDBServer = prop.getProperty("SecurityDBServer");
            securityDBPort = prop.getProperty("SecurityDBPort");
            securityDBName = prop.getProperty("SecurityDBName");
            securityDBUser = prop.getProperty("SecurityDBUser");
            securityDBPassword = prop.getProperty("SecurityDBPassword");
            securityDBDriver = prop.getProperty("SecurityDBDriver");

            applicationDBType = prop.getProperty("ApplicationDBType");
            applicationDBServer = prop.getProperty("ApplicationDBServer");
            applicationDBPort = prop.getProperty("ApplicationDBPort");
            applicationDBName = prop.getProperty("ApplicationDBName");
            applicationDBUser = prop.getProperty("ApplicationDBUser");
            applicationDBPassword = prop.getProperty("ApplicationDBPassword");
            applicationDBDriver = prop.getProperty("SecurityDBDriver");
        } catch(IOException ex){
            ex.printStackTrace();
        } finally{
            if (inputstream != null){
                try{
                    inputstream.close();
                } catch(IOException e){
                    e.printStackTrace();
                }
            }
        }
    }
        
    public String getSecurityDBType() {
        return securityDBType;
    }
    
    public String getSecurityDBServer() {
        return securityDBServer;
    }

    public String getSecurityDBPort() {
        return securityDBPort;
    }

    public String getSecurityDBName() {
        return securityDBName;
    }
    
    public String getSecurityDBUser(){
        return securityDBUser;
    }
    
    public String getSecurityDBPassword(){
        return securityDBPassword;
    }

    public String getSecurityDBDriver(){
        return securityDBDriver;
    }

    public String getApplicationDBType() {
        return applicationDBType;
    }
    
    public String getApplicationDBServer() {
        return applicationDBServer;
    }

    public String getApplicationDBPort() {
        return applicationDBPort;
    }

    public String getApplicationDBName() {
        return applicationDBName;
    }
    
    public String getApplicationDBUser(){
        return applicationDBUser;
    }
    
    public String getApplicationDBPassword(){
        return applicationDBPassword;
    }
    
    public String getApplicationDBDriver(){
        return applicationDBDriver;
    }
}

