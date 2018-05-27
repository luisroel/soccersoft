/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import java.sql.Timestamp;
import security.entities.Item;
import security.entities.TrackChange;

/**
 *-
 * @author luis.espinoza
 */
public class Fixture {
    private Long id;
    private Item association;
    private Item tournament;
    private Item season;
    private Item phase;
    private Integer round;
    private Timestamp time;
    private Item homeTeam;
    private Integer scoredHome;
    private Item visitorTeam;
    private Integer scoredVisitor;
    private Item stadium;
    private Item referee;
    private Item status;
    private Float odd_1;
    private Float odd_x;
    private Float odd_2;
    private Integer weekNo;
    private String tendency;
    private TrackChange track;
    
    public Fixture(Long id
            , Item association
            , Item tournament
            , Item season
            , Item phase
            , Integer round
            , Timestamp time
            , Item homeTeam
            , Integer scoredHome
            , Item visitorTeam
            , Integer scoredVisitor
            , Item stadium
            , Item referee
            , Item status
            , Float odd_1 
            , Float odd_x
            , Float odd_2
            , Integer weekNo
            , String tendency
            , TrackChange track){
        this.id = id;
        this.association = association;
        this.tournament = tournament;
        this.season = season;
        this.phase = phase;
        this.round = round;
        this.time = time;
        this.homeTeam = homeTeam;
        this.scoredHome = scoredHome;
        this.visitorTeam = visitorTeam;
        this.scoredVisitor = scoredVisitor;
        this.stadium = stadium;
        this.referee = referee;
        this.status = status;
        this.odd_1 = odd_1;
        this.odd_x = odd_x;
        this.odd_2 = odd_2;
        this.weekNo = weekNo;
        this.tendency = tendency;
        this.track = track;
    }
    
    public Long getId(){
        return this.id;
    }

    public Item getAssociation() {
        return this.association;
    }

    public Item getTournament() {
        return this.tournament;
    }
    
    public Item getSeason(){
        return this.season;
    }
    
    public Item getPhase(){
        return this.phase;
    }
    
    public Integer getRound(){
        return this.round;
    }
    
    public Timestamp getTime(){
        return this.time;
    }
    
    public Item getHomeTeam(){
        return this.homeTeam;
    }
    
    public Integer getScoredHome(){
        return this.scoredHome;
    }
    
    public Item getVisitorTeam(){
        return this.visitorTeam;
    }
    
    public Integer getScoredVisitor(){
        return this.scoredVisitor;
    }
    
    public Item getStadium(){
        return this.stadium;
    }
    
    public Item getReferee(){
        return this.referee;
    }
    
    public Item getStatus(){
        return this.status;
    }
    
    public Float getOdd_1(){
        return this.odd_1;
    }

    public Float getOdd_x(){
        return this.odd_x;
    }
        
    public Float getOdd_2(){
        return this.odd_2;
    }
    
    public Integer getWeekNo() {
        return this.weekNo;
    }

    public String getTendency() {
        return this.tendency;
    }
    
    public TrackChange getTrack(){
        return this.track;
    }

    public void setId(Long id) {
        this.id = id;
    }
   
    public void setAssociation(Item association) {
        this.association = association;
    }

    public void setTournament(Item tournament) {
        this.tournament = tournament;
    }
    
    public void setSeason(Item value){
        this.season = value;
    }

    public void setPhase(Item value){
        this.phase = value;
    }
    
    public void setRound(Integer value){
        this.round = value;
    }
    
    public void setTime(Timestamp value){
        this.time = value;
    }
    
    public void setHomeTeam(Item value){
        this.homeTeam = value;
    }
    
    public void setScoredHome(Integer value){
        this.scoredHome = value;
    }
    
    public void setVisitorTeam(Item value){
        this.visitorTeam = value;
    }
    
    public void setScoredVisitor(Integer value){
        this.scoredVisitor = value;
    }
    
    public void setStadium(Item value){
        this.stadium = value;
    }
    
    public void setReferee(Item value){
        this.referee = value;
    }
    
    public void setStatus(Item value){
        this.status = value;
    }

    public void setOdd_1(Float value){
        this.odd_1 = value;
    }

    public void setOdd_x(Float value){
        this.odd_x = value;
    }

    public void setOdd_2(Float value){
        this.odd_2 = value;
    }

    public void setWeekNo(Integer value){
        this.weekNo = value;
    }
    
    public void setTrack(TrackChange value){
        this.track = value;
    }

    public void setTendency(String tendency) {
        this.tendency = tendency;
    }
}
