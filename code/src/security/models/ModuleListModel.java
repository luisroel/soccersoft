/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.models;

import java.util.List;
import javax.swing.AbstractListModel;
import security.entities.Module;

/**
 *
 * @author Administrator
 */
public class ModuleListModel extends AbstractListModel{
    private final List<Module> list;
    
    public ModuleListModel(List<Module> list){
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
