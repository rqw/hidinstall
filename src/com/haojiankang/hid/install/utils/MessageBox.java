package com.haojiankang.hid.install.utils;

import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;

import java.io.PrintWriter;
import java.io.StringWriter;

public class MessageBox {
    public static void alert(Alert.AlertType type,String title,String header,String message,Throwable e){
        type=type==null?Alert.AlertType.INFORMATION:type;
        title=title==null?"":title;
        header=header==null?"":header;
        message=message==null?"":message;
        Alert alert = new Alert(type);
        if(e!=null){
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            String exceptionText = sw.toString();
            Label label = new Label("The exception stacktrace was:");
            TextArea textArea = new TextArea(exceptionText);
            textArea.setEditable(false);
            textArea.setWrapText(true);
            textArea.setMaxWidth(Double.MAX_VALUE);
            textArea.setMaxHeight(Double.MAX_VALUE);
            GridPane.setVgrow(textArea, Priority.ALWAYS);
            GridPane.setHgrow(textArea, Priority.ALWAYS);
            GridPane expContent = new GridPane();
            expContent.setMaxWidth(Double.MAX_VALUE);
            expContent.add(label, 0, 0);
            expContent.add(textArea, 0, 1);
            alert.getDialogPane().setExpandableContent(expContent);
        }
        
        alert.setTitle(title);
        alert.setHeaderText(header);
        alert.setContentText(message);
       // alert.initOwner(ApplicationContext.get("stage.primary"));
        alert.show();

    }
    public static void alert(String header,Throwable e){
        alert(Alert.AlertType.ERROR,"错误",header,e.getMessage(),e);
    }
    public static void alert(String header,String message){
        alert(null,"提示信息",header,message,null);
    }
}
