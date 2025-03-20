/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Notification;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NotificationDAO {

    public static ArrayList<Notification> getUnreadNotificationsByUserID(int userID) {
        DBContext db = DBContext.getInstance();
        ArrayList<Notification> notifications = new ArrayList<>();

        String sql = """
                 SELECT NotificationID, UserID, Message, SentDate, IsRead
                 FROM Notifications 
                 WHERE UserID = ? AND IsRead = 0 
                 ORDER BY SentDate DESC
                 """;

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userID); // Đặt tham số trước khi thực thi
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    notifications.add(new Notification(
                            rs.getInt("NotificationID"),
                            rs.getInt("UserID"),
                            rs.getString("Message"),
                            rs.getTimestamp("SentDate"),
                            rs.getBoolean("IsRead")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return notifications;
    }

}
