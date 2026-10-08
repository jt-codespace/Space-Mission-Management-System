<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.space.Mission" %>

<!DOCTYPE html>
<html>
<head>
    <title>Space Mission Management</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            color: #ffffff;
            min-height: 100vh;

            background:
                linear-gradient(rgba(1, 10, 28, 0.88),
                                rgba(1, 10, 28, 0.94)),
                url("images/space-bg.jpg");

            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* ============================= */
        /* HEADER */
        /* ============================= */

        .header {
            height: 85px;
            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 45px;

            background: rgba(2, 15, 38, 0.95);

            border-bottom: 1px solid #1266b5;

            box-shadow: 0 0 25px rgba(0, 140, 255, 0.15);
        }

        .logo {
            font-size: 27px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .logo span {
            color: #1597ff;
        }

        .subtitle {
            color: #8fa8c7;
            font-size: 13px;
            margin-top: 4px;
            letter-spacing: 1px;
        }

        .system-status {
            padding: 10px 20px;

            border: 1px solid #00d084;
            border-radius: 25px;

            color: #00e895;

            background: rgba(0, 208, 132, 0.08);

            font-size: 14px;
        }

        .dot {
            display: inline-block;

            width: 9px;
            height: 9px;

            background: #00e895;

            border-radius: 50%;

            margin-right: 8px;

            box-shadow: 0 0 10px #00e895;
        }

        /* ============================= */
        /* MAIN */
        /* ============================= */

        .container {
            width: 94%;
            max-width: 1500px;

            margin: 45px auto;
        }

        .page-title {
            font-size: 38px;
            margin-bottom: 8px;
        }

        .page-title span {
            color: #1597ff;
        }

        .description {
            color: #8fa8c7;
            margin-bottom: 30px;
            font-size: 15px;
        }

        /* ============================= */
        /* TOP BAR */
        /* ============================= */

        .top-bar {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 20px;
        }

        .section-title {
            font-size: 27px;
        }

        .section-title span {
            color: #1597ff;
        }

        .add-btn {
            text-decoration: none;

            background: linear-gradient(
                135deg,
                #087df0,
                #13a0ff
            );

            color: white;

            padding: 14px 25px;

            border-radius: 10px;

            font-weight: bold;

            transition: 0.3s;

            box-shadow:
                0 0 15px rgba(0, 145, 255, 0.35);
        }

        .add-btn:hover {
            transform: translateY(-2px);

            box-shadow:
                0 0 25px rgba(0, 145, 255, 0.65);
        }

        /* ============================= */
        /* TABLE CARD */
        /* ============================= */

        .table-card {
            background: rgba(3, 22, 47, 0.94);

            border: 1px solid #14558c;

            border-radius: 18px;

            padding: 22px;

            box-shadow:
                0 0 30px rgba(0, 120, 255, 0.12);

            overflow-x: auto;
        }

        table {
            width: 100%;

            border-collapse: separate;

            border-spacing: 0;

            overflow: hidden;

            border-radius: 12px;
        }

        /* ============================= */
        /* TABLE HEADER */
        /* ============================= */

        th {
            background: linear-gradient(
                135deg,
                #0d4f91,
                #0964b8
            );

            color: #ffffff;

            padding: 17px 15px;

            text-align: left;

            font-size: 14px;

            letter-spacing: 0.8px;

            text-transform: uppercase;
        }

        /* ============================= */
        /* TABLE ROWS */
        /* ============================= */

        td {
            padding: 17px 15px;

            border-bottom: 1px solid rgba(50, 120, 180, 0.25);

            color: #dcecff;

            font-size: 15px;
        }

        tr {
            background: rgba(4, 28, 55, 0.75);

            transition: 0.25s;
        }

        tr:hover {
            background: rgba(9, 61, 108, 0.75);

            box-shadow:
                inset 3px 0 0 #1597ff;
        }

        .mission-id {
            color: #20a4ff;

            font-weight: bold;
        }

        .mission-name {
            color: #ffffff;

            font-weight: bold;

            font-size: 16px;
        }

        .agency {
            color: #5bc0ff;

            font-weight: 600;
        }

        /* ============================= */
        /* STATUS */
        /* ============================= */

        .status {
            display: inline-block;

            padding: 7px 16px;

            border-radius: 25px;

            font-size: 13px;

            font-weight: bold;

            min-width: 95px;

            text-align: center;
        }

        .planned {
            color: #ffd21c;

            border: 1px solid #ffd21c;

            background: rgba(255, 190, 0, 0.08);

            box-shadow:
                0 0 8px rgba(255, 190, 0, 0.12);
        }

        .active {
            color: #00e89a;

            border: 1px solid #00e89a;

            background: rgba(0, 232, 154, 0.08);

            box-shadow:
                0 0 8px rgba(0, 232, 154, 0.12);
        }

        .completed {
            color: #20a4ff;

            border: 1px solid #20a4ff;

            background: rgba(32, 164, 255, 0.08);

            box-shadow:
                0 0 8px rgba(32, 164, 255, 0.12);
        }

        /* ============================= */
        /* ACTION BUTTONS */
        /* ============================= */

        .actions {
            display: flex;

            gap: 8px;
        }

        .edit-btn {
            text-decoration: none;

            display: inline-block;

            background: #087fe8;

            color: white;

            padding: 8px 16px;

            border-radius: 7px;

            font-size: 13px;

            font-weight: bold;

            transition: 0.25s;
        }

        .edit-btn:hover {
            background: #159cff;

            box-shadow:
                0 0 12px rgba(21, 156, 255, 0.5);
        }

        .delete-btn {
            border: none;

            background: #d62845;

            color: white;

            padding: 8px 15px;

            border-radius: 7px;

            font-size: 13px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.25s;
        }

        .delete-btn:hover {
            background: #ff3154;

            box-shadow:
                0 0 12px rgba(255, 49, 84, 0.45);
        }

        /* ============================= */
        /* EMPTY DATA */
        /* ============================= */

        .empty {
            text-align: center;

            padding: 50px;

            color: #8fa8c7;

            font-size: 17px;
        }

        /* ============================= */
        /* FOOTER */
        /* ============================= */

        .footer {
            text-align: center;

            margin-top: 35px;

            padding: 20px;

            color: #607d9b;

            font-size: 12px;

            letter-spacing: 1px;
        }

        /* ============================= */
        /* RESPONSIVE */
        /* ============================= */

        @media (max-width: 900px) {

            .header {
                padding: 0 20px;
            }

            .container {
                width: 96%;
            }

            .page-title {
                font-size: 30px;
            }

            .top-bar {
                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }

        }

    </style>

</head>


<body>


<!-- ============================= -->
<!-- HEADER -->
<!-- ============================= -->

<div class="header">

    <div>

        <div class="logo">
            SPACE <span>OPS</span>
        </div>

        <div class="subtitle">
            MISSION MANAGEMENT
        </div>

    </div>


    <div class="system-status">

        <span class="dot"></span>

        SYSTEM ONLINE

    </div>

</div>


<!-- ============================= -->
<!-- MAIN CONTENT -->
<!-- ============================= -->

<div class="container">


    <h1 class="page-title">
        Space Mission <span>Management</span>
    </h1>


    <p class="description">
        Monitor, manage and control registered space missions
        through the mission database.
    </p>


    <!-- TOP BAR -->

    <div class="top-bar">

        <div class="section-title">
            Recent <span>Missions</span>
        </div>


        <a href="addMission.jsp" class="add-btn">
            + Add New Mission
        </a>

    </div>


    <!-- ============================= -->
    <!-- TABLE -->
    <!-- ============================= -->

    <div class="table-card">

        <table>

            <thead>

                <tr>

                    <th>ID</th>

                    <th>Mission</th>

                    <th>Agency</th>

                    <th>Destination</th>

                    <th>Launch Date</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>

            </thead>


            <tbody>


<%

    List<Mission> missions =
            (List<Mission>) request.getAttribute("missions");


    if (missions != null && !missions.isEmpty()) {


        for (Mission mission : missions) {


            String status =
                    mission.getStatus();


            String statusClass = "planned";


            if ("Active".equalsIgnoreCase(status)) {

                statusClass = "active";

            } else if ("Completed".equalsIgnoreCase(status)) {

                statusClass = "completed";

            }

%>


                <tr>


                    <!-- ID -->

                    <td class="mission-id">

                        <%= mission.getMissionId() %>

                    </td>


                    <!-- MISSION -->

                    <td class="mission-name">

                        <%= mission.getMissionName() %>

                    </td>


                    <!-- AGENCY -->

                    <td class="agency">

                        <%= mission.getAgency() %>

                    </td>


                    <!-- DESTINATION -->

                    <td>

                        <%= mission.getDestination() %>

                    </td>


                    <!-- LAUNCH DATE -->

                    <td>

                        <%= mission.getLaunchDate() %>

                    </td>


                    <!-- STATUS -->

                    <td>

                        <span class="status <%= statusClass %>">

                            <%= status %>

                        </span>

                    </td>


                    <!-- ACTION -->

                    <td>

                        <div class="actions">


                            <!-- EDIT -->

                        <a
                            href="<%= request.getContextPath() %>/missions?action=edit&id=<%= mission.getMissionId() %>"
                            class="edit-btn">
                            Edit
                        </a>


                            <!-- DELETE -->

                            <form
                                action="missions"
                                method="post"
                                style="display:inline;">

                                <input
                                    type="hidden"
                                    name="action"
                                    value="delete">


                                <input
                                    type="hidden"
                                    name="missionId"
                                    value="<%= mission.getMissionId() %>">


                                <button
                                    type="submit"
                                    class="delete-btn"
                                    onclick="return confirm('Are you sure you want to delete this mission?');">

                                    Delete

                                </button>

                            </form>


                        </div>

                    </td>


                </tr>


<%

        }

    } else {

%>


                <tr>

                    <td colspan="7" class="empty">

                        No missions found in the database.

                    </td>

                </tr>


<%

    }

%>


            </tbody>

        </table>

    </div>


    <!-- ============================= -->
    <!-- FOOTER -->
    <!-- ============================= -->

    <div class="footer">

        SPACE MISSION MANAGEMENT SYSTEM
        &nbsp; • &nbsp;
        ORACLE DATABASE
        &nbsp; • &nbsp;
        ADVANCED JAVA

    </div>


</div>


</body>

</html>