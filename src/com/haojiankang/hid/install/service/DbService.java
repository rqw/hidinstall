package com.haojiankang.hid.install.service;

import com.haojiankang.hid.install.exception.ValidateException;
import com.haojiankang.hid.install.model.DbModel;
import com.haojiankang.hid.install.utils.ApplicationContext;
import com.haojiankang.hid.install.utils.ConnectionManager;
import com.haojiankang.hid.install.utils.JdbcUtils;
import javafx.application.Application;

import java.sql.Connection;
import java.util.Map;

public class DbService {
    public boolean testConnection(Map<String,DbModel> model){
        model.forEach((k,v)->{
            ApplicationContext.put("connectionManager."+k,builderConnectionManager(v));
        });
        Connection dbaConnection=getConnectoin( getManager("dba"));
        JdbcUtils jdbcUtils=new JdbcUtils();
        jdbcUtils.setConnection(dbaConnection);
        if(!"YES".equals(jdbcUtils.getString("select t.DEFAULT_ROLE from user_role_privs t where t.granted_role='DBA'"))){
            throw new ValidateException("填写的dba用户不具备dba角色.");
        }

        return true;
    }
    private ConnectionManager  builderConnectionManager(DbModel model){
        return new ConnectionManager(model.getcModel().getDriverClass(),model.getcModel().getIp(),model.getcModel().getPort(),model.getcModel().getSid(),model.getuModel().getUsername(),model.getuModel().getPassword());
    }
    private ConnectionManager getManager(String key){
        return ApplicationContext.get("connectionManager."+key);
    }
    private Connection getConnectoin(ConnectionManager manager){
        try{
            return manager.openConnection();
        }catch(Exception e){
            throw new ValidateException(e.getMessage());
        }
    }


}
