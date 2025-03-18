/*
 * VehicleDAO.java
 * Created on : Mar 16, 2025
 * Author     : [Your Name]
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import model.Vehicle;

public class VehicleDAO {

    // Lấy danh sách tất cả phương tiện của một chủ sở hữu
    public static ArrayList<Vehicle> getVehiclesByOwner(int ownerID) {
        DBContext db = DBContext.getInstance();
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = """
                         SELECT * 
                         FROM Vehicles 
                         WHERE OwnerID = ?
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, ownerID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle(
                        rs.getInt("VehicleID"),
                        rs.getInt("OwnerID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getInt("ManufactureYear"),
                        rs.getString("EngineNumber")
                );
                vehicles.add(vehicle);
            }
        } catch (Exception e) {
            return null;
        }
        if (vehicles.isEmpty()) {
            return null;
        } else {
            return vehicles;
        }
    }

    // Lấy thông tin phương tiện theo VehicleID (View)
    public static Vehicle getVehicleById(int vehicleID) {
        DBContext db = DBContext.getInstance();
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = """
                         SELECT * 
                         FROM Vehicles 
                         WHERE VehicleID = ?
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setInt(1, vehicleID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle(
                        rs.getInt("VehicleID"),
                        rs.getInt("OwnerID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getInt("ManufactureYear"),
                        rs.getString("EngineNumber")
                );
                vehicles.add(vehicle);
            }
        } catch (Exception e) {
            return null;
        }
        if (vehicles.isEmpty()) {
            return null;
        } else {
            return vehicles.get(0);
        }
    }

    // Lấy thông tin phương tiện theo PlateNumber (dùng cho addVehicleResult)
    public static Vehicle getVehicleByPlateNumber(String plateNumber) {
        DBContext db = DBContext.getInstance();
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        try {
            String sql = """
                         SELECT * 
                         FROM Vehicles 
                         WHERE PlateNumber = ?
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, plateNumber);
            System.out.println(plateNumber);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Vehicle vehicle = new Vehicle(
                        rs.getInt("VehicleID"),
                        rs.getInt("OwnerID"),
                        rs.getString("PlateNumber"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getInt("ManufactureYear"),
                        rs.getString("EngineNumber")
                );
                vehicles.add(vehicle);
            }
        } catch (Exception e) {
            return null;
        }
        if (vehicles.isEmpty()) {
            return null;
        } else {
            return vehicles.get(0);
        }
    }

    public static Vehicle addVehicle(Vehicle vehicle) {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Vehicles (OwnerID, PlateNumber, Brand, Model, ManufactureYear, EngineNumber) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = db.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, vehicle.getOwnerID());
            statement.setString(2, vehicle.getPlateNumber());
            statement.setString(3, vehicle.getBrand());
            statement.setString(4, vehicle.getModel());
            statement.setInt(5, vehicle.getManufactureYear());
            statement.setString(6, vehicle.getEngineNumber());

            int rs = statement.executeUpdate();
            return vehicle;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean updateVehicle(Vehicle vehicle) {
        DBContext db = DBContext.getInstance();
        int rs = 0;
        try {
            String sql = """
                         UPDATE Vehicles
                         SET PlateNumber = ?, Brand = ?, Model = ?, ManufactureYear = ?, EngineNumber = ?
                         WHERE VehicleID = ?
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, vehicle.getPlateNumber());
            statement.setString(2, vehicle.getBrand());
            statement.setString(3, vehicle.getModel());
            statement.setInt(4, vehicle.getManufactureYear());
            statement.setString(5, vehicle.getEngineNumber());
            statement.setInt(6, vehicle.getVehicleID());
            rs = statement.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return rs > 0;
    }

    public static boolean deleteVehicle(String plateNumber) {
        DBContext db = DBContext.getInstance();
        int rs = 0;
        try {
            String sql = """
                         DELETE FROM Vehicles
                         WHERE PlateNumber = ?
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            statement.setString(1, plateNumber);
            rs = statement.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return rs > 0;
    }

    public static ArrayList<String> getAllPlateNumbers() {
        DBContext db = DBContext.getInstance();
        ArrayList<String> plateNumbers = new ArrayList<>();
        String sql = "SELECT PlateNumber FROM Vehicles";

        try {
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                plateNumbers.add(rs.getString("PlateNumber"));
            }
            System.out.println("Danh sách biển số xe: " + plateNumbers);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plateNumbers;
    }
}
