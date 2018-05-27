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
public class Role {
    private long idRole;
    private String roleName;
    private String description;
    private boolean isActive;
    private TrackChange track;
    
    public Role(long id, String roleName, String description, boolean isActive, TrackChange track){
        this.idRole = id;
        this.roleName = roleName;
        this.description = description;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getId(){
        return this.idRole;
    }
    
    public String getName(){
        return this.roleName;
    }
    
    public String getDescription(){
        return this.description;
    }
    
    public boolean getIsActive(){
        return this.isActive;
    }
    
    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setId(long value){
        this.idRole = value;
    }
    
    public void setName(String value){
        this.roleName = value;
    }
    
    public void setDescription(String value){
        this.description = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }
    
    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.roleName;
    }
}
