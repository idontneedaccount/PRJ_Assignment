/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author PC
 */
public class InspectionDAO {

    public static ArrayList<InspectionStation> getInspectionStations() {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionStation> stations = new ArrayList<>();
        try {
            String sql = """
                         SELECT StationID, Name, Address, Phone, Email FROM InspectionStations
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                InspectionStation station = new InspectionStation(
                        rs.getInt("StationID"),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Email"));
                stations.add(station);
            }
        } catch (SQLException e) {
            return null;
        }
        return stations;
    }

    public static InspectionRecord addInspection(int vehicleId, int stationId, Timestamp dateTime) {
        DBContext db = DBContext.getInstance();
        String sql = """
            INSERT INTO InspectionRecords (VehicleID, StationID, InspectorID, InspectionDate, Result, CO2Emission, HCEmission, Comments)
            VALUES (?, ?, 1, ?, 'Pending', 0, 0, NULL);
            """;

        try {
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, vehicleId);
            statement.setInt(2, stationId);
            statement.setTimestamp(3, dateTime);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if (rs.next()) {
                    int recordId = rs.getInt(1);

                    String selectSql = """
                        SELECT ir.RecordID, v.PlateNumber, s.Name, ir.InspectionDate, ir.Result, ir.CO2Emission, ir.HCEmission, ir.Comments
                        FROM InspectionRecords ir
                        JOIN Vehicles v ON ir.VehicleID = v.VehicleID
                        JOIN InspectionStations s ON ir.StationID = s.StationID
                        WHERE ir.RecordID = ?;
                        """;

                    try (PreparedStatement selectStmt = db.getConnection().prepareStatement(selectSql)) {
                        selectStmt.setInt(1, recordId);
                        ResultSet resultSet = selectStmt.executeQuery();

                        if (resultSet.next()) {
                            return new InspectionRecord(
                                    resultSet.getInt("RecordID"),
                                    resultSet.getString("PlateNumber"),
                                    resultSet.getString("Name"),
                                    resultSet.getTimestamp("InspectionDate"),
                                    resultSet.getString("Result"),
                                    resultSet.getDouble("CO2Emission"),
                                    resultSet.getDouble("HCEmission"),
                                    resultSet.getString("Comments")
                            );
                        }
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error (addInspection): " + e.getMessage());
        }
        return null;
    }

    public static ArrayList<InspectionRecord> getInspectionRecords() {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionRecord> records = new ArrayList<>();
        try {
            String sql = """
                         SELECT ir.RecordID, v.PlateNumber, s.Name, ir.InspectionDate, ir.Result, ir.CO2Emission, ir.HCEmission, ir.Comments
                         FROM InspectionRecords ir
                         JOIN Vehicles v ON ir.VehicleID = v.VehicleID 
                         JOIN InspectionStations s ON ir.StationID = s.StationID
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                InspectionRecord record = new InspectionRecord(
                        rs.getInt("RecordID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Name"),
                        rs.getTimestamp("InspectionDate"),
                        rs.getString("Result"),
                        rs.getDouble("CO2Emission"),
                        rs.getDouble("HCEmission"),
                        rs.getString("Comments"));
                records.add(record);
            }
        } catch (SQLException e) {
            return null;
        }
        return records;
    }

    public static InspectionRecord getInspectionByPlate(String plateNumber) {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionRecord> inspectionRecords = new ArrayList<>();
        try {
            String sql = """
                SELECT v.PlateNumber, s.Name AS StationName, i.InspectionDate, i.Result, 
                       i.CO2Emission, i.HCEmission, i.Comments
                FROM InspectionRecords i
                JOIN Vehicles v ON i.VehicleID = v.VehicleID
                JOIN InspectionStations s ON i.StationID = s.StationID
                WHERE v.PlateNumber = ? 
                """;

            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, plateNumber);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return new InspectionRecord(
                        plateNumber,
                        rs.getString("StationName"),
                        rs.getTimestamp("InspectionDate"),
                        rs.getString("Result"),
                        rs.getDouble("CO2Emission"),
                        rs.getDouble("HCEmission"),
                        rs.getString("Comments")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
