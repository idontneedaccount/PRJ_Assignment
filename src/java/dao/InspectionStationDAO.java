/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.InspectionRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.InspectionStation;

/**
 *
 * @author PC
 */
public class InspectionStationDAO {

    public static int getTotalInspections() {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM InspectionRecords";
        try {
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return 0;
    }

    public static int getPassCount() {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM InspectionRecords WHERE Result = 'Đạt'";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return 0;
    }

    public static int getFailCount() {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM InspectionRecords WHERE Result = 'Không đạt'";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return 0;
    }

    public static double getPassRate() {
        int total = getTotalInspections();
        if (total == 0) {
            return 0;
        }
        return (double) getPassCount() / total * 100;
    }

    public static ArrayList<InspectionRecord> getAllInspections() {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionRecord> records = new ArrayList<>();
        String sql = "SELECT * FROM InspectionRecords";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                InspectionRecord record = new InspectionRecord(
                        rs.getInt("RecordID"),
                        rs.getInt("VehicleID"),
                        rs.getInt("InspectorID"),
                        rs.getString("Result"),
                        rs.getDouble("CO2Emission"),
                        rs.getDouble("HCEmission"),
                        rs.getString("Comments"));
                records.add(record);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return records;
    }
    
    public static InspectionStation getStationById(int id) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT * FROM InspectionStations WHERE StationID = ?";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new InspectionStation(
                        rs.getInt("StationID"),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Email"));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
}

