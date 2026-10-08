/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.space;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dharm
 */
@WebServlet("/testconnection")
public class TestConnectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Database Connection Test</title>");
        out.println("</head>");
        out.println("<body>");

        try {

            Connection con = DBConnection.getConnection();

            if (con != null) {

                out.println("<h1>Database Connected Successfully!</h1>");
                out.println("<p>Oracle database connection is working.</p>");

                con.close();

            } else {

                out.println("<h1>Database Connection Failed!</h1>");
                out.println("<p>Connection object is null.</p>");
            }

        } catch (Exception e) {

            out.println("<h1>Database Connection Failed!</h1>");
            out.println("<p>" + e.getMessage() + "</p>");
            e.printStackTrace();
        }

        out.println("</body>");
        out.println("</html>");
    }
}