<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/15/2022
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%
    int aId=Integer.parseInt(request.getParameter("Appoinment_Id"));
    HttpSession session1= request.getSession();
    session1.setAttribute("Appointment_Id",aId);
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3305/";
    String database = "serwise";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../CSS/content.css">
    <link rel="stylesheet" href="../../CSS/navigation.css">
    <link rel="stylesheet" href="../../CSS/footer.css">
    <link rel="stylesheet" href="../../CSS/backgrount.css">
    <title>Document</title>
</head>
<body>
<%
    if (session.getAttribute("uid")==null){
        response.sendRedirect("../../Login/login.html");
    }
%>
<header class="navigation"></header>

<div class="single-content-div title center">
    <div>
        <span class="title">SerWise</span><br>
        <span>Reshedule Appointments</span>
    </div>
</div>

<div class="single-content-div center">
    <div class="single-content-div-form">
        <%
            try{
                connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                statement=connection.createStatement();
                PreparedStatement ps1=connection.prepareStatement("select * from serwise.appoinment where Appoinment_Id=?");
                ps1.setInt(1,aId);
                resultSet = ps1.executeQuery();
                while(resultSet.next()){
        %>
        <div>
            <form action="../../ResheduleAppointment" method="post">
                <input name="Date" type="date" placeholder="Date" id="date" min="" max="" required value="<%=resultSet.getString("Date") %>"><br>
                <input name="Time" type="time" placeholder="Time" id="time" min="08:00:00" max="16:00:00" step="7200" required value="<%=resultSet.getString("Time") %>"><br>
                <input type="submit" value="Reshedule" class="button">
            </form>
        </div>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>


<footer class="footer">
    <div class="center"><img src="../../Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>
<script src="/SerWise_war/RegisteredClient/RegisteredClientHeader.js"></script>
</body>
<script>
    const today = new Date();
    const minDate = new Date(today.getFullYear(),today.getMonth(),today.getDate()+1);
    const maxDate = new Date(today.getFullYear(),today.getMonth()+3,today.getDate());

    // set the minimum and maximum values of the input element
    document.getElementById("date").setAttribute("min", minDate.toISOString().slice(0,10));
    document.getElementById("date").setAttribute("max", maxDate.toISOString().slice(0,10));
</script>
</html>

