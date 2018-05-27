/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.entities;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class TrackChange {
    private Date entryDate;
    private Item entryUser;
    private Date modDate;
    private Item modUser;
    
    public TrackChange(Date entryDate, Item entryUser, Date modDate, Item modUser){
        this.entryDate = entryDate;
        this.entryUser = entryUser;
        this.modDate = modDate;
        this.modUser = modUser;
    }
    
    public Date getEntryDate(){
        return this.entryDate;
    }
    
    public Item getEntryUser(){
        return this.entryUser;
    }
    
    public Date getModDate(){
        return this.modDate;
    }
    
    public Item getModUser(){
        return this.modUser;
    }
    
    public void setEntryDate(Timestamp value){
        this.entryDate = value;
    }
    
    public void setEntryUser(Item value){
        this.entryUser = value;
    }
    
    public void setModDate(Timestamp value){
        this.modDate = value;
    }
    
    public void setModUser(Item value){
        this.modUser = value;
    }
    
    @Override
    public String toString() {
        return this.modUser.getName();
    }

}
