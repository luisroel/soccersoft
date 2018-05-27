/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import security.entities.Item;

/**
 *
 * @author luis.espinoza
 */
public class Standing {
    private Item season;
    private Integer weekNo;
    private Integer position;
    private Item team;
    private Integer played;
    private Integer wins;
    private Integer draws;
    private Integer losses;
    private Integer scored;
    private Integer against;
    private Integer diff;
    private Integer points;
    private String last5;

    public Standing(
            Item season
            , Integer weekNo
            , Integer position
            , Item team
            , Integer played
            , Integer wins
            , Integer draws
            , Integer losses
            , Integer scored
            , Integer against
            , Integer diff
            , Integer points
            , String last5) {
        this.season = season;
        this.weekNo = weekNo;
        this.position = position;
        this.team = team;
        this.played = played;
        this.wins = wins;
        this.draws = draws;
        this.losses = losses;
        this.scored = scored;
        this.against = against;
        this.diff = diff;
        this.points = points;
        this.last5 = last5;
    }

    public Item getSeason() {
        return this.season;
    }

    public Integer getWeekNo() {
        return this.weekNo;
    }

    public Integer getPosition() {
        return this.position;
    }

    public Item getTeam() {
        return this.team;
    }

    public Integer getPlayed() {
        return this.played;
    }

    public Integer getWins() {
        return this.wins;
    }

    public Integer getDraws() {
        return this.draws;
    }

    public Integer getLosses() {
        return this.losses;
    }

    public Integer getScored() {
        return this.scored;
    }

    public Integer getAgainst() {
        return this.against;
    }

    public Integer getDiff() {
        return this.diff;
    }

    public Integer getPoints() {
        return this.points;
    }
    
    public String getLast5() {
        return this.last5;
    }
    
    public void setSeason(Item season) {
        this.season = season;
    }
    
    public void setWeekNo(Integer weekNo) {
        this.weekNo = weekNo;
    }
    
    public void setPosition(Integer position) {
        this.position = position;
    }

    public void setTeam(Item team) {
        this.team = team;
    }

    public void setPlayed(Integer played) {
        this.played = played;
    }

    public void setWins(Integer wins) {
        this.wins = wins;
    }

    public void setDraws(Integer draws) {
        this.draws = draws;
    }

    public void setLosses(Integer losses) {
        this.losses = losses;
    }

    public void setScored(Integer scored) {
        this.scored = scored;
    }

    public void setAgainst(Integer against) {
        this.against = against;
    }

    public void setDiff(Integer diff) {
        this.diff = diff;
    }

    public void setPoints(Integer poIntegers) {
        this.points = poIntegers;
    }
    
    public void setLast5(String last5){
        this.last5 = last5;
    }
}
