package com.haojiankang.hid.install.model;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class DbModel {
    private StringProperty ip=new SimpleStringProperty();
    private StringProperty port=new SimpleStringProperty();
    private StringProperty sid=new SimpleStringProperty();

    public String getIp() {
        return ip.get();
    }

    public StringProperty ipProperty() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip.set(ip);
    }

    public String getPort() {
        return port.get();
    }

    public StringProperty portProperty() {
        return port;
    }

    public void setPort(String port) {
        this.port.set(port);
    }

    public String getSid() {
        return sid.get();
    }

    public StringProperty sidProperty() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid.set(sid);
    }
}
