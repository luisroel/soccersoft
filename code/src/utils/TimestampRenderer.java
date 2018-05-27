/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.awt.Component;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author luis.espinoza
 */
public class TimestampRenderer extends DefaultTableCellRenderer {
    private final SimpleDateFormat sdf;
    
    public TimestampRenderer(String formatString){
        super();
        this.sdf = new SimpleDateFormat(formatString);
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
        super.setText(this.sdf.format(new Date(((Timestamp)value).getTime())));
        return this;
    }
}
