```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.space.Mission"%>

<%
    Mission mission = (Mission) request.getAttribute("mission");

    if (mission == null) {
%>

<!DOCTYPE html>
<html>
<head>
    <title>Mission Not Found</title>
</head>

<body>

<h2>Mission data not found.</h2>

<a href="missions">Back to Missions</a>

</body>
</html>

<%
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Mission</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;

            background:
                linear-gradient(
                    rgba(2, 8, 23, 0.90),
                    rgba(2, 8, 23, 0.95)
                ),
                url("https://images.unsplash.com/photo-1446776811953-b23d57bd21aa")
                center/cover fixed;

            color: white;
            min-height: 100vh;
        }

        .container {
            width: 650px;
            max-width: 90%;

            margin: 60px auto;

            padding: 35px;

            background: rgba(5, 25, 50, 0.95);

            border: 1px solid #168cff;

            border-radius: 18px;

            box-shadow:
                0 0 30px rgba(0, 140, 255, 0.25);
        }

        h1 {
            text-align: center;

            color: #38a9ff;

            margin-bottom: 30px;
        }

        .subtitle {
            text-align: center;

            color: #9db4ce;

            margin-bottom: 30px;
        }

        label {
            display: block;

            margin-top: 18px;
            margin-bottom: 8px;

            color: #dbeafe;

            font-weight: bold;
        }

        input,
        select {
            width: 100%;

            padding: 13px;

            border-radius: 8px;

            border: 1px solid #176fc1;

            background: #020b1a;

            color: white;

            font-size: 15px;

            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #38a9ff;

            box-shadow:
                0 0 10px rgba(56, 169, 255, 0.3);
        }

        .buttons {
            display: flex;

            gap: 15px;

            margin-top: 30px;
        }

        .btn {
            flex: 1;

            padding: 14px;

            border: none;

            border-radius: 8px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            text-align: center;

            text-decoration: none;
        }

        .update-btn {
            background: #168cff;

            color: white;
        }

        .update-btn:hover {
            background: #0874d1;
        }

        .cancel-btn {
            background: #172b44;

            color: #dbeafe;

            border: 1px solid #31577e;
        }

        .cancel-btn:hover {
            background: #213d5e;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Mission</h1>

    <div class="subtitle">
        Update mission information
    </div>

    <form action="missions" method="post">

        <!-- IMPORTANT -->
        <input type="hidden"
               name="action"
               value="update">

        <label>Mission ID</label>

        <input type="number"
               name="missionId"
               value="<%= mission.getMissionId() %>"
               readonly>


        <label>Mission Name</label>

        <input type="text"
               name="missionName"
               value="<%= mission.getMissionName() %>"
               required>


        <label>Agency</label>

        <input type="text"
               name="agency"
               value="<%= mission.getAgency() %>"
               required>


        <label>Destination</label>

        <input type="text"
               name="destination"
               value="<%= mission.getDestination() %>"
               required>


        <label>Launch Date</label>

        <input type="date"
               name="launchDate"
               value="<%= mission.getLaunchDate() %>"
               required>


        <label>Status</label>

        <select name="status">

            <option value="Planned"
                <%= "Planned".equals(mission.getStatus())
                    ? "selected" : "" %>>
                Planned
            </option>

            <option value="Active"
                <%= "Active".equals(mission.getStatus())
                    ? "selected" : "" %>>
                Active
            </option>

            <option value="Completed"
                <%= "Completed".equals(mission.getStatus())
                    ? "selected" : "" %>>
                Completed
            </option>

        </select>


        <div class="buttons">

            <button type="submit"
                    class="btn update-btn">
                Update Mission
            </button>

            <a href="missions"
               class="btn cancel-btn">
                Cancel
            </a>

        </div>

    </form>

</div>

</body>

</html>
```
