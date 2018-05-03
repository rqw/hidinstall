package com.haojiankang.install.hid.utils;

import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.Window;
import javafx.stage.WindowEvent;

public class FxUtils {
    public static void fixedSizeStage(Stage stage) {
        stage.setMaximized(false);
        stage.setResizable(false);
    }

    public static void titleAndIconStage(Stage stage) {
        stage.setTitle(ViewUtils.single().get("title", "一体机系统3.0版本安装程序"));
        stage.getIcons().add(new Image(ViewUtils.single().get("icon", "/logo.jpg")));
    }

    public static void standardByFxml(Stage stage, String fxmlPath, EventHandler<WindowEvent> closeHandler) throws Exception {
        Parent root = FXMLLoader.load(FxUtils.class.getClassLoader().getResource(fxmlPath));
        stage.setScene(new Scene(root));
        FxUtils.titleAndIconStage(stage);
        FxUtils.fixedSizeStage(stage);
        if (closeHandler == null) closeHandler = e -> {
            Platform.exit();
        };
        stage.setOnCloseRequest(closeHandler);
    }
    public static Window getWindowsByButtonEvent(ActionEvent event){
        return ((Button)event.getSource()).getScene().getWindow();
    }

}
