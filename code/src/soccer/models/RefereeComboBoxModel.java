/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBReferee;
import soccer.entities.Referee;

/**
 *
 * @author luis.espinoza
 */
public class RefereeComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<Referee> list;
    private Referee selectedItem;
    
    public RefereeComboBoxModel(int isActive){
        list = new DBReferee().getList(isActive);
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
        selectedItem = (Referee)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
