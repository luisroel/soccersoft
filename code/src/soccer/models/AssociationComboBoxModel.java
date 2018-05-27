/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBAssociation;
import soccer.entities.Association;

/**
 *
 * @author Administrator
 */
public class AssociationComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<Association> list;
    private Association selectedItem;
    
    public AssociationComboBoxModel(int isActive){
        list = new DBAssociation().getList(isActive);
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
        selectedItem = (Association)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
