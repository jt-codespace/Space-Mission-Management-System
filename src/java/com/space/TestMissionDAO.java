/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.space;
import java.util.List;
/**
 *
 * @author dharm
 */
public class TestMissionDAO {

    public static void main(String[] args) {

        MissionDAO dao = new MissionDAO();

        List<Mission> missions = dao.getAllMissions();

        System.out.println("Total Missions: " + missions.size());

        for (Mission mission : missions) {

            System.out.println(
                mission.getMissionId() + " | "
                + mission.getMissionName() + " | "
                + mission.getAgency() + " | "
                + mission.getDestination() + " | "
                + mission.getLaunchDate() + " | "
                + mission.getStatus()
            );
        }
    }
}
