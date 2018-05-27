/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soccer.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import security.entities.Item;
import security.entities.Status;
import security.entities.TrackChange;
import security.entities.UserRight;
import security.models.StatusComboBoxModel;
import soccer.database.DBConfederation;
import soccer.entities.Confederation;
import soccer.models.ConfederationListModel;

/**
 *
 * @author Administrator
 */
public class FrmConfederation extends javax.swing.JInternalFrame implements ActionListener, ItemListener, ListSelectionListener {

    /**
     * Creates new form FrmConfederation
     */
    public FrmConfederation(UserRight right, Item user) {
        initComponents();
        myInitComponents(right, user);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        cmbStatus = new javax.swing.JComboBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        lstConfederation = new javax.swing.JList();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtId = new javax.swing.JTextField();
        chkActive = new javax.swing.JCheckBox();
        btnNew = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtName = new javax.swing.JTextArea();
        btnEdit = new javax.swing.JButton();
        btnDelete = new javax.swing.JButton();
        txtShortName = new javax.swing.JTextField();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtEntryUser = new javax.swing.JTextField();
        txtModUser = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtEntryDate = new javax.swing.JTextField();
        txtModDate = new javax.swing.JTextField();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("Confederations");

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Filter:"));

        cmbStatus.setName(""); // NOI18N

        jScrollPane1.setViewportView(lstConfederation);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(cmbStatus, javax.swing.GroupLayout.Alignment.LEADING, 0, 153, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(cmbStatus, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1))
        );

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Confederation info:"));

        jLabel1.setText("Id:");

        txtId.setEnabled(false);

        chkActive.setText("Active");

        btnNew.setText("New");

        jLabel2.setText("Short Name:");

        jLabel3.setText("Name:");

        txtName.setColumns(20);
        txtName.setLineWrap(true);
        txtName.setRows(5);
        txtName.setEnabled(false);
        jScrollPane2.setViewportView(txtName);

        btnEdit.setText("Edit");

