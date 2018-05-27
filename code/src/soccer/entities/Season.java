/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import java.sql.Timestamp;
import security.entities.Item;

/**
 *
 * @author Administrator
 */
public class Season {
    private long Id;
    private Timestamp from;
    private Timestamp to;
    private String name;
    private String shortName;
    private Item tournament;
    
    public Season(long id
            , Timestamp from
            , Timestamp to
            , String shortName
            , String name
            , Item tournament){
        this.Id = id;
        this.from = from;
        this.to = to;
        this.shortName = shortName;
        this.name = name;
        this.tournament = tournament;
    }
    
    public long getId(){
        return this.Id;
    }
    
    public Timestamp getFrom() {
        return from;
    }

    public Timestamp getTo() {
        return to;
    }

    public String getShortName(){
        return this.shortName;
    }
    
    public String getName(){
        return this.name;
    }
    
    public Item getTournament(){
        return this.tournament;
    }
    
    public void setId(long value){
        this.Id = value;
    }

    public void setFrom(Timestamp from) {
        this.from = from;
    }

    public void setTo(Timestamp to) {
        this.to = to;
    }

    public void setShortName(String value){
        this.shortName = value;
    }
    
    public void setName(String value){
        this.name = value;
    }
        
    public void setTournament(Item value){
        this.tournament = value;
    }

    @Override
    public String toString(){
        return this.shortName;
    }
}
