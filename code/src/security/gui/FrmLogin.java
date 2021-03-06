/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security.gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import javax.swing.JOptionPane;
import security.database.DBLogin;
import security.entities.Item;
import security.entities.UserRight;

/**
 *
 * @author Administrator
 */
public class FrmLogin extends javax.swing.JInternalFrame implements ActionListener{

    /**
     * Creates new form FrmLogin
     * @param parent
     */
    public FrmLogin(FrameDesktop parent) {
        this.parent = parent;
        initComponents();
        myInitComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel3 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        txtUsername = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtPassword = new javax.swing.JPasswordField();
        btnOk = new javax.swing.JButton();
        btnCancel = new javax.swing.JButton();

        setTitle("Login");

        jLabel3.setText("Please enter your credentials:");

        jLabel1.setText("Username:");

        jLabel2.setText("Password:");

        txtPassword.setText("jPasswordField1");

        btnOk.setText("Ok");

        btnCancel.setText("Cancel");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(btnOk, javax.swing.GroupLayout.PREFERRED_SIZE, 62, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnCancel))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtUsername))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel3))
                .addContainerGap(32, Short.MAX_VALUE))
        );

        layout.linkSize(javax.swing.SwingConstants.HORIZONTAL, new java.awt.Component[] {btnCancel, btnOk});

        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(18, Short.MAX_VALUE)
                .addComponent(jLabel3)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtUsername, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(27, 27, 27)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnOk)
                    .addComponent(btnCancel))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancel;
    private javax.swing.JButton btnOk;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPasswordField txtPassword;
    private javax.swing.JTextField txtUsername;
    // End of variables declaration//GEN-END:variables

    private DBLogin dbLogin;
    private Item user;
    private final FrameDesktop parent;
    private List<UserRight> rights;
    
    private void myInitComponents(){
        dbLogin = new DBLogin();
        user = null;
        
        txtUsername.setText("");
        txtPassword.setText("");
        
        btnOk.addActionListener(this);
        btnOk.setActionCommand("Ok");
        btnCancel.addActionListener(this);
        btnCancel.setActionCommand("Cancel");
        this.rootPane.setDefaultButton(btnOk);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if (null != e.getActionCommand()){
            switch (e.getActionCommand()) {
                case "Ok":
                    loginAction();
                    break;
                case "Cancel":
                    cancelAction();
                    break;
                default:
                    JOptionPane.showMessageDialog(this, "Action not identified", "Unkown", JOptionPane.ERROR_MESSAGE);
                    break;
            }
        }
    }
    
    private void loginAction(){
        String msg = validateData();
        if (!msg.isEmpty()){
            JOptionPane.showMessageDialog(this, msg, "Login Error", JOptionPane.ERROR_MESSAGE);
        }else{
            user = dbLogin.getAccess(txtUsername.getText(), String.valueOf(txtPassword.getPassword()));
            if (user == null || user.getId() == 0){
                JOptionPane.showMessageDialog(this, "Username or password invalid!", "Login fail", JOptionPane.ERROR_MESSAGE);
            } else {
                rights = dbLogin.getRights(user.getId());
                parent.loadMenu(rights);
                this.setVisible(false);
            }
        }
    }
    
    private String validateData(){
        String msg;
        if (txtUsername.getText().isEmpty()){
            msg = "You must enter a username.";
        } else {
            msg = "";
        }
        return msg;
    }
    
    private void cancelAction(){
        this.setVisible(false);
    }
    
    public Item getUser(){
        return this.user;
    }
    
    public void setUser(Item value){
        this.user = value;
    }
    
    public List<UserRight> getRights(){
        return this.rights;
    }
}
