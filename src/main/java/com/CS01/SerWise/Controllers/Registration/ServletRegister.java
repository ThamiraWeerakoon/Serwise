package com.CS01.SerWise.Controllers.Registration;

import com.CS01.SerWise.Controllers.CheckUser;
import com.CS01.SerWise.Controllers.Hash;
import com.CS01.SerWise.Services.registeredClientTable;
import com.CS01.SerWise.Services.userTable;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServletRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String fname=request.getParameter("Fname");
        String lname=request.getParameter("Lname");
        String id=request.getParameter("Email");
        String contact=request.getParameter("Contact");
        String password=request.getParameter("pswd");
        String hp= Hash.hashPassword(password);

        try {
            if (id != null) {
                if (CheckUser.checkUserExists(id)) {
                    response.sendRedirect("UnregisteredClient/Register/register.jsp?message=User Already Exists!");
                    return;
                } else {
                    String values1 = "'%s','%s',%s";
                    values1 = String.format(values1,id,hp,1);
                    userTable.insert("id,password,role",values1);
                    String values2 = "'%s','%s','%s','%s'";
                    values2 = String.format(values2,fname,lname,contact,id);
                    registeredClientTable.insert("First_Name,Last_Name,Contact,Address",values2);
                    response.sendRedirect("Login/login.html");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
