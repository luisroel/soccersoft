/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

/**
 *
 * @author luis.espinoza
 */
public class FixtureStatus {
    private long Id;
    private String name;
    private String shortName;
    
    public FixtureStatus(long id, String name,String shortName){
        this.Id = id;
        this.name = name;
        this.shortName = shortName;
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
          
    public void setId(long value){
        this.Id = value;
    }
    
    public void setName(String value){
        this.name = value;
    }

    public void setShortName(String value){
        this.shortName = value;
    }
    
    @Override
    public String toString(){
        return this.shortName;
    }
}
