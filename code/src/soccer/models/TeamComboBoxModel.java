/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.entities.Team;

/**
 *
 * @author luis.espinoza
 */
public class TeamComboBoxModel extends AbstractListModel implements ComboBoxModel{
    private final List<Team> list;
    private Team selectedItem;
    
    public TeamComboBoxModel(List<Team> list){
        this.list = list;
    }
    
    @Override
    public int getSize() {
        return this.list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return this.list.get(index);
    }

    @Override
    public void setSelectedItem(Object anItem) {
        this.selectedItem = (Team)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return this.selectedItem;
    }
}
