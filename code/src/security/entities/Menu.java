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
public class Menu {
    private long Id;
    private String name;
    private String description;
    private int order;
    private boolean isActive;
    private TrackChange track;
    
    public Menu(long id, String name,String description,int order,boolean isActive, TrackChange track){
        this.Id = id;
        this.name = name;
        this.description = description;
        this.order = order;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getId(){
        return this.Id;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getDescription(){
        return this.description;
    }

    public int getOrder(){
        return this.order;
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

    public void setDescription(String value){
        this.description = value;
    }
    
    public void setOrder(int value){
        this.order = value;
    }
    
    public void setIsActive(boolean value){
        this.isActive = value;
    }

    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.name;
    }
}
