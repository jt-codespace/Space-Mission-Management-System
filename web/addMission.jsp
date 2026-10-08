<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>Add New Mission</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {

            font-family: Arial, Helvetica, sans-serif;

            color: white;

            min-height: 100vh;

            background:

                linear-gradient(
                    rgba(1, 8, 24, 0.82),
                    rgba(1, 8, 24, 0.95)
                ),

                url("https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?auto=format&fit=crop&w=2000&q=90");

            background-size: cover;

            background-position: center;

            background-attachment: fixed;

        }



        /* ================= SIDEBAR ================= */

        .sidebar {

            position: fixed;

            left: 0;

            top: 0;

            width: 250px;

            height: 100vh;

            background: rgba(2, 12, 30, 0.96);

            border-right: 1px solid #123e70;

            padding: 30px 18px;

        }


        .logo {

            text-align: center;

            margin-bottom: 45px;

        }


        .logo h1 {

            font-size: 27px;

            letter-spacing: 2px;

        }


        .logo h1 span {

            color: #1597ff;

        }


        .logo p {

            margin-top: 8px;

            color: #6ea9d8;

            font-size: 12px;

            letter-spacing: 3px;

        }


        .menu-title {

            color: #5e88ad;

            font-size: 12px;

            letter-spacing: 2px;

            margin: 20px 8px 12px;

        }


        .menu a {

            display: block;

            text-decoration: none;

            color: #d8e8f8;

            padding: 15px 18px;

            margin-bottom: 8px;

            border-radius: 9px;

            transition: 0.3s;

        }


        .menu a:hover {

            background: rgba(0,125,255,0.18);

            color: white;

        }


        .menu .active {

            background:
                linear-gradient(
                    90deg,
                    #0758c7,
                    #168df5
                );

            color: white;

            box-shadow:
                0 0 22px rgba(0,130,255,0.45);

        }


        .menu-icon {

            display: inline-block;

            width: 30px;

            color: #56b8ff;

        }



        /* ================= MAIN ================= */

        .main {

            margin-left: 250px;

            min-height: 100vh;

            padding: 40px;

            display: flex;

            justify-content: center;

            align-items: flex-start;

        }



        /* ================= FORM CARD ================= */

        .form-card {

            width: 850px;

            max-width: 100%;

            margin-top: 25px;

            padding: 40px;

            background:

                linear-gradient(
                    145deg,
                    rgba(4,28,58,0.95),
                    rgba(2,15,34,0.96)
                );

            border: 1px solid #1765a8;

            border-radius: 18px;

            box-shadow:

                0 20px 70px rgba(0,0,0,0.55),

                0 0 35px rgba(0,110,255,0.12);

            backdrop-filter: blur(12px);

        }



        /* ================= HEADER ================= */

        .form-header {

            text-align: center;

            margin-bottom: 35px;

        }


        .form-header h1 {

            font-size: 36px;

            margin-bottom: 10px;

        }


        .form-header h1 span {

            color: #159cff;

        }


        .form-header p {

            color: #8faac0;

            font-size: 14px;

        }



        /* ================= DECORATION ================= */

        .line {

            height: 2px;

            width: 100px;

            margin: 20px auto;

            background:

                linear-gradient(
                    90deg,
                    transparent,
                    #159cff,
                    transparent
                );

            box-shadow:

                0 0 12px #159cff;

        }



        /* ================= FORM ================= */

        .form-grid {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 22px;

        }


        .form-group {

            display: flex;

            flex-direction: column;

        }


        .full {

            grid-column: 1 / 3;

        }


        label {

            color: #a9c7df;

            font-size: 13px;

            margin-bottom: 9px;

            letter-spacing: 0.5px;

        }


        input,
        select {

            width: 100%;

            padding: 14px 16px;

            border-radius: 8px;

            border: 1px solid #205783;

            background: rgba(1,11,26,0.85);

            color: white;

            font-size: 14px;

            outline: none;

            transition: 0.3s;

        }


        input::placeholder {

            color: #55748e;

        }


        input:focus,
        select:focus {

            border-color: #159cff;

            box-shadow:

                0 0 0 2px rgba(21,156,255,0.12),

                0 0 18px rgba(21,156,255,0.18);

        }


        select option {

            background: #06182e;

            color: white;

        }



        /* ================= BUTTON ================= */

        .button-area {

            margin-top: 30px;

            display: flex;

            gap: 15px;

        }


        .submit-btn {

            flex: 1;

            padding: 15px;

            border: none;

            border-radius: 9px;

            color: white;

            font-size: 15px;

            font-weight: bold;

            cursor: pointer;

            background:

                linear-gradient(
                    135deg,
                    #0875d1,
                    #159cff
                );

            box-shadow:

                0 0 25px rgba(0,140,255,0.28);

            transition: 0.3s;

        }


        .submit-btn:hover {

            transform: translateY(-2px);

            box-shadow:

                0 0 35px rgba(0,150,255,0.55);

        }


        .back-btn {

            flex: 1;

            text-align: center;

            text-decoration: none;

            padding: 15px;

            border-radius: 9px;

            border: 1px solid #24577f;

            color: #9fc2df;

            background: rgba(4,22,42,0.8);

            transition: 0.3s;

        }


        .back-btn:hover {

            color: white;

            border-color: #159cff;

            background: rgba(10,50,85,0.8);

        }



        /* ================= INFO ================= */

        .info {

            margin-top: 28px;

            padding: 15px;

            border-radius: 8px;

            background: rgba(0,100,200,0.07);

            border: 1px solid #123d64;

            color: #7194ae;

            font-size: 12px;

            text-align: center;

        }



        /* ================= RESPONSIVE ================= */

        @media(max-width: 800px) {

            .sidebar {

                position: relative;

                width: 100%;

                height: auto;

            }


            .main {

                margin-left: 0;

                padding: 20px;

            }


            .form-grid {

                grid-template-columns: 1fr;

            }


            .full {

                grid-column: 1;

            }


            .button-area {

                flex-direction: column;

            }

        }

    </style>

