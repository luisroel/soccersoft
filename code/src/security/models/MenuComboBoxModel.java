/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import security.database.DBMenu;
import security.entities.Menu;

/**
 *
 * @author Administrator
 */
public class MenuComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<Menu> list;
    private Menu selectedItem;
    
    public MenuComboBoxModel(int isActive){
        list = new DBMenu().getList(isActive);
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
        selectedItem = (Menu)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
