<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Space Mission Management</title>

<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background:
            linear-gradient(rgba(1, 8, 22, 0.88), rgba(1, 8, 22, 0.95)),
            url("https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=2000&q=85");

        background-size: cover;
        background-position: center;
        background-attachment: fixed;

        color: #ffffff;
        min-height: 100vh;
    }

    /* ================= SIDEBAR ================= */

    .sidebar {
        position: fixed;
        left: 0;
        top: 0;
        width: 270px;
        height: 100vh;

        background:
            linear-gradient(
                rgba(2, 12, 30, 0.96),
                rgba(1, 7, 20, 0.98)
            );

        border-right: 1px solid rgba(0, 153, 255, 0.45);

        padding: 25px 18px;

        z-index: 1000;
    }

    .logo {
        padding: 0 18px 35px;
    }

    .logo h1 {
        font-size: 28px;
        letter-spacing: 1px;
        color: white;
    }

    .logo span {
        color: #00aaff;
    }

    .logo p {
        margin-top: 7px;
        font-size: 12px;
        letter-spacing: 2px;
        color: #6fa9d6;
    }

    .section-title {
        color: #55708e;
        font-size: 12px;
        letter-spacing: 1.5px;
        margin: 18px 10px 12px;
        text-transform: uppercase;
    }

    .menu a {
        display: block;
        text-decoration: none;
        color: #dcecff;

        padding: 15px 18px;
        margin-bottom: 8px;

        border-radius: 9px;

        transition: 0.3s;
    }

    .menu a:hover {
        background: rgba(0, 126, 255, 0.18);
        color: #ffffff;
        transform: translateX(4px);
    }

    .menu a.active {
        background: linear-gradient(
            90deg,
            #0967d8,
            #168df5
        );

        box-shadow:
            0 0 20px rgba(0, 132, 255, 0.35);

        color: white;
    }

    .icon {
        margin-right: 12px;
        font-size: 18px;
    }

    /* ================= MAIN ================= */

    .main {
        margin-left: 270px;
        min-height: 100vh;
        padding: 30px 40px;
    }

    /* ================= TOP HEADER ================= */

    .top-header {
        display: flex;
        justify-content: space-between;
        align-items: center;

        margin-bottom: 28px;
    }

    .welcome {
        color: #55c7ff;
        font-size: 15px;
        margin-bottom: 7px;
    }

    .welcome span {
        color: white;
    }

    .title {
        font-size: 42px;
        font-weight: 700;

        background: linear-gradient(
            90deg,
            #ffffff,
            #56b9ff
        );

        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .subtitle {
        margin-top: 8px;
        color: #8daac5;
        font-size: 16px;
    }

    .online {
        padding: 11px 20px;
        border-radius: 30px;

        border: 1px solid #159447;

        color: #47e67c;

        background: rgba(0, 70, 30, 0.25);

        box-shadow:
            0 0 15px rgba(0, 255, 120, 0.1);
    }

    .online-dot {
        display: inline-block;

        width: 10px;
        height: 10px;

        background: #35e879;

        border-radius: 50%;

        margin-right: 8px;

        box-shadow: 0 0 10px #35e879;
    }

    /* ================= STAT CARDS ================= */

    .stats {
        display: grid;

        grid-template-columns:
            repeat(4, 1fr);

        gap: 20px;

        margin-bottom: 28px;
    }

    .stat-card {
        position: relative;

        background:
            linear-gradient(
                145deg,
                rgba(7, 35, 67, 0.95),
                rgba(3, 19, 40, 0.95)
            );

        border: 1px solid #164b78;

        border-radius: 14px;

        padding: 25px;

        overflow: hidden;

        transition: 0.3s;
    }

    .stat-card:hover {
        transform: translateY(-5px);

        box-shadow:
            0 10px 30px rgba(0, 120, 255, 0.15);
    }

    .stat-card.blue {
        border-top: 2px solid #1598ff;
    }

    .stat-card.green {
        border-top: 2px solid #00e59a;
    }

    .stat-card.purple {
        border-top: 2px solid #b34cff;
    }

    .stat-card.yellow {
        border-top: 2px solid #ffbd27;
    }

    .stat-label {
        color: #9bb3c9;
        font-size: 13px;
        letter-spacing: 1px;
    }

    .stat-number {
        font-size: 43px;
        font-weight: 700;
        margin-top: 12px;
    }

    .blue .stat-number {
        color: #42aaff;
    }

    .green .stat-number {
        color: #2de6a4;
    }

    .purple .stat-number {
        color: #b866ff;
    }

    .yellow .stat-number {
        color: #ffc02d;
    }

    .stat-change {
        color: #26e6a1;
        font-size: 12px;
        margin-top: 8px;
    }

    .circle {
        position: absolute;

        width: 100px;
        height: 100px;

        right: -30px;
        bottom: -40px;

        border-radius: 50%;

        background: rgba(30, 110, 180, 0.12);
    }

    /* ================= CONTENT ================= */

    .content-grid {
        display: grid;

        grid-template-columns:
            minmax(0, 2fr)
            minmax(300px, 0.85fr);

        gap: 25px;
    }

    .panel {
        background:
            linear-gradient(
                145deg,
                rgba(3, 25, 51, 0.97),
                rgba(2, 14, 31, 0.97)
            );

        border: 1px solid #124b7b;

        border-radius: 14px;

        padding: 28px;

        box-shadow:
            0 15px 40px rgba(0, 0, 0, 0.2);
    }

    .panel-header {
        display: flex;

        justify-content: space-between;
        align-items: center;

        margin-bottom: 20px;
    }

    .panel-title {
        font-size: 25px;
    }

    .panel-subtitle {
        color: #7894ad;
        font-size: 13px;
        margin-top: 5px;
    }

    .view-button {
        text-decoration: none;

        background: #087de5;
        color: white;

        padding: 12px 18px;

        border-radius: 8px;

        font-size: 13px;

        transition: 0.3s;
    }

    .view-button:hover {
        background: #159aff;

        box-shadow:
            0 0 18px rgba(0, 145, 255, 0.4);
    }

    /* ================= TABLE ================= */

    .mission-table {
        width: 100%;

        border-collapse: separate;
        border-spacing: 0 7px;
    }

    .mission-table th {
        text-align: left;

        padding: 13px 14px;

        color: #6ec7ff;

        background: #073661;

        font-size: 12px;

        letter-spacing: 0.5px;
    }

    .mission-table th:first-child {
        border-radius: 8px 0 0 8px;
    }

    .mission-table th:last-child {
        border-radius: 0 8px 8px 0;
    }

    .mission-table td {
        padding: 15px 14px;

        background: rgba(2, 22, 43, 0.9);

        border-top: 1px solid #143d61;
        border-bottom: 1px solid #143d61;

        color: #dbeaff;

        font-size: 13px;
    }

    .mission-table tr:hover td {
        background: rgba(10, 60, 100, 0.65);
    }

    .mission-table td:first-child {
        border-left: 1px solid #143d61;
        border-radius: 7px 0 0 7px;
    }

    .mission-table td:last-child {
        border-right: 1px solid #143d61;
        border-radius: 0 7px 7px 0;
    }

    /* ================= STATUS ================= */

    .status {
        display: inline-block;

        padding: 6px 14px;

        border-radius: 20px;

        font-size: 11px;

        font-weight: 600;
    }

    .planned {
        color: #ffd13b;

        border: 1px solid #d89d00;

        background: rgba(220, 160, 0, 0.12);
    }

    .active {
        color: #35efb0;

        border: 1px solid #00a978;

        background: rgba(0, 190, 130, 0.12);
    }

    .completed {
        color: #49aaff;

        border: 1px solid #087de5;

        background: rgba(0, 100, 220, 0.12);
    }

    /* ================= SYSTEM STATUS ================= */

    .system-row {
        display: flex;

        justify-content: space-between;
        align-items: center;

        padding: 19px 0;

        border-bottom: 1px solid #173a5c;

        color: #dbeaff;
    }

    .system-row:last-child {
        border-bottom: none;
    }

    .system-status {
        color: #31e69c;

        font-size: 13px;
    }

    .system-status.blue {
        color: #32aaff;
    }

    .dot {
        display: inline-block;

        width: 8px;
        height: 8px;

        border-radius: 50%;

        background: #30e79b;

        margin-right: 7px;

        box-shadow: 0 0 8px #30e79b;
    }

    .dot.blue {
        background: #30aaff;

        box-shadow: 0 0 8px #30aaff;
    }

    /* ================= SPACE IMAGE ================= */

    .space-image {
        height: 170px;

        margin-top: 20px;

        border-radius: 10px;

        background:
            linear-gradient(
                rgba(2, 13, 30, 0.25),
                rgba(2, 13, 30, 0.55)
            ),
            url("https://images.unsplash.com/photo-1517976547714-720226b864c1?auto=format&fit=crop&w=1000&q=80");

        background-size: cover;

        background-position: center;

        display: flex;

        align-items: flex-end;

        padding: 20px;

        border: 1px solid #164b78;
    }

    .space-image h3 {
        font-size: 17px;
    }

    .space-image p {
        color: #a9c6dd;
        font-size: 12px;
        margin-top: 5px;
    }

    /* ================= QUICK ACTIONS ================= */

    .quick-actions {
        display: grid;

        grid-template-columns:
            repeat(3, 1fr);

        gap: 15px;

        margin-top: 25px;
    }

    .quick-action {
        text-decoration: none;

        padding: 18px;

        border: 1px solid #15528a;

        border-radius: 10px;

        background:
            linear-gradient(
                145deg,
                rgba(7, 45, 82, 0.9),
                rgba(2, 20, 40, 0.9)
            );

        color: white;

        transition: 0.3s;
    }

    .quick-action:hover {
        transform: translateY(-3px);

        border-color: #159aff;

        box-shadow:
            0 0 20px rgba(0, 135, 255, 0.2);
    }

    .quick-action h3 {
        font-size: 14px;
        margin-bottom: 5px;
    }

    .quick-action p {
        color: #7894ad;
        font-size: 11px;
    }

    /* ================= FOOTER ================= */

    footer {
        text-align: center;

        margin-top: 30px;

        padding: 20px;

        color: #58728b;

        font-size: 11px;

        letter-spacing: 1px;
    }

    /* ================= RESPONSIVE ================= */

    @media(max-width: 1100px) {

        .stats {
            grid-template-columns: repeat(2, 1fr);
        }

        .content-grid {
            grid-template-columns: 1fr;
        }
    }

    @media(max-width: 700px) {

        .sidebar {
            width: 210px;
        }

        .main {
            margin-left: 210px;
            padding: 20px;
        }

        .title {
            font-size: 30px;
        }

        .stats {
            grid-template-columns: 1fr;
        }

        .quick-actions {
            grid-template-columns: 1fr;
        }
    }

</style>


</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">


<div class="logo">
    <h1>SPACE <span>OPS</span></h1>
    <p>MISSION MANAGEMENT</p>
</div>

<div class="section-title">
    Navigation
</div>

<div class="menu">

    <a href="index.jsp" class="active">
        <span class="icon">⌂</span>
        Dashboard
    </a>

    <a href="missions">
        <span class="icon">🚀</span>
        Missions
    </a>

    <a href="addMission.jsp">
        <span class="icon">⊕</span>
        Add Mission
    </a>

</div>

<div class="section-title">
    System
</div>

<div class="menu">

    <a href="missions">
        <span class="icon">▣</span>
        Mission Database
    </a>

</div>


</div>

<!-- ================= MAIN CONTENT ================= -->

<div class="main">


<!-- HEADER -->

<div class="top-header">

    <div>

        <div class="welcome">
            ✦ Welcome Back,
            <span>Space Explorer</span>
        </div>

        <div class="title">
            Space Mission Management
        </div>

        <div class="subtitle">
            Plan &nbsp; • &nbsp;
            Monitor &nbsp; • &nbsp;
            Explore &nbsp; • &nbsp;
            Beyond
        </div>

    </div>

    <div class="online">

        <span class="online-dot"></span>

        System Online

    </div>

</div>


<!-- ================= STATISTICS ================= -->

<div class="stats">

    <div class="stat-card blue">

        <div class="stat-label">
            TOTAL MISSIONS
        </div>

        <div class="stat-number">
            7
        </div>

        <div class="stat-change">
            ↑ +1 &nbsp; vs last month
        </div>

        <div class="circle"></div>

    </div>


    <div class="stat-card green">

        <div class="stat-label">
            ACTIVE
        </div>

        <div class="stat-number">
            2
        </div>

        <div class="stat-change">
            ↑ +0 &nbsp; vs last month
        </div>

        <div class="circle"></div>

    </div>


    <div class="stat-card purple">

        <div class="stat-label">
            PLANNED
        </div>

        <div class="stat-number">
            4
        </div>

        <div class="stat-change">
            ↑ +1 &nbsp; vs last month
        </div>

        <div class="circle"></div>

    </div>


    <div class="stat-card yellow">

        <div class="stat-label">
            COMPLETED
        </div>

        <div class="stat-number">
            1
        </div>

        <div class="stat-change">
            ↑ +0 &nbsp; vs last month
        </div>

        <div class="circle"></div>

    </div>

</div>


<!-- ================= MAIN PANELS ================= -->

<div class="content-grid">


    <!-- RECENT MISSIONS -->

    <div>

        <div class="panel">

            <div class="panel-header">

                <div>

                    <div class="panel-title">
                        🚀 Recent Missions
                    </div>

                    <div class="panel-subtitle">
                        Latest space missions in our database
                    </div>

                </div>

                <a href="missions" class="view-button">
                    View All Missions →
                </a>

            </div>


            <table class="mission-table">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>MISSION</th>
                        <th>AGENCY</th>
                        <th>DESTINATION</th>
                        <th>LAUNCH DATE</th>
                        <th>STATUS</th>

                    </tr>

                </thead>

                <tbody>

                    <tr>

                        <td>101</td>
                        <td>Chandrayaan-4</td>
                        <td>ISRO</td>
                        <td>Moon</td>
                        <td>2027-01-15</td>

                        <td>
                            <span class="status planned">
                                Planned
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>102</td>
                        <td>Artemis-II</td>
                        <td>NASA</td>
                        <td>Moon</td>
                        <td>2026-11-01</td>

                        <td>
                            <span class="status active">
                                Active
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>103</td>
                        <td>Mars Orbiter</td>
                        <td>ISRO</td>
                        <td>Mars</td>
                        <td>2028-06-20</td>

                        <td>
                            <span class="status planned">
                                Planned
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>104</td>
                        <td>Aditya-L2</td>
                        <td>ISRO</td>
                        <td>Sun-Earth L2</td>
                        <td>2027-05-10</td>

                        <td>
                            <span class="status planned">
                                Planned
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>105</td>
                        <td>James Webb</td>
                        <td>NASA</td>
                        <td>Deep Space</td>
                        <td>2021-12-25</td>

                        <td>
                            <span class="status completed">
                                Completed
                            </span>
                        </td>

                    </tr>

                </tbody>

            </table>

        </div>


        <!-- QUICK ACTIONS -->

        <div class="quick-actions">

            <a href="addMission.jsp" class="quick-action">

                <h3>⊕ &nbsp; Add Mission</h3>

                <p>
                    Create a new space mission
                </p>

            </a>


            <a href="missions" class="quick-action">

                <h3>▣ &nbsp; View Missions</h3>

                <p>
                    Browse all missions
                </p>

            </a>


            <a href="missions" class="quick-action">

                <h3>◈ &nbsp; Mission Database</h3>

                <p>
                    Access database directly
                </p>

            </a>

        </div>

    </div>


    <!-- SYSTEM STATUS -->

    <div class="panel">

        <div class="panel-title">
            ⚡ System Status
        </div>

        <div class="panel-subtitle">
            Real-time system overview
        </div>


        <div class="system-row">

            <span>
                ▣ &nbsp; Database
            </span>

            <span class="system-status">

                <span class="dot"></span>

                Online

            </span>

        </div>


        <div class="system-row">

            <span>
                🔗 &nbsp; Oracle JDBC
            </span>

            <span class="system-status">

                <span class="dot"></span>

                Connected

            </span>

        </div>


        <div class="system-row">

            <span>
                ⚙ &nbsp; Mission Service
            </span>

            <span class="system-status">

                <span class="dot"></span>

                Running

            </span>

        </div>


        <div class="system-row">

            <span>
                ◇ &nbsp; Operations
            </span>

            <span class="system-status blue">

                <span class="dot blue"></span>

                Ready

            </span>

        </div>


        <div class="space-image">

            <div>

                <h3>
                    Explore Beyond
                </h3>

                <p>
                    Small steps make big missions.
                </p>

            </div>

        </div>

    </div>

</div>


<!-- FOOTER -->

<footer>

    SPACE MISSION MANAGEMENT SYSTEM
    &nbsp; • &nbsp;
    ORACLE DATABASE
    &nbsp; • &nbsp;
    ADVANCED JAVA

</footer>


</div>

</body>
</html>
