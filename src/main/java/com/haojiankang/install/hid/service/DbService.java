package com.haojiankang.install.hid.service;

import com.haojiankang.install.hid.exception.ValidateException;
import com.haojiankang.install.hid.model.ConfHandlerModel;
import com.haojiankang.install.hid.model.DbModel;
import com.haojiankang.install.hid.utils.ApplicationContext;
import com.haojiankang.install.hid.utils.CmdUtils;
import com.haojiankang.install.hid.utils.ConfUtils;
import com.haojiankang.install.hid.utils.ConnectionManager;
import com.haojiankang.install.hid.utils.JdbcUtils;
import com.haojiankang.install.hid.utils.Writer;

import java.util.HashMap;
import java.util.Map;

public class DbService {
    public void testConnection(Map<String,DbModel> model,  Writer writer ){
        model.forEach((k,v)->{
            try{
                writer.writer(new HashMap<String,Object>(){{put("message","正在连接到数据库："+k+"...");}});
                JdbcUtils jdbcUtils=new JdbcUtils();
                jdbcUtils.setConnection(builderConnectionManager(v).openConnection());
                ApplicationContext.put("jdbc."+k,jdbcUtils);
                writer.writer(new HashMap<String,Object>(){{put("message","连接数据库："+k+"成功.");}});
            }catch(Exception e){
                throw new ValidateException("user "+k+" open connection error:\n"+e.getMessage());
            }
        });
        writer.writer(new HashMap<String,Object>(){{put("message","加载需要执行的命令...");}});
        ConfHandlerModel handler=ConfUtils.getConf("db.test");
        StringBuilder message=new StringBuilder();
        writer.writer(new HashMap<String,Object>(){{put("message","开始执行命令...");}});
        handler.getCmdList().forEach(cmd-> {
                    CmdUtils.executeCmd(cmd, writer);
        });
        writer.writer(new HashMap<String,Object>(){{put("message","执行命令完毕...");}});

    }
    private ConnectionManager builderConnectionManager(DbModel model){
        return new ConnectionManager(model.getcModel().getDriverClass(),model.getcModel().getIp(),model.getcModel().getPort(),model.getcModel().getSid(),model.getuModel().getUsername(),model.getuModel().getPassword());
    }



}
