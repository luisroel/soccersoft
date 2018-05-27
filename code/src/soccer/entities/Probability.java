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
public class Probability {
    private String tournament;
    private Timestamp time;
    private String home;
    private String visit;
    private float Pb_Home;
    private float Pb_Draw;
    private float Pb_Visit;
    private float Max_POH;
    private float Max_POV;
    private float POH_0;
    private float POH_1;
    private float POH_2;
    private float POH_3;
    private float POH_4;
    private float POH_5;
    private float POH_6;
    private float POV_0;
    private float POV_1;
    private float POV_2;
    private float POV_3;
    private float POV_4;
    private float POV_5;
    private float POV_6;
    private String rsl;
    
    public Probability(
          String tournament
        , Timestamp time
        , String home
        , String visit
        , float Pb_Home
        , float Pb_Draw
        , float Pb_Visit
        , float Max_POH
        , float Max_POV
        , float POH_0
        , float POH_1
        , float POH_2
        , float POH_3
        , float POH_4
        , float POH_5
        , float POH_6
        , float POV_0
        , float POV_1
        , float POV_2
        , float POV_3
        , float POV_4
        , float POV_5
        , float POV_6
        , String rsl){
        this.tournament = tournament;
        this.time = time;
        this.home = home;
        this.visit = visit;
        this.Pb_Home = Pb_Home;
        this.Pb_Draw = Pb_Draw;
        this.Pb_Visit = Pb_Visit;
        this.Max_POH = Max_POH;
        this.Max_POV = Max_POV;
        this.POH_0 = POH_0;
        this.POH_1 = POH_1;
        this.POH_2 = POH_2;
        this.POH_3 = POH_3;
        this.POH_4 = POH_4;
        this.POH_5 = POH_5;
        this.POH_6 = POH_6;
        this.POV_0 = POV_0;
        this.POV_1 = POV_1;
        this.POV_2 = POV_2;
        this.POV_3 = POV_3;
        this.POV_4 = POV_4;
        this.POV_5 = POV_5;
        this.POV_6 = POV_6;
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
    
    public float getPb_Home() {
        return Pb_Home;
    }

    public float getPb_Draw() {
        return Pb_Draw;
    }

    public float getPb_Visit() {
        return Pb_Visit;
    }
    
    public float getMax_POH() {
        return Max_POH;
    }

    public float getMax_POV() {
        return Max_POV;
    }

    public float getPOH_0() {
        return POH_0;
    }

    public float getPOH_1() {
        return POH_1;
    }

    public float getPOH_2() {
        return POH_2;
    }

    public float getPOH_3() {
        return POH_3;
    }

    public float getPOH_4() {
        return POH_4;
    }

    public float getPOH_5() {
        return POH_5;
    }

    public float getPOH_6() {
        return POH_6;
    }

    public float getPOV_0() {
        return POV_0;
    }

    public float getPOV_1() {
        return POV_1;
    }

    public float getPOV_2() {
        return POV_2;
    }

    public float getPOV_3() {
        return POV_3;
    }

    public float getPOV_4() {
        return POV_4;
    }

    public float getPOV_5() {
        return POV_5;
    }

    public float getPOV_6() {
        return POV_6;
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
    
    public void setPb_Home(float Pb_Home) {
        this.Pb_Home = Pb_Home;
    }

    public void setPb_Draw(float Pb_Draw) {
        this.Pb_Draw = Pb_Draw;
    }

    public void setPb_Visit(float Pb_Visit) {
        this.Pb_Visit = Pb_Visit;
    }
    
    public void setMax_POH(float Max_POH) {
        this.Max_POH = Max_POH;
    }

    public void setMax_POV(float Max_POV) {
        this.Max_POV = Max_POV;
    }

    public void setPOH_0(float POH_0) {
        this.POH_0 = POH_0;
    }

    public void setPOH_1(float POH_1) {
        this.POH_1 = POH_1;
    }

    public void setPOH_2(float POH_2) {
        this.POH_2 = POH_2;
    }

    public void setPOH_3(float POH_3) {
        this.POH_3 = POH_3;
    }

    public void setPOH_4(float POH_4) {
        this.POH_4 = POH_4;
    }

    public void setPOH_5(float POH_5) {
        this.POH_5 = POH_5;
    }

    public void setPOH_6(float POH_6) {
        this.POH_6 = POH_6;
    }

    public void setPOV_0(float POV_0) {
        this.POV_0 = POV_0;
    }

    public void setPOV_1(float POV_1) {
        this.POV_1 = POV_1;
    }

    public void setPOV_2(float POV_2) {
        this.POV_2 = POV_2;
    }

    public void setPOV_3(float POV_3) {
        this.POV_3 = POV_3;
    }

    public void setPOV_4(float POV_4) {
        this.POV_4 = POV_4;
    }

    public void setPOV_5(float POV_5) {
        this.POV_5 = POV_5;
    }

    public void setPOV_6(float POV_6) {
        this.POV_6 = POV_6;
    }
    
    public void setRsl(String rsl) {
        this.rsl = rsl;
    }
}
