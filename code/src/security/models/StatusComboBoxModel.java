/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import security.database.DBStatus;
import security.entities.Status;

/**
 *
 * @author Administrator
 */
public class StatusComboBoxModel extends AbstractListModel implements ComboBoxModel{
    
    private final List<Status> list;

    private Status selectedItem = null;
    
    public StatusComboBoxModel(){
        list = new DBStatus().getList();
    }
    
    @Override
    public void setSelectedItem(Object anItem) {
        selectedItem = (Status)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
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
