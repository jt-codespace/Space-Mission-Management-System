package com.space;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MissionDAO {

    // ==========================================
    // READ - Get all missions
    // ==========================================
    public List<Mission> getAllMissions() {

        List<Mission> missions = new ArrayList<Mission>();

        String sql = "SELECT MISSIONS_ID, MISSION_NAME, AGENCY, "
                   + "DESTINATION, LAUNCH_DATE, STATUS "
                   + "FROM MISSIONS ORDER BY MISSIONS_ID";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Mission mission = new Mission();

                mission.setMissionId(
                        rs.getInt("MISSIONS_ID"));

                mission.setMissionName(
                        rs.getString("MISSION_NAME"));

                mission.setAgency(
                        rs.getString("AGENCY"));

                mission.setDestination(
                        rs.getString("DESTINATION"));

                if (rs.getDate("LAUNCH_DATE") != null) {

                    mission.setLaunchDate(
                            rs.getDate("LAUNCH_DATE").toString());
                }

                mission.setStatus(
                        rs.getString("STATUS"));

                missions.add(mission);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return missions;
    }


    // ==========================================
    // READ - Get one mission by ID
    // ==========================================
    public Mission getMissionById(int missionId) {

        Mission mission = null;

        String sql = "SELECT MISSIONS_ID, MISSION_NAME, AGENCY, "
                   + "DESTINATION, LAUNCH_DATE, STATUS "
                   + "FROM MISSIONS WHERE MISSIONS_ID = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, missionId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                mission = new Mission();

                mission.setMissionId(
                        rs.getInt("MISSIONS_ID"));

                mission.setMissionName(
                        rs.getString("MISSION_NAME"));

                mission.setAgency(
                        rs.getString("AGENCY"));

                mission.setDestination(
                        rs.getString("DESTINATION"));

                if (rs.getDate("LAUNCH_DATE") != null) {

                    mission.setLaunchDate(
                            rs.getDate("LAUNCH_DATE").toString());
                }

                mission.setStatus(
                        rs.getString("STATUS"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return mission;
    }


    // ==========================================
    // CREATE - Add mission
    // ==========================================
    public boolean addMission(Mission mission) {

        String sql = "INSERT INTO MISSIONS "
                   + "(MISSIONS_ID, MISSION_NAME, AGENCY, "
                   + "DESTINATION, LAUNCH_DATE, STATUS) "
                   + "VALUES (?, ?, ?, ?, "
                   + "TO_DATE(?, 'YYYY-MM-DD'), ?)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    mission.getMissionId());

            ps.setString(
                    2,
                    mission.getMissionName());

            ps.setString(
                    3,
                    mission.getAgency());

            ps.setString(
                    4,
                    mission.getDestination());

            ps.setString(
                    5,
                    mission.getLaunchDate());

            ps.setString(
                    6,
                    mission.getStatus());

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // UPDATE - Update mission
    // ==========================================
    public boolean updateMission(Mission mission) {

        String sql = "UPDATE MISSIONS SET "
                   + "MISSION_NAME = ?, "
                   + "AGENCY = ?, "
                   + "DESTINATION = ?, "
                   + "LAUNCH_DATE = TO_DATE(?, 'YYYY-MM-DD'), "
                   + "STATUS = ? "
                   + "WHERE MISSIONS_ID = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(
                    1,
                    mission.getMissionName());

            ps.setString(
                    2,
                    mission.getAgency());

            ps.setString(
                    3,
                    mission.getDestination());

            ps.setString(
                    4,
                    mission.getLaunchDate());

            ps.setString(
                    5,
                    mission.getStatus());

            ps.setInt(
                    6,
                    mission.getMissionId());

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // DELETE - Delete mission
    // ==========================================
    public boolean deleteMission(int missionId) {

        String sql =
                "DELETE FROM MISSIONS WHERE MISSIONS_ID = ?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    missionId);

            int result =
                    ps.executeUpdate();

            ps.close();
            con.close();

            return result > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}