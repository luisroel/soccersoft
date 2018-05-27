/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.entities;

/**
 *
 * @author luis.espinoza
 */
public class Odd {
    private long id;
    private long marketId;
    private Float odd_1;
    private Float odd_x;
    private Float odd_2;
    
    public Odd(
          long id
        , long marketId
        , Float odd_1
        , Float odd_x
        , Float odd_2){
        this.id = id;
        this.marketId = marketId;
        this.odd_1 = odd_1;
        this.odd_x = odd_x;
        this.odd_2 = odd_2;
    }
    
    public long getId(){
        return this.id;
    }
        
    public long getMarketId(){
        return this.marketId;
    }
    
    public Float getOdd_1(){
        return this.odd_1;
    }
    
    public Float getOdd_x(){
        return this.odd_x;
    }
    
    public Float getOdd_2(){
        return this.odd_2;
    }
   
    public void setId(long value){
        this.id = value;
    }
    
    public void setMarketId(long value){
        this.marketId = value;
    }
        
    public void setOdd_1(Float value){
        this.odd_1 = value;
    }
    
    public void setOdd_x(Float value){
        this.odd_x = value;
    }
    
    public void setOdd_2(Float value){
        this.odd_2 = value;
    }    
}
