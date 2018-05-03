package com.haojiankang.install.hid.utils;

import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.util.Callback;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;

public class MessageBox {
    public static void alert(String header) {
        alert(Alert.AlertType.ERROR, "错误", header, null, null);
    }

    public static void alert(String header, Throwable e) {
        alert(Alert.AlertType.ERROR, "错误", header, e.getMessage(), e);
    }

    public static void alert(String header, String message) {
        alert(null, "提示信息", header, message, null);
    }

    public static void alert(Alert.AlertType type, String title, String header, String message, Throwable e) {
        Alert alert = createAlert(type, title, header, message, alt -> {
            if (e != null) {
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
                alt.getDialogPane().setExpandableContent(expContent);
            }
        });
        alert.showAndWait();

    }

    public static Writer process(String title, String header, MessageWriterBuilder builder) {
        title = title == null ? "" : title;
        header = header == null ? "" : header;
        Alert alert = createAlert(Alert.AlertType.INFORMATION, title, header, null, null);
        Writer mw = builder.builder(alert);
        alert.show();
        return mw;

    }

    public static void confirm(String message, Consumer<ButtonType> callback) {
        confirm("提示信息", null, message, callback);
    }

    public static void confirm(String title, String header, String message, Consumer<ButtonType> callback) {

        Alert alert = createAlert(Alert.AlertType.NONE, title, header, message, alt -> {
            alt.getButtonTypes().clear();
            alt.getButtonTypes().addAll(new ButtonType("取消", ButtonBar.ButtonData.NO), new ButtonType("确定", ButtonBar.ButtonData.YES));
            callback.accept(alt.showAndWait().get());
        });

    }

    public static Alert createAlert(Alert.AlertType type, String title, String header, String message, Consumer<Alert> callback) {
        type = type == null ? Alert.AlertType.NONE : type;
        title = title == null ? "" : title;
        Alert alert = new Alert(type);
        alert.setTitle(title);
        if (header != null)
            alert.setHeaderText(header);
        if (message != null)
            alert.setContentText(message);
        if (callback != null)
            callback.accept(alert);
        return alert;
    }

    @FunctionalInterface
    public static interface MessageWriterBuilder {
        Writer builder(Alert alert);
    }
}
