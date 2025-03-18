/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

public class Notification {
    private int notificationID;
    private int userID;
    private String message;
    private Timestamp sentDate;
    private boolean isRead;

    public Notification(int notificationID, int userID, String message, Timestamp sentDate, boolean isRead) {
        this.notificationID = notificationID;
        this.userID = userID;
        this.message = message;
        this.sentDate = sentDate;
        this.isRead = isRead;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public int getUserID() {
        return userID;
    }

    public String getMessage() {
        return message;
    }

    public Timestamp getSentDate() {
        return sentDate;
    }

    public boolean isRead() {
        return isRead;
    }
}
