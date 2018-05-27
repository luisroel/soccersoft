/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import security.entities.Item;

/**
 *
 * @author luis.espinoza
 */
public class ItemComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<Item> list;
    private Item selectedItem;
    
    public ItemComboBoxModel(List<Item> lst){
        list = lst;
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
        selectedItem = (Item)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }
}
