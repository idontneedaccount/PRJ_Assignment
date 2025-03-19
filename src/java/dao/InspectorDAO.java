/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author duong
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.InspectionRecord;
import model.Vehicle;

public class InspectorDAO {

    private Connection connection;

    public InspectorDAO(Connection connection) {
        this.connection = connection;
    }

    // Lấy danh sách xe chưa có bản ghi kiểm định (pending)
    public List<Vehicle> getPendingInspections() {
        List<Vehicle> pendingVehicles = new ArrayList<>();
        String query = "SELECT DISTINCT v.* "
                + "FROM Vehicles v "
                + "LEFT JOIN InspectionRecords ir ON v.VehicleID = ir.VehicleID "
                + "WHERE ir.RecordID IS NULL OR ir.Result = 'Null'";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleID(rs.getInt("VehicleID"));  // sử dụng phương thức đúng
                vehicle.setPlateNumber(rs.getString("PlateNumber"));
                pendingVehicles.add(vehicle);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pendingVehicles;
    }

    // Lấy lịch sử kiểm định
    public List<InspectionRecord> getInspectionHistory() {
        List<InspectionRecord> history = new ArrayList<>();
        String query = "SELECT ir.RecordID, v.PlateNumber, ir.InspectionDate, ir.Result, ir.CO2Emission, ir.HCEmission "
                + "FROM InspectionRecords ir JOIN Vehicles v ON ir.VehicleID = v.VehicleID "
                + "ORDER BY ir.InspectionDate DESC";
        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                InspectionRecord record = new InspectionRecord();
                record.setRecordID(rs.getInt("RecordID"));
                record.setLicensePlate(rs.getString("PlateNumber"));
                record.setInspectionDate(rs.getTimestamp("InspectionDate"));
                record.setResult(rs.getString("Result"));
                record.setCo2Emission(rs.getDouble("CO2Emission"));
                record.setHcEmission(rs.getDouble("HCEmission"));
                history.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return history;
    }

    // Thêm bản ghi kiểm định
    public boolean addInspectionRecord(int vehicleId, int stationId, int inspectorId, double co2Emission, double hcEmission, String result, String comments) {
        String query = "INSERT INTO InspectionRecords (VehicleID, StationID, InspectorID, InspectionDate, Result, CO2Emission, HCEmission, Comments) "
                + "VALUES (?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, vehicleId);
            ps.setInt(2, stationId);
            ps.setInt(3, inspectorId);
            ps.setString(4, result);
            ps.setDouble(5, co2Emission);
            ps.setDouble(6, hcEmission);
            ps.setString(7, comments);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
