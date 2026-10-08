<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <title>Space Mission Management</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background:
                radial-gradient(circle at 75% 15%, #123b70 0%, #06152c 25%, #020817 55%),
                #020817;
            color: #ffffff;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;

            width: 250px;
            height: 100vh;

            background: rgba(2, 11, 27, 0.96);

            border-right: 1px solid #123b68;

            padding: 28px 16px;

            z-index: 10;
        }

        .brand {
            text-align: center;
            margin-bottom: 45px;
        }

        .brand-icon {
            width: 55px;
            height: 55px;

            margin: auto;
            margin-bottom: 12px;

            border-radius: 50%;

            border: 2px solid #2196f3;

            box-shadow:
                0 0 15px rgba(33, 150, 243, 0.6),
                inset 0 0 15px rgba(33, 150, 243, 0.2);

            position: relative;
        }

        .brand-icon:before {
            content: "";

            position: absolute;

            width: 65px;
            height: 20px;

            border: 2px solid #42a5f5;

            border-radius: 50%;

            left: -7px;
            top: 15px;

            transform: rotate(-25deg);
        }

        .brand-title {
            font-size: 23px;
            font-weight: bold;

            color: #ffffff;
            letter-spacing: 1px;
        }

        .brand-title span {
            color: #2196f3;
        }

        .brand-subtitle {
            color: #6f9cc7;
            font-size: 11px;

            letter-spacing: 2px;

            margin-top: 5px;
        }

        .section-title {
            color: #5e7896;

            font-size: 11px;

            letter-spacing: 1px;

            margin: 25px 10px 10px;

            text-transform: uppercase;
        }

        .menu a {
            display: flex;
            align-items: center;

            padding: 14px 15px;

            margin-bottom: 7px;

            color: #b9cbe0;

            text-decoration: none;

            border-radius: 8px;

            transition: 0.3s;
        }

        .menu a:hover {
            background: rgba(21, 101, 192, 0.25);
            color: #ffffff;
        }

        .menu a.active {
            background: linear-gradient(
                90deg,
                #0d47a1,
                #1565c0
            );

            color: white;

            box-shadow:
                0 0 15px rgba(21, 101, 192, 0.4);
        }

        .menu-icon {
            width: 28px;
            height: 28px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-right: 10px;

            border-radius: 6px;

            background: rgba(33, 150, 243, 0.12);

            color: #42a5f5;

            font-size: 14px;
        }


        /* ================= MAIN ================= */

        .main {
            margin-left: 250px;

            padding: 28px 35px 30px;

            min-height: 100vh;
        }


        /* ================= TOP BAR ================= */

        .topbar {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 25px;
        }

        .heading h1 {
            font-size: 34px;

            letter-spacing: 0.5px;

            margin-bottom: 8px;

            background: linear-gradient(
                90deg,
                #ffffff,
                #62b6ff
            );

            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .heading p {
            color: #7592af;

            font-size: 14px;

            letter-spacing: 1px;
        }

        .top-right {
            display: flex;

            align-items: center;

            gap: 15px;
        }

        .date-box {
            color: #9db4cd;

            font-size: 13px;

            padding-right: 15px;

            border-right: 1px solid #24415f;
        }

        .online {
            padding: 9px 15px;

            border-radius: 20px;

            background: rgba(0, 180, 100, 0.1);

            border: 1px solid #087a4c;

            color: #45e59b;

            font-size: 12px;

            box-shadow: 0 0 12px rgba(0, 200, 120, 0.15);
        }

        .online-dot {
            display: inline-block;

            width: 7px;
            height: 7px;

            background: #45e59b;

            border-radius: 50%;

            margin-right: 7px;

            box-shadow: 0 0 8px #45e59b;
        }


        /* ================= HERO ================= */

        .hero {
            position: relative;

            height: 150px;

            overflow: hidden;

            border-radius: 12px;

            border: 1px solid #14508b;

            margin-bottom: 22px;

            background:
                radial-gradient(
                    circle at 80% 30%,
                    rgba(42, 133, 220, 0.35),
                    transparent 25%
                ),
                linear-gradient(
                    110deg,
                    #06152b,
                    #092b50 55%,
                    #06162b
                );
        }

        .stars {
            position: absolute;

            width: 100%;
            height: 100%;

            opacity: 0.45;

            background-image:
                radial-gradient(
                    white 1px,
                    transparent 1px
                );

            background-size: 55px 55px;
        }

        .planet {
            position: absolute;

            right: -70px;
            bottom: -145px;

            width: 500px;
            height: 280px;

            border-radius: 50%;

            background:
                radial-gradient(
                    circle at 35% 30%,
                    #72b9e8,
                    #165185 35%,
                    #071d38 70%
                );

            box-shadow:
                0 -10px 45px rgba(66, 165, 245, 0.35);
        }

        .hero-content {
            position: relative;

            z-index: 2;

            padding: 28px 32px;
        }

        .hero-content h2 {
            font-size: 25px;

            margin-bottom: 10px;
        }

        .hero-content h2 span {
            color: #2196f3;
        }

        .hero-content p {
            color: #a9c2db;

            font-size: 14px;
        }

        .hero-line {
            margin-top: 15px;

            width: 200px;
            height: 2px;

            background: linear-gradient(
                90deg,
                #2196f3,
                transparent
            );
        }


        /* ================= CARDS ================= */

        .cards {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

            margin-bottom: 22px;
        }

        .card {
            position: relative;

            overflow: hidden;

            min-height: 125px;

            padding: 20px;

            border-radius: 11px;

            background:
                linear-gradient(
                    145deg,
                    rgba(10, 38, 72, 0.95),
                    rgba(3, 19, 38, 0.95)
                );

            border: 1px solid #154878;

            box-shadow:
                inset 0 1px 0 rgba(255,255,255,0.03);

            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-3px);

            border-color: #2196f3;

            box-shadow:
                0 8px 25px rgba(0, 100, 220, 0.18);
        }

        .card:after {
            content: "";

            position: absolute;

            width: 100px;
            height: 100px;

            right: -35px;
            bottom: -45px;

            border-radius: 50%;

            background: rgba(33, 150, 243, 0.08);
        }

        .card-top {
            display: flex;

            justify-content: space-between;

            align-items: center;
        }

        .card-icon {
            width: 43px;
            height: 43px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 50%;

            font-size: 19px;

            background: rgba(33, 150, 243, 0.16);

            border: 1px solid #1670bb;

            color: #42a5f5;
        }

        .card-title {
            color: #94abc1;

            font-size: 12px;

            letter-spacing: 1px;

            margin-bottom: 7px;
        }

        .card-value {
            font-size: 31px;

            font-weight: bold;

            color: #ffffff;
        }

        .card-footer {
            color: #46e49b;

            font-size: 11px;

            margin-top: 5px;
        }

        .active-card .card-icon {
            color: #4ff0a5;

            background: rgba(0, 190, 120, 0.12);

            border-color: #087c55;
        }

        .planned-card .card-icon {
            color: #c084ff;

            background: rgba(150, 70, 240, 0.12);

            border-color: #7132ad;
        }

        .completed-card .card-icon {
            color: #ffd34e;

            background: rgba(240, 180, 20, 0.12);

            border-color: #986d0c;
        }


        /* ================= CONTENT ================= */

        .content {
            display: grid;

            grid-template-columns:
                minmax(0, 2fr)
                minmax(300px, 1fr);

            gap: 20px;
        }

        .panel {
            background:
                linear-gradient(
                    145deg,
                    rgba(6, 29, 56, 0.95),
                    rgba(3, 17, 34, 0.98)
                );

            border: 1px solid #154878;

            border-radius: 12px;

            overflow: hidden;
        }

        .panel-header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 20px 22px;

            border-bottom: 1px solid #143653;
        }

        .panel-title {
            display: flex;

            align-items: center;

            gap: 12px;
        }

        .panel-icon {
            width: 36px;
            height: 36px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #092b51;

            color: #42a5f5;
        }

        .panel-title h2 {
            font-size: 20px;
        }

        .panel-title p {
            font-size: 11px;

            color: #6685a4;

            margin-top: 3px;
        }

        .view-btn {
            text-decoration: none;

            color: #7fc8ff;

            font-size: 12px;

            padding: 9px 13px;

            border: 1px solid #15568b;

            border-radius: 6px;

            background: rgba(33, 150, 243, 0.08);
        }

        .view-btn:hover {
            background: #0d47a1;

            color: white;
        }


        /* ================= MISSION LIST ================= */

        .missions {
            padding: 8px 20px 20px;
        }

        .mission {
            display: grid;

            grid-template-columns:
                50px
                1fr
                100px
                100px;

            align-items: center;

            gap: 12px;

            padding: 14px 5px;

            border-bottom: 1px solid #112f4c;
        }

        .mission:last-child {
            border-bottom: none;
        }

        .mission-id {
            color: #4ba9ed;

            font-size: 12px;

            font-weight: bold;
        }

        .mission-name {
            color: #ffffff;

            font-size: 14px;

            font-weight: bold;
        }

        .mission-agency {
            color: #7895b1;

            font-size: 11px;

            margin-top: 4px;
        }

        .destination {
            color: #8da9c2;

            font-size: 12px;
        }

        .status {
            display: inline-block;

            padding: 6px 9px;

            text-align: center;

            border-radius: 12px;

            font-size: 10px;

            font-weight: bold;
        }

        .planned {
            color: #ffc83d;

            background: rgba(255, 190, 30, 0.1);

            border: 1px solid #725508;
        }

        .mission-active {
            color: #45e59b;

            background: rgba(0, 190, 120, 0.1);

            border: 1px solid #087c55;
        }

        .completed {
            color: #55aaff;

            background: rgba(33, 130, 240, 0.1);

            border: 1px solid #145fa1;
        }


        /* ================= SYSTEM STATUS ================= */

        .system-body {
            padding: 8px 22px 20px;
        }

        .system-row {
            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 17px 0;

            border-bottom: 1px solid #143653;
        }

        .system-row:last-child {
            border-bottom: none;
        }

        .system-name {
            display: flex;

            align-items: center;

            gap: 10px;

            color: #c6d7e8;

            font-size: 13px;
        }

        .system-icon {
            width: 30px;
            height: 30px;

            display: flex;

            justify-content: center;
            align-items: center;

            border-radius: 6px;

            background: #092542;

            color: #49aef9;
        }

        .system-status {
            font-size: 11px;

            color: #43e09a;
        }

        .system-status:before {
            content: "";

            display: inline-block;

            width: 6px;
            height: 6px;

            border-radius: 50%;

            background: #43e09a;

            margin-right: 6px;

            box-shadow: 0 0 7px #43e09a;
        }


        /* ================= QUICK ACTIONS ================= */

        .quick {
            margin-top: 20px;

            display: flex;

            gap: 10px;
        }

        .quick a {
            flex: 1;

            text-align: center;

            padding: 12px;

            text-decoration: none;

            border-radius: 7px;

            color: #ffffff;

            background: #0d47a1;

            border: 1px solid #1769aa;

            font-size: 12px;
        }

        .quick a:hover {
            background: #1976d2;
        }


        /* ================= FOOTER ================= */

        .footer {
            text-align: center;

            margin-top: 25px;

            padding: 15px;

            color: #526d87;

            font-size: 10px;

            letter-spacing: 1px;
        }


        /* ================= RESPONSIVE ================= */

        @media(max-width: 1100px) {

            .cards {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .content {
                grid-template-columns: 1fr;
            }

        }

        @media(max-width: 750px) {

            .sidebar {
                width: 190px;
            }

            .main {
                margin-left: 190px;

                padding: 20px;
            }

            .topbar {
                display: block;
            }

            .top-right {
                margin-top: 15px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
===================================================== -->

<div class="sidebar">

    <div class="brand">

        <div class="brand-icon"></div>

        <div class="brand-title">
            SPACE <span>OPS</span>
        </div>

        <div class="brand-subtitle">
            MISSION MANAGEMENT
        </div>

    </div>


    <div class="section-title">
        Navigation
    </div>


    <div class="menu">

        <a href="dashboard.jsp" class="active">

            <div class="menu-icon">D</div>

            Dashboard

        </a>


        <a href="missions">

            <div class="menu-icon">M</div>

            Missions

        </a>


        <a href="addMission.jsp">

            <div class="menu-icon">+</div>

            Add Mission

        </a>

    </div>


    <div class="section-title">
        System
    </div>


    <div class="menu">

        <a href="missions">

            <div class="menu-icon">DB</div>

            Mission Database

        </a>

    </div>

</div>



<!-- =====================================================
     MAIN
===================================================== -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">

        <div class="heading">

            <h1>
                Space Mission Management
            </h1>

            <p>
                Plan &nbsp; • &nbsp;
                Monitor &nbsp; • &nbsp;
                Explore &nbsp; • &nbsp;
                Beyond
            </p>

        </div>


        <div class="top-right">

            <div class="date-box">
                Mission Control
            </div>

            <div class="online">

                <span class="online-dot"></span>

                System Online

            </div>

        </div>

    </div>



    <!-- =================================================
         HERO
    ================================================= -->

    <div class="hero">

        <div class="stars"></div>

        <div class="planet"></div>


        <div class="hero-content">

            <h2>
                Discover <span>•</span>
                Explore <span>•</span>
                Beyond
            </h2>

            <p>
                Manage space missions, launch information
                and mission operations in one place.
            </p>

            <div class="hero-line"></div>

        </div>

    </div>



    <!-- =================================================
         STATISTICS
    ================================================= -->

    <div class="cards">


        <div class="card">

            <div class="card-top">

                <div>

                    <div class="card-title">
                        TOTAL MISSIONS
                    </div>

                    <div class="card-value">
                        7
                    </div>

                </div>

                <div class="card-icon">
                    M
                </div>

            </div>

            <div class="card-footer">
                +1 mission registered
            </div>

        </div>



        <div class="card active-card">

            <div class="card-top">

                <div>

                    <div class="card-title">
                        ACTIVE
                    </div>

                    <div class="card-value">
                        2
                    </div>

                </div>

                <div class="card-icon">
                    A
                </div>

            </div>

            <div class="card-footer">
                Mission operations active
            </div>

        </div>



        <div class="card planned-card">

            <div class="card-top">

                <div>

                    <div class="card-title">
                        PLANNED
                    </div>

                    <div class="card-value">
                        4
                    </div>

                </div>

                <div class="card-icon">
                    P
                </div>

            </div>

            <div class="card-footer">
                Upcoming missions
            </div>

        </div>



        <div class="card completed-card">

            <div class="card-top">

                <div>

                    <div class="card-title">
                        COMPLETED
                    </div>

                    <div class="card-value">
                        1
                    </div>

                </div>

                <div class="card-icon">
                    C
                </div>

            </div>

            <div class="card-footer">
                Successfully completed
            </div>

        </div>

    </div>



    <!-- =================================================
         MAIN CONTENT
    ================================================= -->

    <div class="content">


        <!-- RECENT MISSIONS -->

        <div class="panel">

            <div class="panel-header">

                <div class="panel-title">

                    <div class="panel-icon">
                        M
                    </div>

                    <div>

                        <h2>
                            Recent Missions
                        </h2>

                        <p>
                            Latest missions in the database
                        </p>

                    </div>

                </div>


                <a href="missions" class="view-btn">
                    View All Missions →
                </a>

            </div>


            <div class="missions">


                <div class="mission">

                    <div class="mission-id">
                        101
                    </div>

                    <div>

                        <div class="mission-name">
                            Chandrayaan-4
                        </div>

                        <div class="mission-agency">
                            ISRO
                        </div>

                    </div>

                    <div class="destination">
                        Moon
                    </div>

                    <div>
                        <span class="status planned">
                            PLANNED
                        </span>
                    </div>

                </div>



                <div class="mission">

                    <div class="mission-id">
                        102
                    </div>

                    <div>

                        <div class="mission-name">
                            Artemis-II
                        </div>

                        <div class="mission-agency">
                            NASA
                        </div>

                    </div>

                    <div class="destination">
                        Moon
                    </div>

                    <div>
                        <span class="status mission-active">
                            ACTIVE
                        </span>
                    </div>

                </div>



                <div class="mission">

                    <div class="mission-id">
                        103
                    </div>

                    <div>

                        <div class="mission-name">
                            Mars Orbiter
                        </div>

                        <div class="mission-agency">
                            ISRO
                        </div>

                    </div>

                    <div class="destination">
                        Mars
                    </div>

                    <div>
                        <span class="status planned">
                            PLANNED
                        </span>
                    </div>

                </div>



                <div class="mission">

                    <div class="mission-id">
                        104
                    </div>

                    <div>

                        <div class="mission-name">
                            Aditya-L2
                        </div>

                        <div class="mission-agency">
                            ISRO
                        </div>

                    </div>

                    <div class="destination">
                        Sun-Earth L2
                    </div>

                    <div>
                        <span class="status planned">
                            PLANNED
                        </span>
                    </div>

                </div>



                <div class="mission">

                    <div class="mission-id">
                        105
                    </div>

                    <div>

                        <div class="mission-name">
                            James Webb
                        </div>

                        <div class="mission-agency">
                            NASA
                        </div>

                    </div>

                    <div class="destination">
                        Deep Space
                    </div>

                    <div>
                        <span class="status completed">
                            COMPLETED
                        </span>
                    </div>

                </div>


            </div>

        </div>



        <!-- SYSTEM STATUS -->

        <div class="panel">

            <div class="panel-header">

                <div class="panel-title">

                    <div class="panel-icon">
                        S
                    </div>

                    <div>

                        <h2>
                            System Status
                        </h2>

                        <p>
                            Mission control overview
                        </p>

                    </div>

                </div>

            </div>


            <div class="system-body">


                <div class="system-row">

                    <div class="system-name">

                        <div class="system-icon">
                            DB
                        </div>

                        Database

                    </div>

                    <div class="system-status">
                        Online
                    </div>

                </div>



                <div class="system-row">

                    <div class="system-name">

                        <div class="system-icon">
                            J
                        </div>

                        Oracle JDBC

                    </div>

                    <div class="system-status">
                        Connected
                    </div>

                </div>



                <div class="system-row">

                    <div class="system-name">

                        <div class="system-icon">
                            MS
                        </div>

                        Mission Service

                    </div>

                    <div class="system-status">
                        Running
                    </div>

                </div>



                <div class="system-row">

                    <div class="system-name">

                        <div class="system-icon">
                            OP
                        </div>

                        Operations

                    </div>

                    <div class="system-status">
                        Ready
                    </div>

                </div>



                <div class="quick">

                    <a href="addMission.jsp">
                        + Add Mission
                    </a>

                    <a href="missions">
                        Open Database
                    </a>

                </div>


            </div>

        </div>

    </div>



    <!-- FOOTER -->

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