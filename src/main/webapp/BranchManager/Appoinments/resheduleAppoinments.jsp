<%@ page language="java" contentType="text/html; ISO-8859-1" %>
<%@ page import="java.util.*,com.CS01.SerWise.*" %>
<%@ page import="com.CS01.SerWise.Appoinmtent" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/SerWise_war/CSS/content.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/navigation.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/footer.css">
    <link rel="stylesheet" href="/SerWise_war/CSS/backgrount.css">
    <title>Document</title>
</head>
<body>
<header class="navigation">
    <img src="/SerWise_war/Assets/SerWise.png" class="navimg">
    <table>
        <tr>
            <td><a href="/SerWise_war/BranchManager/Home/home.html ">Home</a></td>
            <td><a href="/SerWise_war/BranchManager/Appoinments/appointments.jsp">Appointments</a></td>
            <td><a href="/SerWise_war/BranchManager/Reports/reports.html">Reports</a></td>
            <td><a href="/SerWise_war/BranchManager/Inventory/inventory.html">Inventory</a></td>
            <td><a href="../Login/login.html"><button class="button">Logout</button></a></td>
        </tr>
    </table>
</header>
<div class="two-content-div">
    <div class="single-content-div center title">
    <form action="/SerWise_war/ViewAppoinments" method="get">
        <input type="hidden" name="command" value="SEARCH">
        <div>
            <label>Search by Id : </label><input type="number" name="ID" placeholder="Appoinment ID">
            <input type="submit" value="Search" class="button">
        </div>

        <br>
        <div>
            <label>Filter by Date :</label><input type="date" name="DATE" placeholder="Appoinment Date">
            <input type="submit" value="Search" class="button">
        </div>

    </form>
    </div>

    <div class="form-display-table">
        <table>
            <tr>
                <th>Appointment Id</th>
                <th>Date</th>
                <th>Time</th>
                <th>Description</th>
                <th>Client Id</th>
                <th>Branch Id</th>
                <th>Vehicle Id</th>
                <th>Reshedule</th>
            </tr>
            <tbody>
            <%
                //ResultSet rs=(ResultSet) request.getAttribute("rs");

                List<Appoinmtent> appoinmtents=new ArrayList<>();
                appoinmtents= (List<Appoinmtent>) request.getAttribute("APPOINMENTS");

                for(Appoinmtent theAppoinmtent : appoinmtents) {
                    int appoinmentId =theAppoinmtent.getAppointmentId();
                    String date = theAppoinmtent.getDate();
                    String time = theAppoinmtent.getTime();
                    String description = theAppoinmtent.getDescription();
                    int clientId = theAppoinmtent.getClientId();
                    int branchId = theAppoinmtent.getBranchId();
                    int vehicleId = theAppoinmtent.getVehicleId();

                    //Appoinmtent tempAppoinmtent = new Appoinmtent(appoinmentId, date, time, description, clientId, branchId, vehicleId);
                    //out.println(theAppoinmtent.toString());
            %>
            <tr>
                <td><%= appoinmentId %></td>
                <td><%= date %></td>
                <td><%= time %></td>
                <td><%= description %></td>
                <td><%= clientId %></td>
                <td><%= branchId %></td>
                <td><%= vehicleId %></td>
                <td><button class="button">Reshedule</button></td>
            </tr>
            <%  } %>

            </tbody>
        </table>
    </div>
</div>
<footer class="footer">
    <div class="center"><img src="/SerWise_war/Assets/SerWise.png" class="logo"></div>
    <div class="center"><a href="#"> Contact Us </a> &nbsp|
        &nbsp<a href="#"> About Us </a> &nbsp|
        &nbsp <a href="#"> Legal Stuff </a></div>
    <div class="center">All Rights Recieved</div>
</footer>
</body>
</html>