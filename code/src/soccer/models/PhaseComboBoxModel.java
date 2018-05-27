/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBPhase;
import soccer.entities.Phase;

/**
 *
 * @author Administrator
 */
public class PhaseComboBoxModel extends AbstractListModel implements ComboBoxModel{

    private final List<Phase> list;
    private Phase selectedItem;
    
    public PhaseComboBoxModel(int isActive){
        list = new DBPhase().getList(isActive);
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
        selectedItem = (Phase)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
