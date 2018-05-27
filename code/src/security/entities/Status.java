/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.entities;

/**
 *
 * @author Administrator
 */
public class Status {
    private long statusId;
    private String status;
    
    public Status(long id, String status){
        this.statusId = id;
        this.status = status;
    }
    
    public long getId(){
        return this.statusId;
    }
    
    public String getStatus(){
        return this.status;
    }
    
    public void setId(long value){
        this.statusId = value;
    }
    
    public void setStatus(String value){
        this.status = value;
    }
    
    @Override
    public String toString(){
        return this.status;
    }
}
