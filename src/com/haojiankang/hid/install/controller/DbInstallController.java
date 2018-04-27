package com.haojiankang.hid.install.controller;

import com.haojiankang.hid.install.exception.ValidateException;
import com.haojiankang.hid.install.model.ConnectionModel;
import com.haojiankang.hid.install.model.DbModel;
import com.haojiankang.hid.install.service.DbInstallService;
import com.haojiankang.hid.install.utils.ApplicationContext;
import com.haojiankang.hid.install.utils.MessageBox;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;

import java.util.HashMap;
import java.util.Map;

public class DbInstallController {
    private DbInstallService dbInstallService=new DbInstallService();
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
    private TextField txt_ytg_username;
    @FXML
    private TextField txt_ytg_password;
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
        Map<String,DbModel> model=convertToModel();
        if(model!=null)
            try{
                dbInstallService.testConnection(model);
            }catch (ValidateException e){
                MessageBox.alert("提示信息",e);
            }
    }

    private Map<String,DbModel> convertToModel(){
        Map<String,DbModel> model=null;
        if(validate()){
            model=new HashMap<>();
            ConnectionModel connectionModel=new ConnectionModel();
            DbModel dbaModel=new DbModel(connectionModel);
            DbModel ytgModel=new DbModel(connectionModel);
            DbModel yshareModel=new DbModel(connectionModel);
            DbModel hidModel=new DbModel(connectionModel);
            DbModel interchgModel=new DbModel(connectionModel);

            model.put("dba",dbaModel);
            model.put("ytg",ytgModel);
            model.put("yshare",yshareModel);
            model.put("hid",hidModel);
            model.put("interchg",interchgModel);

            connectionModel.setDriverClass("oracle.jdbc.OracleDriver");
            connectionModel.setIp(txt_ip.getText());
            connectionModel.setPort(txt_port.getText());
            connectionModel.setSid(txt_sid.getText());

            dbaModel.setUsername(txt_dba_username.getText());
            dbaModel.setPassword(txt_dba_password.getText());

            ytgModel.setUsername(txt_ytg_username.getText());
            ytgModel.setPassword(txt_ytg_password.getText());

            yshareModel.setUsername(txt_yshare_username.getText());
            yshareModel.setPassword(txt_ytg_password.getText());

            hidModel.setUsername(txt_hid_username.getText());
            hidModel.setPassword(txt_hid_password.getText());

            interchgModel.setUsername(txt_interchg_username.getText());
            interchgModel.setPassword(txt_interchg_password.getText());
        }
        return model;
    }
    public boolean validate(){
        String message="";
        if(txt_ip.getText().isEmpty())message+="ip不能为空.\n";
        if(txt_port.getText().isEmpty())message+="端口号不能为空.\n";
        if(txt_sid.getText().isEmpty())message+="实例名不能为空.\n";
        if(txt_dba_username.getText().isEmpty())message+="管理员用户名不能为空.\n";
        if(txt_dba_password.getText().isEmpty())message+="管理员密码不能为空.\n";
        if(txt_ytg_username.getText().isEmpty())message+="ytg用户名不能为空.\n";
        if(txt_ytg_password.getText().isEmpty())message+="ytg密码不能为空.\n";
        if(txt_yshare_username.getText().isEmpty())message+="yshare用户名不能为空.\n";
        if(txt_yshare_password.getText().isEmpty())message+="yshare密码不能为空.\n";
        if(txt_hid_username.getText().isEmpty())message+="hid用户名不能为空.\n";
        if(txt_hid_password.getText().isEmpty())message+="hid密码不能为空.\n";
        if(txt_interchg_username.getText().isEmpty())message+="interchg用户名不能为空.\n";
        if(txt_interchg_password.getText().isEmpty())message+="interchg密码不能为空.\n";
        if(!message.isEmpty()){
            MessageBox.alert( "输入项目校验不通过,详细错误信息：",message);
            return false;
        }
        return true;
    }

}
