/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class TournamentType {
    private long Id;
    private String name;
    private String shortName;
    private boolean isActive;
    private TrackChange track;
    
    public TournamentType(long id, String name,String shortName,boolean isActive, TrackChange track){
        this.Id = id;
        this.name = name;
        this.shortName = shortName;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getId(){
        return this.Id;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getShortName(){
        return this.shortName;
    }
    
    public boolean getIsActive(){
        return this.isActive;
    }
    
    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setId(long value){
        this.Id = value;
    }
    
    public void setName(String value){
        this.name = value;
    }

    public void setShortName(String value){
        this.shortName = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }

    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.shortName;
    }
}
