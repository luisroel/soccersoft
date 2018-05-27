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
public class Item {
    private long itemId;
    private String itemName;
    
    public Item(long itemId, String itemName){
        this.itemId = itemId;
        this.itemName = itemName;
    }
    
    public long getId(){
        return this.itemId;
    }
    
    public String getName(){
        return this.itemName;
    }
    
    public void setId(long value){
        this.itemId = value;
    }
    
    public void setName(String value){
        this.itemName = value;
    }
    
    @Override
    public String toString(){
        return this.itemName;
    }
}
