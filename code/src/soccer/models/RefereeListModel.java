/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import soccer.entities.Referee;

/**
 *
 * @author Administrator
 */
public class RefereeListModel  extends AbstractListModel{
    private final List<Referee> list;
    
    public RefereeListModel(List<Referee> list){
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
