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
public class BasicStats {
    private long seasonId;
    private long fixtureId;
    private int weekno;
    private Timestamp time;
    private String association;
    private String tournament;
    private String home;
    private String visit;
    private float odd_1;
    private float odd_x;
    private float odd_2;
    private String last5H;
    private String last5V;
    private float Diff;
    private float OH;
    private float OV;
    private float Max_OH;
    private float Max_OV;
    private int SH;
    private int SV;
    private String FC;
    private String rsl;
    private float odd;
    private int ok;
    
    public BasicStats(
          long seasonId
        , long fixtureId
        , int weekno
        , String association
        , String tournament
        , Timestamp time
        , String home
        , String visit
        , float odd_1
        , float odd_x
        , float odd_2
        , String last5H
        , String last5V
        , float OH
        , float OV
        , float Diff
        , float Max_OH
        , float Max_OV
        , int SH
        , int SV
        , String FC
        , String rsl
        , float odd
        , int ok ){
        this.seasonId = seasonId;
        this.fixtureId = fixtureId;
        this.weekno = weekno;
        this.association = association;
        this.tournament = tournament;
        this.time = time;
        this.home = home;
        this.visit = visit;
        this.odd_1 = odd_1;
        this.odd_x = odd_x;
        this.odd_2 = odd_2;
        this.last5H = last5H;
        this.last5V = last5V;
        this.OH = OH;
        this.OV = OV;
        this.Diff = Diff;
        this.Max_OH = Max_OH;
        this.Max_OV = Max_OV;
        this.SH = SH;
        this.SV = SV;
        this.FC = FC;
        this.rsl = rsl;
        this.odd = odd;
        this.ok = ok;        
    }

    public long getSeasonId() {
        return seasonId;
    }

    public long getFixtureId() {
        return fixtureId;
    }

    public int getWeekno() {
        return weekno;
    }

    public String getAssociation() {
        return association;
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

    public float getOdd_1() {
        return odd_1;
    }

    public float getOdd_x() {
        return odd_x;
    }

    public float getOdd_2() {
        return odd_2;
    }

    public String getLast5H() {
        return last5H;
    }

    public String getLast5V() {
        return last5V;
    }

    public float getOH() {
        return OH;
    }

    public float getOV() {
        return OV;
    }

    public float getDiff() {
        return Diff;
    }

    public float getMax_OH() {
        return Max_OH;
    }

    public float getMax_OV() {
        return Max_OV;
    }

    public int getSH() {
        return SH;
    }

    public int getSV() {
        return SV;
    }

    public String getFC() {
        return FC;
    }

    public String getRsl() {
        return rsl;
    }

    public float getOdd() {
        return odd;
    }
    
    public int getOk() {
        return ok;
    }

    public void setSeasonId(long seasonId) {
        this.seasonId = seasonId;
    }

    public void setFixtureId(long fixtureId) {
        this.fixtureId = fixtureId;
    }

    public void setWeekno(int weekno) {
        this.weekno = weekno;
    }

    public void setAssociation(String association) {
        this.association = association;
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

    public void setOdd_1(float odd_1) {
        this.odd_1 = odd_1;
    }

    public void setOdd_x(float odd_x) {
        this.odd_x = odd_x;
    }

    public void setOdd_2(float odd_2) {
        this.odd_2 = odd_2;
    }

    public void setLast5H(String last5H) {
        this.last5H = last5H;
    }
    
    public void setLast5V(String last5V) {
        this.last5H = last5V;
    }

    public void setOH(float OH) {
        this.OH = OH;
    }

    public void setOV(float OV) {
        this.OV = OV;
    }

    public void setDiff(float Diff) {
        this.Diff = Diff;
    }

    public void setMax_OH(float Max_OH) {
        this.Max_OH = Max_OH;
    }

    public void setMax_OV(float Max_OV) {
        this.Max_OV = Max_OV;
    }

    public void setSH(int SH) {
        this.SH = SH;
    }

    public void setSV(int SV) {
        this.SV = SV;
    }

    public void setFC(String FC) {
        this.FC = FC;
    }

    public void setRsl(String rsl) {
        this.rsl = rsl;
    }

    public void setOdd(float odd) {
        this.odd = odd;
    }
    
    public void setOk(int ok) {
        this.ok = ok;
    }
}
