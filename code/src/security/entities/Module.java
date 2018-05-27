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
public class Module {
    private long objectId;
    private String name;
    private String description;
    private Item menu;
    private int order;
    private boolean isActive;
    private TrackChange track;
    
    public Module(long id, String name,String description,Item menu,int order,boolean isActive, TrackChange track){
        this.objectId = id;
        this.name = name;
        this.description = description;
        this.menu = menu;
        this.order = order;
        this.isActive = isActive;
        this.track = track;
    }
    
    public long getId(){
        return this.objectId;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getDescription(){
        return this.description;
    }

    public Item getMenu(){
        return this.menu;
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
        this.objectId = value;
    }
    
    public void setName(String value){
        this.name = value;
    }

    public void setDescription(String value){
        this.description = value;
    }

    public void setMenu(Item value){
        this.menu = value;
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
