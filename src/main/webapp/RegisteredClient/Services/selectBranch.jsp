<%--
  Created by IntelliJ IDEA.
  User: Thamira Weerakoon
  Date: 4/18/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.CS01.SerWise.Services.branchTable" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
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

<div class="single-content-div title">
    <div>
        <span class="title">Services</span><br>
        <span class="subtitle">Enjoy the best services</span>
    </div>
</div>

<div class="two-content-div">
    <div class="colomn-content-div">
        <%
            try{
                ArrayList<String[]> results = branchTable.select();
                for (String[] i : results){
        %>
        <div>
            <span class="subtitle"><%=i[2]%></span><br>
            <form method="post" action="viewServices.jsp">
                <input type="submit" value="View Services" class="button"/>
                <input type = "hidden" name="Branch_Id" value="<%=i[0] %>" class="button" />
            </form>
        </div>
        <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
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
</html>