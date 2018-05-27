/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBConfederation;
import soccer.entities.Confederation;

/**
 *
 * @author Administrator
 */
public class ConfederationComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<Confederation> list;
    private Confederation selectedItem;
    
    public ConfederationComboBoxModel(int isActive){
        list = new DBConfederation().getList(isActive);
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
        selectedItem = (Confederation)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
