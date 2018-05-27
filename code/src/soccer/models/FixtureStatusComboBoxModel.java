/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBFixtureStatus;
import soccer.entities.FixtureStatus;

/**
 *
 * @author luis.espinoza
 */
public class FixtureStatusComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<FixtureStatus> list;
    private FixtureStatus selectedItem;
    
    public FixtureStatusComboBoxModel(int isActive){
        list = new DBFixtureStatus().getList(isActive);
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
        selectedItem = (FixtureStatus)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
