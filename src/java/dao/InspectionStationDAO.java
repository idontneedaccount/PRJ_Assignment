/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.InspectionStation;

public class InspectionStationDAO {

    public static ArrayList<InspectionStation> getAllStations() {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionStation> stations = new ArrayList<>();
        String sql = "SELECT * FROM InspectionStations";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                stations.add(new InspectionStation(
                        rs.getInt("StationID"),
                        rs.getString("Name"),
                        rs.getString("Location"),
                        rs.getString("Phone"),
                        rs.getString("Email")
                ));
            }
        } catch (SQLException e) {
            System.out.println("SQL Error" + e.getMessage());
            return null;
        }
        return stations;
    }

    public static InspectionStation getStationById(int stationID) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM InspectionStations WHERE StationID = ?";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, stationID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new InspectionStation(
                        rs.getInt("StationID"),
                        rs.getString("Name"),
                        rs.getString("Location"),
                        rs.getString("Phone"),
                        rs.getString("Email")
                );
            }
        } catch (SQLException e) {
            System.out.println("SQL Error" + e.getMessage());
            return null;
        }
        return null;
    }
}
