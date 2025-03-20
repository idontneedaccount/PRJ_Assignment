/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author PC
 */
public class InspectionRecord {

    private int recordID;
    private int vehicleID;
    private String vehicleName;
    private int stationID;
    private String stationName;
    private Timestamp scheduledDate;
    private String status;
    private double cO2Emission;
    private double hCEmission;
    private String comment;

    public InspectionRecord() {
    }

    public InspectionRecord(int recordID, int vehicleID, int stationID, String status, double cO2Emission, double hCEmission,String comment) {
        this.recordID = recordID;
        this.vehicleID = vehicleID;
        this.stationID = stationID;
        this.status = status;
        this.cO2Emission = cO2Emission;
        this.hCEmission = hCEmission;
        this.comment = comment;
    }

    public InspectionRecord(int recordID, String vehicleName, Timestamp scheduledDate, String status, double cO2Emission, double hCEmission) {
        this.recordID = recordID;
        this.vehicleName = vehicleName;
        this.scheduledDate = scheduledDate;
        this.status = status;
        this.cO2Emission = cO2Emission;
        this.hCEmission = hCEmission;
    }

    public InspectionRecord(String vehicleName, String stationName, Timestamp scheduledDate, String status, double cO2Emission, double hCEmission, String comment) {
        this.vehicleName = vehicleName;
        this.stationName = stationName;
        this.scheduledDate = scheduledDate;
        this.status = status;
        this.cO2Emission = cO2Emission;
        this.hCEmission = hCEmission;
        this.comment = comment;
    }

    public InspectionRecord(int recordID, String vehicleName, String stationName, Timestamp scheduledDate, String status, double cO2Emission, double hCEmission, String comment) {
        this.recordID = recordID;
        this.vehicleName = vehicleName;
        this.stationName = stationName;
        this.scheduledDate = scheduledDate;
        this.status = status;
        this.cO2Emission = cO2Emission;
        this.hCEmission = hCEmission;
        this.comment = comment;
    }

    public double getcO2Emission() {
        return cO2Emission;
    }

    public void setcO2Emission(double cO2Emission) {
        this.cO2Emission = cO2Emission;
    }

    public double gethCEmission() {
        return hCEmission;
    }

    public void sethCEmission(double hCEmission) {
        this.hCEmission = hCEmission;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public int getVehicleID() {
        return vehicleID;
    }

    public void setVehicleID(int vehicleID) {
        this.vehicleID = vehicleID;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public int getStationID() {
        return stationID;
    }

    public void setStationID(int stationID) {
        this.stationID = stationID;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public Timestamp getScheduledDate() {
        return scheduledDate;
    }

    public void setScheduledDate(Timestamp scheduledDate) {
        this.scheduledDate = scheduledDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
