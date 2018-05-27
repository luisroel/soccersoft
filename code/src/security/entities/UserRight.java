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
public class UserRight {
    long menuOrder;
    long itemOrder;
    Item menu;
    Item module;
    boolean isCreated;
    boolean isUpdated;
    boolean isDeleted;
    
    public UserRight(long menuOrder
            , long itemOrder
            , Item menu
            , Item module
            , boolean isCreated
            , boolean isUpdated
            , boolean isDeleted){
        this.menuOrder = menuOrder;
        this.itemOrder = itemOrder;
        this.menu = menu;
        this.module = module;
        this.isCreated = isCreated;
        this.isUpdated = isUpdated;
        this.isDeleted = isDeleted;
    }
    
    public long getMenuOrder(){
        return this.menuOrder;
    }
    
    public long getItemOrder(){
        return this.itemOrder;
    }
    
    public Item getMenu(){
        return this.menu;
    }
    
    public Item getModule(){
        return this.module;
    }
    
    public boolean getIsCreated(){
        return this.isCreated;
    }
    
    public boolean getIsUpdated(){
        return this.isUpdated;
    }
    
    public boolean getIsDeleted(){
        return this.isDeleted;
    }
    
    public void setMenuOrder(long value){
        this.menuOrder = value;
    }

    public void setItemOrder(long value){
        this.itemOrder = value;
    }

    public void setMenu(Item value){
        this.menu = value;
    }
    
    public void setModule(Item value){
        this.module = value;
    }
    
    public void setIsCreated(boolean value){
        this.isCreated = value;
    }
    
    public void setIsUpdated(boolean value){
        this.isUpdated = value;
    }
    
    public void setIsDeleted(boolean value){
        this.isDeleted = value;
    }    
}
