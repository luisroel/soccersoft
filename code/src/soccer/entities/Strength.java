/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import java.sql.Timestamp;

/**
 *
 * @author luis.espinoza
 */
public class Strength {
    private String tournament;
    private Timestamp time;
    private String home;
    private String visit;
    private float THAGS;
    private float TVAGC;
    private float TVAGS;
    private float THAGC;
    private float THAS;
    private float TVDS;
    private float TVAS;
    private float THDS;
    private float SASH;
    private float SASV;
    private String rsl;
    
    public Strength(
          String tournament
        , Timestamp time
        , String home
        , String visit
        , float THAGS
        , float TVAGC
        , float TVAGS
        , float THAGC
        , float THAS
        , float TVDS
        , float TVAS
        , float THDS
        , float SASH
        , float SASV
        , String rsl){
        this.tournament = tournament;
        this.time = time;
        this.home = home;
        this.visit = visit;
        this.THAGS = THAGS;
        this.TVAGC = TVAGC;
        this.TVAGS = TVAGS;
        this.THAGC = THAGC;
        this.THAS = THAS;
        this.TVDS = TVDS;
        this.TVAS = TVAS;
        this.THDS = THDS;
        this.SASH = SASH;
        this.SASV = SASV;
        this.rsl = rsl;
    }
    
    public String getTournament() {
        return tournament;
    }

    public Timestamp getTime() {
        return time;
    }

    public String getHome() {
        return home;
    }

    public String getVisit() {
        return visit;
    }

    public float getTHAGS() {
        return THAGS;
    }

    public float getTVAGC() {
        return TVAGC;
    }

    public float getTVAGS() {
        return TVAGS;
    }

    public float getTHAGC() {
        return THAGC;
    }

    public float getTHAS() {
        return THAS;
    }

    public float getTVDS() {
        return TVDS;
    }

    public float getTVAS() {
        return TVAS;
    }

    public float getTHDS() {
        return THDS;
    }

    public float getSASH() {
        return SASH;
    }

    public float getSASV() {
        return SASV;
    }

    public String getRsl() {
        return rsl;
    }
    
    public void setTournament(String tournament) {
        this.tournament = tournament;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public void setVisit(String visit) {
        this.visit = visit;
    }

    public void setTHAGS(float THAGS) {
        this.THAGS = THAGS;
    }

    public void setTVAGC(float TVAGC) {
        this.TVAGC = TVAGC;
    }

    public void setTVAGS(float TVAGS) {
        this.TVAGS = TVAGS;
    }

    public void setTHAGC(float THAGC) {
        this.THAGC = THAGC;
    }

    public void setTHAS(float THAS) {
        this.THAS = THAS;
    }

    public void setTVDS(float TVDS) {
        this.TVDS = TVDS;
    }

    public void setTVAS(float TVAS) {
        this.TVAS = TVAS;
    }

    public void setTHDS(float THDS) {
        this.THDS = THDS;
    }

    public void setSASH(float SASH) {
        this.SASH = SASH;
    }

    public void setSASV(float SASV) {
        this.SASV = SASV;
    }
    
    public void setRsl(String rsl) {
        this.rsl = rsl;
    }
}
