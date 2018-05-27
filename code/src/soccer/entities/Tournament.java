/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import security.entities.Item;
import security.entities.TrackChange;

/**
 *
 * @author Administrator
 */
public class Tournament {
    private long Id;
    private String name;
    private String shortName;
    private boolean isActive;
    private Item association;
    private TrackChange track;
    
    public Tournament(long id
            , String shortName
            , String name
            , boolean isActive
            , Item association
            , TrackChange track){
        this.Id = id;
        this.shortName = shortName;
        this.name = name;
        this.isActive = isActive;
        this.association = association;
        this.track = track;
    }
    
    public long getId(){
        return this.Id;
    }
        
    public String getShortName(){
        return this.shortName;
    }
    
    public String getName(){
        return this.name;
    }

    public boolean getIsActive(){
        return this.isActive;
    }
    
    public Item getAssociation(){
        return this.association;
    }
    
    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setId(long value){
        this.Id = value;
    }
    
    public void setShortName(String value){
        this.shortName = value;
    }
    
    public void setName(String value){
        this.name = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }
    
    public void setAssociation(Item value){
        this.association = value;
    }
    
    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.shortName;
    }
}
