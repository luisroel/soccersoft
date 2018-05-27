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
public class NormalProb {
    private Item season;
    private Integer diff;
    private Integer frecuency;
    private Integer max;
    private Integer min;
    private Float Avg;
    private Float std;
    private Float probability;

    public NormalProb(Item season, Integer diff, Integer frecuency, Integer max, Integer min, Float Avg, Float std, Float probability) {
        this.season = season;
        this.diff = diff;
        this.frecuency = frecuency;
        this.max = max;
        this.min = min;
        this.Avg = Avg;
        this.std = std;
        this.probability = probability;
    }

    public Item getSeason() {
        return season;
    }

    public Integer getDiff() {
        return diff;
    }

    public Integer getFrecuency() {
        return frecuency;
    }

    public Integer getMax() {
        return max;
    }

    public Integer getMin() {
        return min;
    }

    public Float getAvg() {
        return Avg;
    }

    public Float getStd() {
        return std;
    }

    public Float getProbability() {
        return probability;
    }

    public void setSeason(Item season) {
        this.season = season;
    }

    public void setDiff(Integer diff) {
        this.diff = diff;
    }

    public void setFrecuency(Integer frecuency) {
        this.frecuency = frecuency;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public void setMin(Integer min) {
        this.min = min;
    }

    public void setAvg(Float Avg) {
        this.Avg = Avg;
    }

    public void setStd(Float std) {
        this.std = std;
    }

    public void setProbability(Float probability) {
        this.probability = probability;
    }
    
}
