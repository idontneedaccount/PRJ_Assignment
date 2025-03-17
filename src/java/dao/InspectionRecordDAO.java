/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.InspectionRecord;

public class InspectionRecordDAO {

    public static boolean scheduleInspection(int vehicleID, int stationID, String date) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO InspectionRecords (VehicleID, StationID, InspectionDate, Result, CO2Emission, HCEmission, Comments)
                     VALUES (?, ?, ?, 'Pending', 0, 0, '')
                     """;
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, vehicleID);
            statement.setInt(2, stationID);
            statement.setString(3, date);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public static ArrayList<InspectionRecord> getInspectionHistoryByUser(int userID) {
        DBContext db = DBContext.getInstance();
        ArrayList<InspectionRecord> records = new ArrayList<>();
        String sql = """
                     SELECT ir.* FROM InspectionRecords ir
                     JOIN Vehicles v ON ir.VehicleID = v.VehicleID
                     WHERE v.OwnerID = ?
                     """;
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                records.add(new InspectionRecord(
                        rs.getInt("RecordID"),
                        rs.getInt("VehicleID"),
                        rs.getInt("StationID"),
                        rs.getDate("InspectionDate"),
                        rs.getString("Result"),
                        rs.getDouble("CO2Emission"),
                        rs.getDouble("HCEmission"),
                        rs.getString("Comments")
                ));
            }
        } catch (SQLException e) {
            return null;
        }
        return records;
    }

    public static boolean updateInspectionResult(int recordID, String result, double CO2Emission, double HCEmission, String comments) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE InspectionRecords 
                     SET Result = ?, CO2Emission = ?, HCEmission = ?, Comments = ? 
                     WHERE RecordID = ?
                     """;
        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setString(1, result);
            statement.setDouble(2, CO2Emission);
            statement.setDouble(3, HCEmission);
            statement.setString(4, comments);
            statement.setInt(5, recordID);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }
}
