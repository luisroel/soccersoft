/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author luis.espinoza
 */
public class FloatRenderer extends DefaultTableCellRenderer{
    private final String strFormat;
    public FloatRenderer(String strFormat){
        super();
        this.strFormat = strFormat;
    }
    
    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        if (isSelected){
            this.setBackground(table.getSelectionBackground());
            this.setForeground(table.getSelectionForeground());
        }
        else{
            this.setBackground(table.getBackground());
            this.setForeground(table.getForeground());
        }
        super.setText(String.format(strFormat,((Float)value).doubleValue()));
        return this;
    }
}
