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
public class Simulation {
    String type;
    private long fixtureId;
    private String tournament;
    private Timestamp time;
    private int groupId;
    private String home;
    private String visit;
    private int SH;
    private int SV;
    private String FC;
    private String rsl;
    private int ok;
    private float odd;
    
    private float idealBet;
    private float idealPayment;
    private float idealBalance;
    
    private float addlProfit;
    private float actualBet;
    private float actualPayment;
    private float actualBalance;
    
    private float level;
    
    public Simulation(
          String type
        , long fixtureId
        , String tournament
        , Timestamp time
        , int groupId
        , String home
        , String visit
        , int SH
        , int SV
        , String FC
        , String rsl
        , int ok
        , float odd
        , float idealBet
        , float idealPayment
        , float idealBalance
        , float addlProfit
        , float actualBet
        , float actualPayment
        , float actualBalance
        , float level
    ){
        this.type = type;
        this.fixtureId = fixtureId;
        this.tournament = tournament;
        this.time = time;
        this.groupId = groupId;        
        this.home = home;
        this.visit = visit;
        this.SH = SH;
        this.SV = SV;
        this.FC = FC;
        this.rsl = rsl;
        this.ok = ok;
        this.odd = odd;
        
        this.idealBet = idealBet;
        this.idealPayment = idealPayment;
        this.idealBalance = idealBalance;

        this.addlProfit = addlProfit;
        this.actualBet = actualBet;
        this.actualPayment = actualPayment;
        this.actualBalance = actualBalance;
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public long getFixtureId() {
        return fixtureId;
    }
        
    public String getTournament() {
        return tournament;
    }
    
    public Timestamp getTime() {
        return time;
    }

    public int getGroupId() {
        return groupId;
    }

    public String getHome() {
        return home;
    }

    public String getVisit() {
        return visit;
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

    public int getOk() {
        return ok;
    }

    public float getOdd() {
        return odd;
    }

    public float getIdealBet() {
        return idealBet;
    }
    
    public float getIdealPayment() {
        return idealPayment;
    }
    
    public float getIdealBalance() {
        return idealBalance;
    }
    
    public float getAddlProfit() {
        return addlProfit;
    }
    
    public float getActualBet() {
        return actualBet;
    }
    
    public float getActualPayment() {
        return actualPayment;
    }
    
    public float getActualBalance() {
        return actualBalance;
    }

    public float getLevel() {
        return level;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setFixtureId(long fixtureId) {
        this.fixtureId = fixtureId;
    }
    
    public void setTournament(String tournament) {
        this.tournament = tournament;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public void setVisit(String visit) {
        this.visit = visit;
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

    public void setOk(int ok) {
        this.ok = ok;
    }

    public void setOdd(float odd) {
        this.odd = odd;
    }
    
    public void setIdealBet(float idealBet) {
        this.idealBet = idealBet;
    }
    
    public void setIdealPayment(float idealPayment) {
        this.idealPayment = idealPayment;
    }
    
    public void setIdealBalance(float idealBalance) {
        this.idealBalance = idealBalance;
    }
    
    public void setAddlProfit(float addlProfit) {
        this.addlProfit = addlProfit;
    }
    
    public void setActualBet(float actualBet) {
        this.actualBet = actualBet;
    }
    
    public void setActualPayment(float actualPayment) {
        this.actualPayment = actualPayment;
    }
    
    public void setActualBalance(float actualBalance) {
        this.actualBalance = actualBalance;
    }
    
    public void setLevel(float level) {
        this.level = level;
    }
}
