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
public class Rawdata {
    private Timestamp date;
    private String type;
    private String association;
    private String tournament;
    private Timestamp time;
    private String home;
    private String visit;
    private long seasonId;
    private int weekno;
    private long fixtureId;
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
    private float OH;
    private float OV;
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
    private float Pb_Home;
    private float Pb_Draw;
    private float Pb_Visit;
    private float Max_POH;
    private float Max_POV;
    private float Max_OH;
    private float Max_OV;
    private float Diff;
    private int SH;
    private int SV;
    private String FC;
    private String rsl;
    private int ok;
    private float odd;
    
    private int groupId;
    private float idealBet;
    private float idealPayment;
    private float idealBalance;
    
    private float addlProfit;
    private float actualBet;
    private float actualPayment;
    private float actualBalance;
    
    private float level;
    
    public Rawdata(
         Timestamp date
        ,String type
        ,String association
        ,String tournament
        ,Timestamp time
        ,String home
        ,String visit
        ,long seasonId
        ,int weekno
        ,long fixtureId
        ,float THAGS
        ,float TVAGC
        ,float TVAGS
        ,float THAGC
        ,float THAS
        ,float TVDS
        ,float TVAS
        ,float THDS
        ,float SASH
        ,float SASV
        ,float OH
        ,float OV
        ,float POH_0
        ,float POH_1
        ,float POH_2
        ,float POH_3
        ,float POH_4
        ,float POH_5
        ,float POH_6
        ,float POV_0
        ,float POV_1
        ,float POV_2
        ,float POV_3
        ,float POV_4
        ,float POV_5
        ,float POV_6
        ,float Pb_Home
        ,float Pb_Draw
        ,float Pb_Visit
        ,float Max_POH
        ,float Max_POV
        ,float Max_OH
        ,float Max_OV
        ,float Diff
        ,int SH
        ,int SV
        ,String FC
        ,String rsl
        ,int ok
        ,float odd ){
        this.date = date;
        this.type = type;
        this.association = association;
        this.tournament = tournament;
        this.time = time;
        this.home = home;
        this.visit = visit;
        this.seasonId = seasonId;
        this.weekno = weekno;
        this.fixtureId = fixtureId;
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
        this.OH = OH;
        this.OV = OV;
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
        this.Pb_Home = Pb_Home;
        this.Pb_Draw = Pb_Draw;
        this.Pb_Visit = Pb_Visit;
        this.Max_POH = Max_POH;
        this.Max_POV = Max_POV;
        this.Max_OH = Max_OH;
        this.Max_OV = Max_OV;
        this.Diff = Diff;
        this.SH = SH;
        this.SV = SV;
        this.FC = FC;
        this.rsl = rsl;
        this.ok = ok;
        this.odd = odd;
        
        this.groupId = 0;
        
        this.idealBet = 0;
        this.idealPayment = 0;
        this.idealBalance = 0;

        this.addlProfit = 0;
        this.actualBet = 0;
        this.actualPayment = 0;
        this.actualBalance = 0;
        this.level = 0;
    }

    public Timestamp getDate() {
        return date;
    }

    public String getType() {
        return type;
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

    public long getSeasonId() {
        return seasonId;
    }

    public int getWeekno() {
        return weekno;
    }

    public long getFixtureId() {
        return fixtureId;
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

    public float getOH() {
        return OH;
    }

    public float getOV() {
        return OV;
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

    public float getMax_OH() {
        return Max_OH;
    }

    public float getMax_OV() {
        return Max_OV;
    }

    public float getDiff() {
        return Diff;
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

    public int getGroupId() {
        return groupId;
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

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public void setType(String type) {
        this.type = type;
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

    public void setSeasonId(long seasonId) {
        this.seasonId = seasonId;
    }

    public void setWeekno(int weekno) {
        this.weekno = weekno;
    }

    public void setFixtureId(long fixtureId) {
        this.fixtureId = fixtureId;
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

    public void setOH(float OH) {
        this.OH = OH;
    }

    public void setOV(float OV) {
        this.OV = OV;
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

    public void setMax_OH(float Max_OH) {
        this.Max_OH = Max_OH;
    }

    public void setMax_OV(float Max_OV) {
        this.Max_OV = Max_OV;
    }

    public void setDiff(float Diff) {
        this.Diff = Diff;
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
    
    public void setGroupId(int groupId) {
        this.groupId = groupId;
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