</head>


<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">


    <div class="logo">

        <h1>
            SPACE <span>OPS</span>
        </h1>

        <p>
            MISSION MANAGEMENT
        </p>

    </div>


    <div class="menu-title">
        NAVIGATION
    </div>


    <div class="menu">


        <a href="index.jsp">

            <span class="menu-icon">
                +
            </span>

            Dashboard

        </a>


        <a href="missions">

            <span class="menu-icon">
                >
            </span>

            Missions

        </a>


        <a href="addMission.jsp" class="active">

            <span class="menu-icon">
                +
            </span>

            Add Mission

        </a>


    </div>


    <div class="menu-title">
        SYSTEM
    </div>


    <div class="menu">

        <a href="missions">

            <span class="menu-icon">
                #
            </span>

            Mission Database

        </a>

    </div>


</div>



<!-- ================= MAIN ================= -->

<div class="main">


    <div class="form-card">


        <div class="form-header">

            <h1>
                Add New <span>Mission</span>
            </h1>

            <div class="line"></div>

            <p>
                Register a new space mission in the mission management database.
            </p>

        </div>



        <!-- ================= FORM ================= -->

        <form action="missions" method="post">


            <div class="form-grid">


                <!-- Mission ID -->

                <div class="form-group">

                    <label>
                        Mission ID
                    </label>

                    <input
                        type="number"
                        name="missionId"
                        placeholder="Enter mission ID"
                        required
                    >

                </div>



                <!-- Mission Name -->

                <div class="form-group">

                    <label>
                        Mission Name
                    </label>

                    <input
                        type="text"
                        name="missionName"
                        placeholder="Enter mission name"
                        required
                    >

                </div>



                <!-- Agency -->

                <div class="form-group">

                    <label>
                        Space Agency
                    </label>

                    <input
                        type="text"
                        name="agency"
                        placeholder="Example: ISRO, NASA, ESA"
                        required
                    >

                </div>



                <!-- Destination -->

                <div class="form-group">

                    <label>
                        Destination
                    </label>

                    <input
                        type="text"
                        name="destination"
                        placeholder="Example: Moon, Mars, Deep Space"
                        required
                    >

                </div>



                <!-- Launch Date -->

                <div class="form-group">

                    <label>
                        Launch Date
                    </label>

                    <input
                        type="date"
                        name="launchDate"
                        required
                    >

                </div>



                <!-- Status -->

                <div class="form-group">

                    <label>
                        Mission Status
                    </label>

                    <select name="status" required>

                        <option value="Planned">
                            Planned
                        </option>

                        <option value="Active">
                            Active
                        </option>

                        <option value="Completed">
                            Completed
                        </option>

                    </select>

                </div>


            </div>



            <!-- ================= BUTTONS ================= -->

            <div class="button-area">


                <button
                    type="submit"
                    class="submit-btn"
                >
                    Add Mission
                </button>


                <a
                    href="missions"
                    class="back-btn"
                >
                    Back to Missions
                </a>


            </div>


        </form>



        <div class="info">

            Mission information will be stored in the Oracle database
            using JDBC and the MissionDAO layer.

        </div>


    </div>


</div>


</body>

</html>