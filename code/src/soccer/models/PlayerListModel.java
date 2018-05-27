/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.models;

import java.util.List;
import javax.swing.AbstractListModel;
import soccer.entities.Player;

/**
 *
 * @author Administrator
 */
public class PlayerListModel  extends AbstractListModel{
    private final List<Player> list;
    
    public PlayerListModel(List<Player> list){
        this.list = list;
    }
    
    @Override
    public int getSize() {
        return list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return list.get(index);
    }
}
