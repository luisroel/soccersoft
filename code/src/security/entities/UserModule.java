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
public class UserModule {
    private long userId;
    private Item module;
    private boolean isCreated;
    private boolean isUpdated;
    private boolean isDeleted;
    
    public UserModule(long userId,Item module,boolean isCreated, boolean isUpdated, boolean isDeleted){
        this.userId = userId;
        this.module = module;
        this.isCreated = isCreated;
        this.isUpdated = isUpdated;
        this.isDeleted = isDeleted;
    }
    
    public long getUserId(){
        return this.userId;
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
    
    public void setUserId(long value){
        this.userId = value;
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
