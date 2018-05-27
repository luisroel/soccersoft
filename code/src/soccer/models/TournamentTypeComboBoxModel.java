/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBTournamentType;
import soccer.entities.TournamentType;

/**
 *
 * @author Administrator
 */
public class TournamentTypeComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<TournamentType> list;
    private TournamentType selectedItem;
    
    public TournamentTypeComboBoxModel(int isActive){
        list = new DBTournamentType().getList(isActive);
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
        selectedItem = (TournamentType)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
