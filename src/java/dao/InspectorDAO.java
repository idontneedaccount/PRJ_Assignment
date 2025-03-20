package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.InspectionRecord;
import model.Vehicle;

public class InspectorDAO {
    
    public static List<Vehicle> getPendingInspections() {
        DBContext db = DBContext.getInstance();
        List<Vehicle> pendingVehicles = new ArrayList<>();
        try {
            String sql = """
                SELECT DISTINCT v.* 
                FROM Vehicles v 
                LEFT JOIN InspectionRecords ir ON v.VehicleID = ir.VehicleID 
                WHERE ir.RecordID IS NULL OR ir.Result = 'Null'""";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle(
                        rs.getInt("VehicleID"),
                        rs.getString("PlateNumber")
                );
                pendingVehicles.add(vehicle);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching pending inspections: " + e.getMessage());
        }
        return pendingVehicles;
    }
    
    public static List<InspectionRecord> getInspectionHistory() {
        DBContext db = DBContext.getInstance();
        List<InspectionRecord> history = new ArrayList<>();
        try {
            String sql = """
                SELECT ir.RecordID, v.PlateNumber, ir.InspectionDate, ir.Result, ir.CO2Emission, ir.HCEmission 
                FROM InspectionRecords ir 
                JOIN Vehicles v ON ir.VehicleID = v.VehicleID 
                ORDER BY ir.InspectionDate DESC""";
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                InspectionRecord record = new InspectionRecord(
                        rs.getInt("RecordID"),
                        rs.getString("PlateNumber"),
                        rs.getTimestamp("InspectionDate"),
                        rs.getString("Result"),
                        rs.getDouble("CO2Emission"),
                        rs.getDouble("HCEmission")
                );
                history.add(record);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching inspection history: " + e.getMessage());
        }
        return history;
    }
    
    public static boolean addInspectionRecord(int vehicleId, int stationId, int inspectorId, double co2Emission, double hcEmission, String result, String comments) {
        DBContext db = DBContext.getInstance();
        String sql = """
            INSERT INTO InspectionRecords (VehicleID, StationID, InspectorID, InspectionDate, Result, CO2Emission, HCEmission, Comments) 
            VALUES (?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?, ?)""";
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, vehicleId);
            statement.setInt(2, stationId);
            statement.setInt(3, inspectorId);
            statement.setString(4, result);
            statement.setDouble(5, co2Emission);
            statement.setDouble(6, hcEmission);
            statement.setString(7, comments);
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println("Error adding inspection record: " + e.getMessage());
            return false;
        }
    }
}
