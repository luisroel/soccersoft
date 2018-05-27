/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

import java.sql.Timestamp;
import security.entities.Item;

/**
 *-
 * @author luis.espinoza
 */
public class TableData {
    private int no;
    private Item ct;
    private Item lg;
    private Item ss;
    private Item ph;
    private Timestamp dt;
    private Item hm;
    private Item vs;
    private int sh;
    private int sv;
    private String rsl;
    private float o1;
    private float ox;
    private float o2;
    private float val;
    private int pw1;
    private int pwx;
    private int pw2;
    private int gsh;
    private int gah;
    private int pth;
    private String lh;
    private int gsv;
    private int gav;
    private int ptv;
    private String lv;
    private float dpt;
    private float dft;
    private int dfs;
    private int dfa;
    private int dfh;
    private int dfv;
    private float dgs;
    private float dga;
    private float gpr;
    private float pwi;
    private float pdr;
    private float plt;
    private String td;
    private float do1;
    private float dox;
    private float do2;
    private String mask;
    private int lvd;
    private float prc1;
    private float prcx;
    private float prc2;
    private long ft;
    
    public TableData(
        int no
      , Item ct
      , Item lg
      , Item ss
      , Item ph
      , Timestamp dt
      , Item hm
      , Item vs
      , int sh
      , int sv
      , String rsl
      , float o1
      , float ox
      , float o2
      , float val
      , int pw1
      , int pwx
      , int pw2
      , int gsh
      , int gah
      , int pth
      , String lh
      , int gsv
      , int gav
      , int ptv
      , String lv
      , float dpt
      , float dft
      , int dfs
      , int dfa
      , int dfh
      , int dfv
      , float dgs
      , float dga
      , float gpr
      , float pwi
      , float pdr
      , float plt            
      , String td
      , float do1
      , float dox
      , float do2
      , String mask
      , int lvd
      , float prc1
      , float prcx
      , float prc2
      , long ft){
        this.no = no;
        this.ct = ct;
        this.lg = lg;
        this.dt = dt;
        this.ss = ss;
        this.ph = ph;
        this.hm = hm;
        this.vs = vs;
        this.sh = sh;
        this.sv = sv;
        this.rsl = rsl;
        this.o1 = o1;
        this.ox = ox;
        this.o2 = o2;
        this.val = val;
        this.pw1 = pw1;
        this.pwx = pwx;
        this.pw2 = pw2;
        this.gsh = gsh;
        this.gah = gah;
        this.pth = pth;
        this.lh = lh;
        this.gsv = gsv;
        this.gav = gav;
        this.ptv = ptv;
        this.lv = lv;
        this.dpt = dpt;
        this.dft = dft;
        this.dfs = dfs;
        this.dfa = dfa;
        this.dfv = dfv;
        this.dfh = dfh;
        this.dgs = dgs;
        this.dga = dga;
        this.gpr = gpr;
        this.pwi = pwi;
        this.pdr = pdr;
        this.plt = plt;
        this.td = td;
        this.do1 = do1;
        this.dox = dox;
        this.do2 = do2;
        this.mask = mask;
        this.lvd = lvd;
        this.prc1 = prc1;
        this.prcx = prcx;
        this.prc2 = prc2;
        this.ft = ft;
    }
    
    public int getNo() {
        return no;
    }

    public Item getCt() {
        return ct;
    }

    public Item getLg() {
        return lg;
    }

    public Item getSs() {
        return ss;
    }

    public Item getPh() {
        return ph;
    }

    public Timestamp getDt() {
        return dt;
    }

    public Item getHm() {
        return hm;
    }

    public Item getVs() {
        return vs;
    }

    public int getSh() {
        return sh;
    }

    public int getSv() {
        return sv;
    }

    public String getRsl() {
        return rsl;
    }

    public float getO1() {
        return o1;
    }

    public float getOx() {
        return ox;
    }

    public float getO2() {
        return o2;
    }

    public float getVal() {
        return val;
    }

    public int getPw1() {
        return pw1;
    }

    public int getPwx() {
        return pwx;
    }

    public int getPw2() {
        return pw2;
    }
    
    public int getGsh() {
        return gsh;
    }

    public int getGah() {
        return gah;
    }

    public int getPth() {
        return pth;
    }

    public String getLh() {
        return lh;
    }

    public int getGsv() {
        return gsv;
    }

    public int getGav() {
        return gav;
    }

    public int getPtv() {
        return ptv;
    }

    public String getLv() {
        return lv;
    }

    public float getDpt() {
        return dpt;
    }

