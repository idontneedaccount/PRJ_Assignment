/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class InspectionRecord {
    private int recordID;
    private int vehicleID;
    private int inspectorID;
    private int stationID;
    private Date inspectionDate;
    private String result;
    private double co2Emission;
    private double hcEmission;
    private String comments;

    public InspectionRecord() {
    }

    public InspectionRecord(int recordID, int vehicleID, int stationID, Date inspectionDate, String result, double co2Emission, double hcEmission, String comments) {
        this.recordID = recordID;
        this.vehicleID = vehicleID;
        this.stationID = stationID;
        this.inspectionDate = inspectionDate;
        this.result = result;
        this.co2Emission = co2Emission;
        this.hcEmission = hcEmission;
        this.comments = comments;
    }

    
    public InspectionRecord(int recordID, int vehicleID, int inspectorID, int stationID, Date inspectionDate, String result, double co2Emission, double hcEmission, String comments) {
        this.recordID = recordID;
        this.vehicleID = vehicleID;
        this.inspectorID = inspectorID;
        this.stationID = stationID;
        this.inspectionDate = inspectionDate;
        this.result = result;
        this.co2Emission = co2Emission;
        this.hcEmission = hcEmission;
        this.comments = comments;
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

    public int getInspectorID() {
        return inspectorID;
    }

    public void setInspectorID(int inspectorID) {
        this.inspectorID = inspectorID;
    }

    public int getStationID() {
        return stationID;
    }

    public void setStationID(int stationID) {
        this.stationID = stationID;
    }

    public Date getInspectionDate() {
        return inspectionDate;
    }

    public void setInspectionDate(Date inspectionDate) {
        this.inspectionDate = inspectionDate;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public double getCo2Emission() {
        return co2Emission;
    }

    public void setCo2Emission(double co2Emission) {
        this.co2Emission = co2Emission;
    }

    public double getHcEmission() {
        return hcEmission;
    }

    public void setHcEmission(double hcEmission) {
        this.hcEmission = hcEmission;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