        btnDelete.setText("Delete");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(6, 6, 6)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 152, Short.MAX_VALUE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, 54, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(chkActive))
                            .addComponent(txtShortName))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnDelete, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnEdit, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnNew, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(txtId, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(txtShortName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(7, 7, 7)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnNew)
                            .addComponent(chkActive))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnEdit)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnDelete)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Change info:"));

        jLabel4.setText("Entry User:");

        jLabel5.setText("Mod. User:");

        txtEntryUser.setEnabled(false);

        txtModUser.setEnabled(false);

        jLabel6.setText("Entry Date:");

        jLabel7.setText("Mod. Date:");

        txtEntryDate.setEnabled(false);

        txtModDate.setEnabled(false);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtEntryDate)
                    .addComponent(txtEntryUser))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel7)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtModUser)
                    .addComponent(txtModDate))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtEntryUser, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(txtModUser, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtEntryDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(txtModDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(19, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnEdit;
    private javax.swing.JButton btnNew;
    private javax.swing.JCheckBox chkActive;
    private javax.swing.JComboBox cmbStatus;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JList lstConfederation;
    private javax.swing.JTextField txtEntryDate;
    private javax.swing.JTextField txtEntryUser;
    private javax.swing.JTextField txtId;
    private javax.swing.JTextField txtModDate;
    private javax.swing.JTextField txtModUser;
    private javax.swing.JTextArea txtName;
    private javax.swing.JTextField txtShortName;
    // End of variables declaration//GEN-END:variables
    
    private int action;
    private DBConfederation dbConfederation;
    private UserRight right;
    private Item user;
 
    private void myInitComponents(UserRight right, Item user) {
        this.user = user;
        this.right = right;
        setNormalScenario();

        dbConfederation = new DBConfederation();
        btnNew.setActionCommand("New");
        btnNew.addActionListener(this);
        btnEdit.setActionCommand("Edit");
        btnEdit.addActionListener(this);
        btnDelete.setActionCommand("Delete");
        btnDelete.addActionListener(this);
        cmbStatus.addItemListener(this);
        lstConfederation.addListSelectionListener(this);
        
        loadStatus();
    }
    
    private void setNormalScenario(){
        cmbStatus.setEnabled(true);
        lstConfederation.setEnabled(true);
        chkActive.setEnabled(false);
        txtName.setEnabled(false);
        txtShortName.setEnabled(false);
        
        btnNew.setEnabled(right.getIsCreated());
        btnEdit.setEnabled(right.getIsUpdated());
        btnDelete.setEnabled(right.getIsDeleted());
        
        btnNew.setText("New");
        btnEdit.setText("Edit");
        
        action = 0;         // no action
    }
    
    private void loadStatus(){
        cmbStatus.setModel(new StatusComboBoxModel());
        cmbStatus.setSelectedIndex(1);
    }
    
    /**
     * Event executed when an item of cmbStatus control is selected
     * @param e 
     */
    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getStateChange() == ItemEvent.SELECTED){
            loadConfederations();
        }
    }

    /**
     * Fills confederation list control
     */
    private void loadConfederations(){
        if (cmbStatus.getModel().getSize() > 0) {
            Status status = (Status)cmbStatus.getSelectedItem();
            lstConfederation.setModel(new ConfederationListModel(dbConfederation.getList(status.getId())));
            if (lstConfederation.getModel().getSize() > 0){
                lstConfederation.setSelectedIndex(0);
            } else {
                // clear data fields
                clearFields();
            }
        } else {
            // clear list and data fields
            clearFields();
        }
    }

    /**
     * Clears control's value
     */
    private void clearFields(){
        txtId.setText("");
        txtName.setText("");
        txtShortName.setText("");
        chkActive.setSelected(true);
        txtEntryUser.setText("");
        txtEntryDate.setText("");
        txtModUser.setText("");
        txtModDate.setText("");
    }

    /**
     * Event executed when a list item is selected
     * @param e 
     */
    @Override
    public void valueChanged(ListSelectionEvent e) {
        loadDetail();
    }

    /**
     * Shows confederations values on controls
     */
    private void loadDetail(){
        if (!lstConfederation.isSelectionEmpty()){
            Confederation obj = (Confederation)lstConfederation.getSelectedValue();
            txtId.setText(Long.toString(obj.getId()));
            txtName.setText(obj.getName());
            txtShortName.setText(obj.getShortName());
            chkActive.setSelected(obj.getIsActive());
            txtEntryUser.setText(obj.getTrack().getEntryUser().getName());
            txtEntryDate.setText(new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").format(obj.getTrack().getEntryDate()));
            txtModUser.setText(obj.getTrack().getModUser().getName());
            txtModDate.setText(new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").format(obj.getTrack().getModDate()));
        }        
    }
    
    /**
     * Catch buttons actions
     * @param e 
     */
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getActionCommand() != null){
            switch (e.getActionCommand()) {
                case "New":
                    newRecord();
                    break;
                case "Edit":
                    editRecord();
                    break;
                case "Delete":
                    deleteRecord();
                    break;
                default:
                    JOptionPane.showMessageDialog(this, "Action not identified", "Unkown", JOptionPane.ERROR_MESSAGE);
                    break;
            }
        }
    }

    /**
     * method to handle new action button
     */
    private void newRecord() {
        if (action == 0){
            setNewScenario();
        }else{
            String msg = validateData();
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(this, msg, "Data Entry Error", JOptionPane.ERROR_MESSAGE);
            }else if (action == 1){                  // insert action
                msg = insertRecord();
                if (msg.isEmpty()){
                    setNormalScenario();
                    loadConfederations();
                    JOptionPane.showMessageDialog(this, "Record created succesfully!", "New", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(this, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }else{                                // update action
                msg = updateRecord();
                if (msg.isEmpty()){
                    setNormalScenario();
                    updateRow();
                    JOptionPane.showMessageDialog(this, "Record updated succesfully!", "Edit", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(this, msg, "Saving Data Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
    }

    /**
     * sets controls conditions when user wants to add a record
     */
    private void setNewScenario(){
        cmbStatus.setEnabled(false);
        lstConfederation.setEnabled(false);
        chkActive.setEnabled(false);
        txtName.setEnabled(true);
        txtShortName.setEnabled(true);
        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        
        clearFields();
        action = 1;     // new action
    }
    
    /**
     * method to validate values controls entered
     * @return 
     */
    private String validateData() {
        String msg;
        if (txtName.getText().equals("")){
            msg = "Name field cannot be empty";
        } else if (txtShortName.getText().equals("")){
            msg = "Short Name field cannot be empty";
        } else {
            msg = "";
        }
        return msg;
    }

    /**
     * method to add a database record
     * @return 
     */
    private String insertRecord() {
        Confederation obj = new Confederation(
              -1
            , txtName.getText()
            , txtShortName.getText()
            , chkActive.isSelected()
            , new TrackChange(null, user, null, null)
        );
        
        return dbConfederation.insert(obj);
    }
    
    /**
     * method to update a database record
     * @return 
     */
    private String updateRecord() {
        Confederation obj = new Confederation(
              Long.parseLong(txtId.getText())
            , txtName.getText()
            , txtShortName.getText()
            , chkActive.isSelected()
            , new TrackChange(null, null, null, user)
        );
        
        return dbConfederation.update(obj);
    }

    /**
     * method to update confederation object currently selected with values input by the user
     */
    private void updateRow(){
        Date date = new Date();
        Confederation obj = (Confederation)lstConfederation.getSelectedValue();
        obj.setName(txtName.getText());
        obj.setShortName(txtShortName.getText());
        obj.setIsActive(chkActive.isSelected());
        obj.getTrack().setModUser(user);
        obj.getTrack().setModDate(new Timestamp(date.getTime()));
        txtModUser.setText(user.getName());
        txtModDate.setText(new SimpleDateFormat("MM/dd/yyyy hh:mm:ss").format(date));
    }
    
    private void editRecord() {
        if (action==0){
            setEditScenario();
        } else {
            setNormalScenario();
            loadDetail();
        }
    }

    /**
     * sets controls conditions when users hit edit button
     */
    private void setEditScenario(){
        cmbStatus.setEnabled(false);
        lstConfederation.setEnabled(false);
        chkActive.setEnabled(true);
        txtName.setEnabled(true);
        txtShortName.setEnabled(true);
        btnNew.setEnabled(true);
        btnEdit.setEnabled(true);
        btnDelete.setEnabled(false);
        
        btnNew.setText("Save");
        btnEdit.setText("Cancel");
        
        action = 2;     // edit action
    }
    
    /**
     * method to handle a delete record from database
     */
    private void deleteRecord() {
        int ans = JOptionPane.showOptionDialog(
                this
                , "You are about to delete the object \"" + txtName.getText() + "\".\nAre you sure?"
                , "Delete"
                , JOptionPane.OK_CANCEL_OPTION
                , JOptionPane.QUESTION_MESSAGE
                , null
                , null
                , null);
        if (ans == JOptionPane.OK_OPTION){
            String msg = dbConfederation.delete(Long.parseLong(txtId.getText()));
            if (!msg.isEmpty()){
                JOptionPane.showMessageDialog(this, msg, "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                loadConfederations();
                JOptionPane.showMessageDialog(this, "Record deleted succesfully!", "Delete", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
}
