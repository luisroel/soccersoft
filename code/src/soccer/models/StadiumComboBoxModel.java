/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBStadium;
import soccer.entities.Stadium;

/**
 * @author luis.espinoza
 */
public class StadiumComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<Stadium> list;
    private Stadium selectedItem;
    
    public StadiumComboBoxModel(int isActive){
        list = new DBStadium().getList(isActive);
    }
    
    @Override
    public int getSize() {
        return list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return list.get(index);
    }

    @Override
    public void setSelectedItem(Object anItem) {
        selectedItem = (Stadium)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
