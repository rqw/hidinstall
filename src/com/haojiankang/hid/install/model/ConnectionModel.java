package com.haojiankang.hid.install.model;

public class ConnectionModel {
    private String ip;
    private String port;
    private String sid;
    private String driverClass;

    public ConnectionModel() {
    }

    public ConnectionModel(String ip, String port, String sid, String driverClass) {
        this.ip = ip;
        this.port = port;
        this.sid = sid;
        this.driverClass = driverClass;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getDriverClass() {
        return driverClass;
    }

    public void setDriverClass(String driverClass) {
        this.driverClass = driverClass;
    }
}
