<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 12/13/2022
  Time: 5:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../CSS/content.css">
    <link rel="stylesheet" href="../../CSS/navigation.css">
    <link rel="stylesheet" href="../../CSS/footer.css">
    <link rel="stylesheet" href="../../CSS/backgrount.css">
    <title>Profile</title>
</head>
<body>
<%
    if (session.getAttribute("uid")==null){
        response.sendRedirect("../../Login/login.html");
    }
%>
<header class="navigation"></header>
<div class="two-content-div">
    <div class="two-content-div-one">
        <span class="title">Profile</span><br>
        <span>User Information</span><br>
        <span><img src="../../Assets/ProfilePic.jpg" class="logo"></span>
    </div>
    <%@ page import="com.CS01.SerWise.Controllers.DatabaseConnection" %>
    <%@ page import="jakarta.servlet.http.*" %>
    <%@ page import="java.sql.*" %>
    <%
        HttpSession session1=request.getSession();
        int id=(Integer)session1.getAttribute("uid");
        try{
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement("select * from serwise.registered_client where Registered_Client_Id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                %>
        <div class="two-content-div-form">
        <form name="rform" action="#">
            <input type="text" name="Fname" placeholder="<%=rs.getString("First_Name") %>" disabled>
            <input type="text" name="Lname" placeholder="<%=rs.getString("Last_Name") %>" disabled><br>
            <input type="tel" name="Contact" pattern="[0-9]{10}" placeholder="<%=rs.getString("Contact") %>" disabled><br>
            <input type="email" name="Email" placeholder="<%=rs.getString("Address") %>" disabled><br>
            <input type="password" name="pswd" pattern="{8,}" id="password" disabled><br>
            <input type="submit" value="Edit Profile" class="button">
        </form>
    </div>
                <%
            }
        }catch (Exception e) {
                        e.printStackTrace();
                    }
    %>

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
</html>
