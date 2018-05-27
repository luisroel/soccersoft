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
public class SeasonPhase {
    Item phase;
    String description;
    long records;

    public SeasonPhase(Item phase, String description, long records) {
        this.phase = phase;
        this.description = description;
        this.records = records;
    }

    public Item getPhase() {
        return phase;
    }

    public void setPhase(Item phase) {
        this.phase = phase;
    }

    public long getRecords() {
        return records;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setRecords(long records) {
        this.records = records;
    }
}
