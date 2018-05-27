/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import javax.swing.ComboBoxModel;
import soccer.database.DBPosition;
import soccer.entities.Position;

/**
 *
 * @author Administrator
 */
public class PositionComboBoxModel  extends AbstractListModel implements ComboBoxModel{

    private final List<Position> list;
    private Position selectedItem;
    
    public PositionComboBoxModel(int isActive){
        list = new DBPosition().getList(isActive);
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
        selectedItem = (Position)anItem;
    }

    @Override
    public Object getSelectedItem() {
        return selectedItem;
    }    
}
