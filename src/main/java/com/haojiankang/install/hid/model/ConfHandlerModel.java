package com.haojiankang.install.hid.model;

import com.haojiankang.install.hid.exception.ValidateException;
import com.haojiankang.install.hid.utils.ApplicationContext;
import com.haojiankang.install.hid.utils.CmdUtils;
import com.haojiankang.install.hid.utils.JdbcUtils;
import javafx.application.Application;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ConfHandlerModel {
    private static final Map<String,CmdPaser> CMD_PASER=new ConcurrentHashMap<>();
    static{
        CMD_PASER.put("default",cmdStr->{
           String[] cs=cmdStr.split(" ");
            List<String> args=Arrays.asList(cs);
            HandlerCmd cmd=new HandlerCmd();
            cmd.setCmd(cs[0]);
            cmd.getArgs().addAll(1,args);
            cmd.setArgs(args);
            return cmd;
        });
        CMD_PASER.put("sql",cmdStr -> {
            HandlerCmd cmd=new HandlerCmd();
            cmd.setCmd("sql");
            cmd.getArgs().add(StringUtils.substringBefore(cmdStr.trim()," "));
            cmdStr=StringUtils.substringAfter(cmdStr.trim()," ");
            cmd.getArgs().add(StringUtils.substringBefore(cmdStr.trim()," "));
            cmdStr=StringUtils.substringAfter(cmdStr.trim()," ");
            cmd.getArgs().add(StringUtils.substringBefore(cmdStr.trim()," "));
            cmdStr=StringUtils.substringAfter(cmdStr.trim()," ");
            cmd.getArgs().add(StringUtils.substringBefore(cmdStr.trim()," "));
            cmdStr=StringUtils.substringAfter(cmdStr.trim()," ");
            cmd.getArgs().add("\""+cmdStr.replace("{","\"+").replace("}","+\"")+"\"");
            return cmd;
            }
        );
        CmdUtils.registerExecute("sql",(cmd, out)->{
            if(cmd.getArgs().size()!=5){
                throw new ValidateException("sql cmd args size <> 5!");
            }
            String user=cmd.getArgs().get(1);
            String msg=cmd.getArgs().get(2);
            String index=cmd.getArgs().get(0);
            String result=cmd.getArgs().get(3);
            String sql=cmd.getArgs().get(4);
           JdbcUtils utils= ApplicationContext.get("jdbc."+user);
            out.append(msg);
            out.append("----");
            String queryResult=utils.getString(ApplicationContext.eval(sql));
            ApplicationContext.put(index,queryResult);
            if(result.equals("@")||result.equals(queryResult)){
                out.append("通过\n");
            }else{
                out.append("未通过\n");
            }
           return true;
        });
    }
    private List<HandlerCmd> cmdList;
    {
        cmdList=new ArrayList<>();
    }
    public void analyzeConf(String handlerConf){
        String[] cmds=handlerConf.split("\\$");
        for(String cmd:cmds){
            appendCmd(cmd.trim());
        }
    }
    public void appendCmd(String cmdStr){
        CmdPaser paser=null;
        if(cmdStr.startsWith("@@SQL")||!cmdStr.startsWith("@@")){
            paser=CMD_PASER.get("sql");
            cmdStr=cmdStr.replace("@@SQL","");
        }else{
            String type= StringUtils.substringBefore(cmdStr," ").replace("@","");
             paser=CMD_PASER.get(type);
        }
        if(paser==null){
            paser= CMD_PASER.get("default");
        }
        cmdList.add(paser.paser(cmdStr));
    }


    public List<HandlerCmd> getCmdList() {
        return cmdList;
    }

    public void setCmdList(List<HandlerCmd> cmdList) {
        this.cmdList = cmdList;
    }

    public static String decode(String str){
        return str==null?"":str.replace("&1","$").replace("&2","@")
                .replace("&4","\"").replace("&5","{").replace("&6","}").replace("&9","&");
    }
    public static class HandlerCmd implements CmdUtils.Cmd {
        private String cmd;//默认为SQL
        private List<String> args;
        {
            cmd="SQL";
            args=new ArrayList<>();
        }

        public String getCmd() {
            return cmd;
        }

        public void setCmd(String cmd) {
            this.cmd = cmd;
        }

        public List<String> getArgs() {
            return args;
        }

        public void setArgs(List<String> args) {
            this.args = args;
        }
    }
    @FunctionalInterface
    public static interface CmdPaser{
        HandlerCmd paser(String cmdStr);
    }
}
