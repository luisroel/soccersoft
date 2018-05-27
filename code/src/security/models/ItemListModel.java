/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.AbstractListModel;
import security.entities.Item;

/**
 *
 * @author Administrator
 */
public class ItemListModel extends AbstractListModel{
    private final List<Item> list;
    
    public ItemListModel(List<Item> list){
        this.list  = list;
    }
    
    @Override
    public int getSize() {
        return list.size();
    }

    @Override
    public Object getElementAt(int index) {
        return list.get(index);
    }
    
    public void addElement(Item item){
        list.add(item);
        this.fireContentsChanged(this, list.size(), list.size());
    }
    
    public void removeElement(int index){
        list.remove(index);
        this.fireContentsChanged(this, index-1, index);
    }
    
    public void clear(){
        list.clear();
        this.fireContentsChanged(this, 0, 0);
    }
}
