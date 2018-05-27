/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import soccer.entities.FixtureType;

/**
 *
 * @author Administrator
 */
public class FixtureTypeListModel  extends AbstractListModel{
    private final List<FixtureType> list;
    
    public FixtureTypeListModel(List<FixtureType> list){
        this.list = list;
    }
    
    @Override
    public int getSize() {
        return list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return list.get(index);
    }
}
