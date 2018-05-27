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
public class Team {
    private long id;
    private String shortName;
    private String name;
    private boolean isActive;
    private Item association;
    private String alias01;
    private String alias02;
    private String alias03;
    private String alias04;
    private String alias05;
    private String alias06;
    private String alias07;
    private String alias08;
    private String alias09;
    private String alias10;
    private TrackChange track;
    
    public Team(long id
            , String shortName
            , String name
            , boolean isActive
            , Item association
            , String alias01
            , String alias02
            , String alias03
            , String alias04
            , String alias05
            , String alias06
            , String alias07
            , String alias08
            , String alias09
            , String alias10
            , TrackChange track){
        this.id = id;
        this.shortName = shortName;
        this.name = name;
        this.isActive = isActive;
        this.association = association;
        this.alias01 = alias01;
        this.alias02 = alias02;
        this.alias03 = alias03;
        this.alias04 = alias04;
        this.alias05 = alias05;
        this.alias06 = alias06;
        this.alias07 = alias07;
        this.alias08 = alias08;
        this.alias09 = alias09;
        this.alias10 = alias10;
        this.track = track;
    }
    
    public long getId(){
        return this.id;
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

    public String getAlias01(){
        return this.alias01;
    }

    public String getAlias02(){
        return this.alias02;
    }
    
    public String getAlias03(){
        return this.alias03;
    }
    
    public String getAlias04(){
        return this.alias04;
    }
    
    public String getAlias05(){
        return this.alias05;
    }
    
    public String getAlias06(){
        return this.alias06;
    }
    
    public String getAlias07(){
        return this.alias07;
    }
    
    public String getAlias08(){
        return this.alias08;
    }
    
    public String getAlias09(){
        return this.alias09;
    }
    
    public String getAlias10(){
        return this.alias10;
    }
    public TrackChange getTrack(){
        return this.track;
    }
    
    public void setId(long value){
        this.id = value;
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
    
    public void setAlias01(String value){
        this.alias01 = value;
    }
    
    public void setAlias02(String value){
        this.alias02 = value;
    }
    
    public void setAlias03(String value){
        this.alias03 = value;
    }
    
    public void setAlias04(String value){
        this.alias04 = value;
    }
    
    public void setAlias05(String value){
        this.alias05 = value;
    }
    
    public void setAlias06(String value){
        this.alias06 = value;
    }
    
    public void setAlias07(String value){
        this.alias07 = value;
    }
    
    public void setAlias08(String value){
        this.alias08 = value;
    }
    
    public void setAlias09(String value){
        this.alias09 = value;
    }
    
    public void setAlias10(String value){
        this.alias10 = value;
    }
    
    public void setTrack(TrackChange value){
        this.track = value;
    }
    
    @Override
    public String toString(){
        return this.shortName;
    }
    
    @Override
    public int hashCode() {
        return (int)id;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Team other = (Team) obj;
        if (this.id != other.getId()) {
            return false;
        }
        return this.name.equalsIgnoreCase(other.getName());
    }
}
