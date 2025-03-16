/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author PC
 */
public class UserDAO {

    public static User getUserByEmailAndPassword(String email, String password) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = """
                          SELECT * FROM Users
                          WHERE Email = ? AND Password = ?
                          """; // (2)
            PreparedStatement statement = db.getConnection().prepareStatement(sql); // (3)
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Phone"),
                        rs.getString("Address"));
                users.add(user);
            }
        } catch (SQLException e) {
            return null;
        }
        if (users.isEmpty()) {
            return null;
        } else {
            return users.get(0);
        }
    }

    public static boolean addUser(User user) {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Users (FullName, Email, Password, Role, Phone, Address) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setString(1,user.getFullName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getPassword());
            statement.setString(4,user.getRole());
            statement.setString(5,user.getPhone());
            statement.setString(6,user.getAddress());
            
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public static boolean isEmailExists(String email) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ?";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
        }
        return false;
    }
}
