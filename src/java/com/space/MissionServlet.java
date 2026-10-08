
package com.space;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/missions")
public class MissionServlet extends HttpServlet {

    // =====================================================
    // GET
    // READ ALL + OPEN EDIT PAGE
    // =====================================================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            MissionDAO dao = new MissionDAO();

            String action =
                    request.getParameter("action");


            // =================================================
            // EDIT - OPEN EDIT PAGE
            // =================================================
            if ("edit".equals(action)) {

                String idParameter =
                        request.getParameter("id");


                if (idParameter == null ||
                    idParameter.trim().isEmpty()) {

                    response.sendRedirect("missions");
                    return;
                }


                int missionId =
                        Integer.parseInt(idParameter);


                Mission mission =
                        dao.getMissionById(missionId);


                if (mission != null) {

                    request.setAttribute(
                            "mission",
                            mission
                    );


                    request.getRequestDispatcher(
                            "editMission.jsp"
                    ).forward(
                            request,
                            response
                    );

                } else {

                    response.setContentType(
                            "text/html"
                    );


                    response.getWriter().println(
                            "<h2>Mission not found.</h2>"
                    );


                    response.getWriter().println(
                            "<br><a href='missions'>Back to Missions</a>"
                    );
                }

                return;
            }


            // =================================================
            // READ - DISPLAY ALL MISSIONS
            // =================================================

            List<Mission> missions =
                    dao.getAllMissions();


            request.setAttribute(
                    "missions",
                    missions
            );


            request.getRequestDispatcher(
                    "missions.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();


            response.setContentType(
                    "text/html"
            );


            response.getWriter().println(
                    "<h2>Error while loading missions</h2>"
            );


            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );


            response.getWriter().println(
                    "<br><a href='missions'>Back to Missions</a>"
            );
        }
    }


    // =====================================================
    // POST
    // CREATE + UPDATE + DELETE
    // =====================================================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            request.setCharacterEncoding("UTF-8");


            String action =
                    request.getParameter("action");


            // =================================================
            // DELETE
            // =================================================
            if ("delete".equals(action)) {

                String idParameter =
                        request.getParameter(
                                "missionId"
                        );


                if (idParameter == null ||
                    idParameter.trim().isEmpty()) {

                    response.sendRedirect("missions");
                    return;
                }


                int missionId =
                        Integer.parseInt(
                                idParameter
                        );


                MissionDAO dao =
                        new MissionDAO();


                boolean success =
                        dao.deleteMission(
                                missionId
                        );


                if (success) {

                    response.sendRedirect(
                            "missions"
                    );

                } else {

                    response.setContentType(
                            "text/html"
                    );


                    response.getWriter().println(
                            "<h2>Mission deletion failed.</h2>"
                    );


                    response.getWriter().println(
                            "<br><a href='missions'>Back to Missions</a>"
                    );
                }


                return;
            }


            // =================================================
            // UPDATE
            // =================================================
            if ("update".equals(action)) {

                int missionId =
                        Integer.parseInt(
                                request.getParameter(
                                        "missionId"
                                )
                        );


                String missionName =
                        request.getParameter(
                                "missionName"
                        );


                String agency =
                        request.getParameter(
                                "agency"
                        );


                String destination =
                        request.getParameter(
                                "destination"
                        );


                String launchDate =
                        request.getParameter(
                                "launchDate"
                        );


                String status =
                        request.getParameter(
                                "status"
                        );


                Mission mission =
                        new Mission(
                                missionId,
                                missionName,
                                agency,
                                destination,
                                launchDate,
                                status
                        );


                MissionDAO dao =
                        new MissionDAO();


                boolean success =
                        dao.updateMission(
                                mission
                        );


                if (success) {

                    response.sendRedirect(
                            "missions"
                    );

                } else {

                    response.setContentType(
                            "text/html"
                    );


                    response.getWriter().println(
                            "<h2>Mission update failed.</h2>"
                    );


                    response.getWriter().println(
                            "<br><a href='missions'>Back to Missions</a>"
                    );
                }


                return;
            }


            // =================================================
            // CREATE / ADD MISSION
            // =================================================

            int missionId =
                    Integer.parseInt(
                            request.getParameter(
                                    "missionId"
                            )
                    );


            String missionName =
                    request.getParameter(
                            "missionName"
                    );


            String agency =
                    request.getParameter(
                            "agency"
                    );


            String destination =
                    request.getParameter(
                            "destination"
                    );


            String launchDate =
                    request.getParameter(
                            "launchDate"
                    );


            String status =
                    request.getParameter(
                            "status"
                    );


            Mission mission =
                    new Mission(
                            missionId,
                            missionName,
                            agency,
                            destination,
                            launchDate,
                            status
                    );


            MissionDAO dao =
                    new MissionDAO();


            boolean success =
                    dao.addMission(
                            mission
                    );


            if (success) {

                response.sendRedirect(
                        "missions"
                );

            } else {

                response.setContentType(
                        "text/html"
                );


                response.getWriter().println(
                        "<h2>Failed to add mission.</h2>"
                );


                response.getWriter().println(
                        "<br><a href='addMission.jsp'>Try Again</a>"
                );
            }


        } catch (NumberFormatException e) {

            response.setContentType(
                    "text/html"
            );


            response.getWriter().println(
                    "<h2>Invalid Mission ID</h2>"
            );


            response.getWriter().println(
                    "<p>Please enter a valid numeric Mission ID.</p>"
            );


            response.getWriter().println(
                    "<br><a href='missions'>Back to Missions</a>"
            );


        } catch (Exception e) {

            e.printStackTrace();


            response.setContentType(
                    "text/html"
            );


            response.getWriter().println(
                    "<h2>Error while processing mission</h2>"
            );


            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );


            response.getWriter().println(
                    "<br><a href='missions'>Back to Missions</a>"
            );
        }
    }
}

