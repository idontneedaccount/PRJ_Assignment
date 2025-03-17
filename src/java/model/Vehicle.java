/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Vehicle {

    int vehicleID;
    int ownerID;
    String plateNumber;
    String brand;
    String model;
    int manufactureYear;
    String engineNumber;

    public Vehicle() {
    }

    public Vehicle(int ownerID, String plateNumber, String brand, String model, int manufactureYear, String engineNumber) {
        this.ownerID = ownerID;
        this.plateNumber = plateNumber;
        this.brand = brand;
        this.model = model;
        this.manufactureYear = manufactureYear;
        this.engineNumber = engineNumber;
    }

    public Vehicle(int vehicleID, int ownerID, String plateNumber, String brand, String model, int manufactureYear, String engineNumber) {
        this.vehicleID = vehicleID;
        this.ownerID = ownerID;
        this.plateNumber = plateNumber;
        this.brand = brand;
        this.model = model;
        this.manufactureYear = manufactureYear;
        this.engineNumber = engineNumber;
    }

    public int getVehicleID() {
        return vehicleID;
    }

    public void setVehicleID(int vehicleID) {
        this.vehicleID = vehicleID;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getManufactureYear() {
        return manufactureYear;
    }

    public void setManufactureYear(int manufactureYear) {
        this.manufactureYear = manufactureYear;
    }

    public String getEngineNumber() {
        return engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

}
