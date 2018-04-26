package com.haojiankang.hid.install.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
    private String driverClass="oracle.jdbc.OracleDriver";
    private String url="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
    private String username;
    private String passsword;

    public ConnectionManager(String driverClass,String ip,String port,String sid,String username,String password){
        this.driverClass=driverClass;
        this.url=this.url.replace("127.0.0.1",ip).replace("1521",port).replace("orcl",sid);
        this.passsword=password;
        this.username=username;

    }
    public  Connection openConnection()throws  ClassNotFoundException,SQLException{
        Class.forName(driverClass);
       return  DriverManager.getConnection(url,username,passsword);
    }

    public String getDriverClass() {
        return driverClass;
    }

    public void setDriverClass(String driverClass) {
        this.driverClass = driverClass;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasssword() {
        return passsword;
    }

    public void setPasssword(String passsword) {
        this.passsword = passsword;
    }
}
