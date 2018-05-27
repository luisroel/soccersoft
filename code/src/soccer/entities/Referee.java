/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import security.entities.Item;
import security.entities.TrackChange;
import java.sql.Timestamp;

/**
 *
 * @author Administrator
 */
public class Referee {
    private long Id;
    private String nickName;
    private String firstName;
    private String middleName;
    private String lastName;
    private boolean isActive;
    private Timestamp birthdate;
    private Item country;
    private TrackChange track;
    
    public Referee(long id
            , String nickName
            , String firstName
            , String middleName
            , String lastName
            , boolean isActive
            , Timestamp birthdate
            , Item country
            , TrackChange track){
        this.Id = id;
        this.nickName = nickName;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.isActive = isActive;
        this.birthdate = birthdate;
        this.country = country;
        this.track = track;
    }
    
    public long getId(){
        return this.Id;
    }
        
    public String getNickName(){
        return this.nickName;
    }
    
    public String getFirstName(){
        return this.firstName;
    }

    public String getMiddleName(){
        return this.middleName;
    }

    public String getLastName(){
        return this.lastName;
    }

    public boolean getIsActive(){
        return this.isActive;
    }
    
    public Timestamp getBirthdate(){
        return this.birthdate;
    }
    
    public Item getCountry(){
        return this.country;
    }

    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setId(long value){
        this.Id = value;
    }
    
    public void setNickName(String value){
        this.nickName = value;
    }
    
    public void setFirstName(String value){
        this.firstName = value;
    }
    
    public void setMiddleName(String value){
        this.middleName = value;
    }
    
    public void setLastName(String value){
        this.lastName = value;
    }
        
    public void setIsActive(boolean value){
        this.isActive = value;
    }

    public void setBirthdate(Timestamp value){
        this.birthdate = value;
    }
    
    public void setCountry(Item value){
        this.country = value;
    }
        
    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.lastName + ", " + this.firstName;
    }
}
