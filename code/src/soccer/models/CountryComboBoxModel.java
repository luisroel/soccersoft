/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBCountry;
import soccer.entities.Country;

/**
 *
 * @author Administrator
 */
public class CountryComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<Country> list;
    private Country selectedItem;
    
    public CountryComboBoxModel(int isActive){
        list = new DBCountry().getList(isActive);
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
        selectedItem = (Country)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
