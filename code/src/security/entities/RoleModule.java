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
public class RoleModule {
    private long roleId;
    private Item module;
    private boolean isCreated;
    private boolean isUpdated;
    private boolean isDeleted;
    
    public RoleModule(long roleId,Item module,boolean isCreated, boolean isUpdated, boolean isDeleted){
        this.roleId = roleId;
        this.module = module;
        this.isCreated = isCreated;
        this.isUpdated = isUpdated;
        this.isDeleted = isDeleted;
    }
    
    public long getRoleId(){
        return this.roleId;
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
    
    public void setRoleId(long value){
        this.roleId = value;
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
