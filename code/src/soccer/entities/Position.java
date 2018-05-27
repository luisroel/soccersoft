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
public class Position {
    private long Id;
    private String position;
    private String abbrev;
    private boolean isActive;
    private TrackChange track;
    
    public Position(long id, String position,String abbrev,boolean isActive, TrackChange track){
        this.Id = id;
        this.position = position;
        this.abbrev = abbrev;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getId(){
        return this.Id;
    }
    
    public String getPosition(){
        return this.position;
    }
    
    public String getAbbrev(){
        return this.abbrev;
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
    
    public void setPosition(String value){
        this.position = value;
    }

    public void setAbbrev(String value){
        this.abbrev = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }

    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.position;
    }
}
