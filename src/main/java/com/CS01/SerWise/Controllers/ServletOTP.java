package com.CS01.SerWise.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;

public class ServletOTP extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String fname=request.getParameter("Fname");
        String lname=request.getParameter("Lname");
        String id=request.getParameter("Email");
        String contact=request.getParameter("Contact");
        String password=request.getParameter("pswd");

        String hp=Hash.hashPassword(password);

        try {
            if (id != null) {
                if (CheckUser.checkUserExists(id)) {
                    response.sendRedirect("UnregisteredClient/Register/register.jsp?message=User Already Exists!");
                    return;
                } else{
                    HttpSession session = request.getSession();
                    session.setAttribute("Fname",fname);
                    session.setAttribute("Lname",lname);
                    session.setAttribute("Id",id);
                    session.setAttribute("Contact",contact);
                    session.setAttribute("PSW",hp);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
