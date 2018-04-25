package com.haojiankang.hid.install.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;

public class DbInstallController {
    @FXML
    private TextField txt_ip;
    @FXML
    private TextField txt_port;
    @FXML
    private TextField txt_sid;
    @FXML
    private TextField txt_dba_username;
    @FXML
    private TextField txt_dba_password;
    @FXML
    private TextField txt_yshare_username;
    @FXML
    private TextField txt_yshare_password;
    @FXML
    private TextField txt_hid_username;
    @FXML
    private TextField txt_hid_password;
    @FXML
    private TextField txt_interchg_username;
    @FXML
    private TextField txt_interchg_password;
    @FXML
    public void hadlerTestConnection(ActionEvent event){
        System.out.println(txt_ip.getText());

    }
}