    public float getDft() {
        return dft;
    }

    public int getDfs() {
        return dfs;
    }

    public int getDfa() {
        return dfa;
    }

    public int getDfh() {
        return dfh;
    }

    public int getDfv() {
        return dfv;
    }

    public float getDgs() {
        return dgs;
    }

    public float getDga() {
        return dga;
    }

    public float getGpr() {
        return gpr;
    }

    public float getPwi() {
        return pwi;
    }

    public float getPdr() {
        return pdr;
    }

    public float getPlt() {
        return plt;
    }
    
    public String getTd() {
        return td;
    }

    public float getDo1() {
        return do1;
    }

    public float getDox() {
        return dox;
    }

    public float getDo2() {
        return do2;
    }

    public String getMask(){
        return mask;
    }
    
    public int getLvd() {
        return this.lvd;
    }
    
    public float getPrc1(){
        return prc1;
    }

    public float getPrcx(){
        return prcx;
    }
    
    public float getPrc2(){
        return prc2;
    }
    
    public long getFt(){
        return ft;
    }
            

    public void setNo(int no) {
        this.no = no;
    }

    public void setCt(Item ct) {
        this.ct = ct;
    }

    public void setLg(Item lg) {
        this.lg = lg;
    }

    public void setSs(Item ss) {
        this.ss = ss;
    }

    public void setPh(Item ph) {
        this.ph = ph;
    }
    
    public void setDt(Timestamp dt) {
        this.dt = dt;
    }

    public void setHm(Item hm) {
        this.hm = hm;
    }

    public void setVs(Item vs) {
        this.vs = vs;
    }

    public void setSh(int sh) {
        this.sh = sh;
    }

    public void setSv(int sv) {
        this.sv = sv;
    }

    public void setRsl(String rsl) {
        this.rsl = rsl;
    }

    public void setO1(float o1) {
        this.o1 = o1;
    }

    public void setOx(float ox) {
        this.ox = ox;
    }

    public void setO2(float o2) {
        this.o2 = o2;
    }

    public void setVal(float val) {
        this.val = val;
    }

    public void setPw1(int pw1) {
        this.pw1 = pw1;
    }

    public void setPwx(int pwx) {
        this.pwx = pwx;
    }

    public void setPw2(int pw2) {
        this.pw2 = pw2;
    }
    
    public void setGsh(int gsh) {
        this.gsh = gsh;
    }

    public void setGah(int gah) {
        this.gah = gah;
    }

    public void setPth(int pth) {
        this.pth = pth;
    }

    public void setLh(String lh) {
        this.lh = lh;
    }

    public void setGsv(int gsv) {
        this.gsv = gsv;
    }

    public void setGav(int gav) {
        this.gav = gav;
    }

    public void setPtv(int ptv) {
        this.ptv = ptv;
    }

    public void setLv(String lv) {
        this.lv = lv;
    }

    public void setDpt(float dpt) {
        this.dpt = dpt;
    }

    public void setDft(float dft) {
        this.dft = dft;
    }

    public void setDfs(int dfs) {
        this.dfs = dfs;
    }

    public void setDfa(int dfa) {
        this.dfa = dfa;
    }

    public void setDfh(int dfh) {
        this.dfh = dfh;
    }

    public void setDfv(int dfv) {
        this.dfv = dfv;
    }

    public void setDgs(float dgs) {
        this.dgs = dgs;
    }

    public void setDga(float dga) {
        this.dga = dga;
    }

    public void setGpr(float gpr) {
        this.gpr = gpr;
    }

    public void setPwi(float pwi) {
        this.pwi = pwi;
    }

    public void setPdr(float pdr) {
        this.pdr = pdr;
    }

    public void setPlt(float plt) {
        this.plt = plt;
    }
    
    public void setTd(String td) {
        this.td = td;
    }

    public void setDo1(float do1) {
        this.do1 = do1;
    }

    public void setDox(float dox) {
        this.dox = dox;
    }

    public void setDo2(float do2) {
        this.do2 = do2;
    }

    public void setMask(String mask){
        this.mask = mask;
    }
    
    public void setLvd(int lvd) {
        this.lvd = lvd;
    }
    
    public void setPrc1(float prc1){
        this.prc1 = prc1;
    }
    
    public void setPrcx(float prcx){
        this.prcx = prcx;
    }

    public void setPrc2(float prc2){
        this.prc2 = prc2;
    }
    
    public void setFt(long ft){
        this.ft = ft;
    }
    
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 17 * hash + this.no;
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
        final TableData other = (TableData) obj;
        return this.no == other.no;
    }
}
