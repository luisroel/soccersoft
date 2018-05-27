/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import security.database.DBModule;
import security.entities.Module;

/**
 *
 * @author Administrator
 */
public class ModuleComboBoxModel extends AbstractListModel implements ComboBoxModel{

    private final List<Module> list;
    private Module selectedItem;
    
    public ModuleComboBoxModel(int isActive){
        list = new DBModule().getList(isActive);
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
        selectedItem = (Module)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
