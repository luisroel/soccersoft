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
public class Week {
    private int weekNo;
    private Timestamp from;
    private Timestamp to;
    
    public Week(int weekNo, Timestamp from, Timestamp to){
        this.weekNo = weekNo;
        this.from = from;
        this.to = to;
    }



    public int getWeekNo() {
        return weekNo;
    }

    public Timestamp getFrom() {
        return from;
    }

    public Timestamp getTo() {
        return to;
    }

    public void setWeekNo(int weekNo) {
        this.weekNo = weekNo;
    }

    public void setFrom(Timestamp from) {
        this.from = from;
    }

    public void setTo(Timestamp to) {
        this.to = to;
    }
    
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 31 * hash + this.weekNo;
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
        final Week other = (Week) obj;
        if (this.weekNo != other.weekNo) {
            return false;
        }
        return true;
    }
    
    @Override
    public String toString(){
        return Integer.toString(weekNo);
    }
}
