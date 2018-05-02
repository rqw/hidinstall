package com.haojiankang.install.hid.service;

import com.haojiankang.install.hid.exception.ValidateException;
import com.haojiankang.install.hid.model.ConfHandlerModel;
import com.haojiankang.install.hid.model.DbModel;
import com.haojiankang.install.hid.utils.*;
import com.haojiankang.install.hid.utils.*;

import java.util.Map;

public class DbService {
    public String testConnection(Map<String,DbModel> model){
        model.forEach((k,v)->{
            try{
                JdbcUtils jdbcUtils=new JdbcUtils();
                jdbcUtils.setConnection(builderConnectionManager(v).openConnection());
                ApplicationContext.put("jdbc."+k,jdbcUtils);
            }catch(Exception e){
                throw new ValidateException("user "+k+" open connection error:\n"+e.getMessage());
            }
        });
        ConfHandlerModel handler=ConfUtils.getConf("db.test");
        StringBuilder message=new StringBuilder();
        handler.getCmdList().forEach(cmd->{
            CmdUtils.executeCmd(cmd,message);
        });
        return message.toString();
    }
    private ConnectionManager builderConnectionManager(DbModel model){
        return new ConnectionManager(model.getcModel().getDriverClass(),model.getcModel().getIp(),model.getcModel().getPort(),model.getcModel().getSid(),model.getuModel().getUsername(),model.getuModel().getPassword());
    }



}
