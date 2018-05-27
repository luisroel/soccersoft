/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import java.util.Objects;
import security.entities.Item;

/**
 *
 * @author lespinoza
 */
public class TeamSeason {
    private Item association;
    private Item tournament;
    private Item season;
    private Item team;

    public TeamSeason(Item association, Item tournament, Item season, Item team) {
        this.association = association;
        this.tournament = tournament;
        this.season = season;
        this.team = team;
    }

    public Item getAssociation() {
        return association;
    }

    public Item getTournament() {
        return tournament;
    }

    public Item getSeason() {
        return season;
    }

    public Item getTeam() {
        return team;
    }

    public void setAssociation(Item association) {
        this.association = association;
    }

    public void setTournament(Item tournament) {
        this.tournament = tournament;
    }

    public void setSeason(Item season) {
        this.season = season;
    }

    public void setTeam(Item team) {
        this.team = team;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + Objects.hashCode(this.association);
        hash = 67 * hash + Objects.hashCode(this.tournament);
        hash = 67 * hash + Objects.hashCode(this.season);
        hash = 67 * hash + Objects.hashCode(this.team);
        return hash;
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
        
        final TeamSeason other = (TeamSeason) obj;
        
        return this.association.getName().equalsIgnoreCase(other.getAssociation().getName())
                && this.tournament.getName().equalsIgnoreCase(other.getTournament().getName())
                && this.season.getName().equalsIgnoreCase(other.getSeason().getName())
                && this.team.getName().equalsIgnoreCase(other.getTeam().getName());
    }
    
}
