/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.SpinnerListModel;
import javax.swing.SpinnerModel;
import soccer.entities.Week;

/**
 *
 * @author luis.espinoza
 */
public class WeekSpinnerModel extends SpinnerListModel{
    private final Week firstValue, lastValue;
    SpinnerModel linkedModel = null;
    
    public WeekSpinnerModel(List<Week> list) {
        super(list);
        this.firstValue = (list.size() > 0) ? list.get(0) : null;
        this.lastValue = (list.size() > 0) ? list.get(list.size()-1) : null;
    }
    
    public void setLinkedModel(SpinnerModel linkedModel){
        this.linkedModel = linkedModel;
    }
    
    @Override
    public Object getNextValue(){
        Object value = super.getNextValue();
        if (value == null){
            value = firstValue;
            if (linkedModel != null){
                linkedModel.setValue(linkedModel.getNextValue());
            }
        }
        return value;
    }
    
    @Override
    public Object getPreviousValue(){
        Object value = super.getPreviousValue();
        if (value == null){
            value = lastValue;
            if (linkedModel != null){
                linkedModel.setValue(linkedModel.getPreviousValue());
            }
        }
       return value;
    }
    
}
