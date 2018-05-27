/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import security.entities.Item;

/**
 *
 * @author lespinoza
 */
public class Summary {
    private Item association;
    private Item tournament;
    private Item season;
    private Item phase;
    private int plays;
    private int homes;
    private int draws;
    private int visitors;
    
    public Summary(Item association, Item tournament, Item season, Item phase, int plays, int homes, int draws, int visitors) {
        this.association = association;
        this.tournament = tournament;
        this.season = season;
        this.phase = phase;
        this.plays = plays;
        this.homes = homes;
        this.draws = draws;
        this.visitors = visitors;
    }

    public Item getAssociation() {
        return association;
    }

    public void setAssociation(Item association) {
        this.association = association;
    }

    public Item getTournament() {
        return tournament;
    }

    public void setTournament(Item tournament) {
        this.tournament = tournament;
    }

    public Item getSeason() {
        return season;
    }

    public void setSeason(Item season) {
        this.season = season;
    }

    public Item getPhase() {
        return phase;
    }

    public void setPhase(Item phase) {
        this.phase = phase;
    }

    public int getPlays() {
        return plays;
    }

    public void setPlays(int plays) {
        this.plays = plays;
    }

    public int getHomes() {
        return homes;
    }

    public void setHomes(int homes) {
        this.homes = homes;
    }

    public int getDraws() {
        return draws;
    }

    public void setDraws(int draws) {
        this.draws = draws;
    }

    public int getVisitors() {
        return visitors;
    }

    public void setVisitors(int visitors) {
        this.visitors = visitors;
    }

}
