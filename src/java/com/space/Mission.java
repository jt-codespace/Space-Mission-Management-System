/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.space;

/**
 *
 * @author dharm
 */
public class Mission {

    private int missionId;
    private String missionName;
    private String agency;
    private String destination;
    private String launchDate;
    private String status;

    public Mission() {
    }

    public Mission(int missionId, String missionName,
                   String agency, String destination,
                   String launchDate, String status) {

        this.missionId = missionId;
        this.missionName = missionName;
        this.agency = agency;
        this.destination = destination;
        this.launchDate = launchDate;
        this.status = status;
    }

    public int getMissionId() {
        return missionId;
    }

    public void setMissionId(int missionId) {
        this.missionId = missionId;
    }

    public String getMissionName() {
        return missionName;
    }

    public void setMissionName(String missionName) {
        this.missionName = missionName;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getLaunchDate() {
        return launchDate;
    }

    public void setLaunchDate(String launchDate) {
        this.launchDate = launchDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
