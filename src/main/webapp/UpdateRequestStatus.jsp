<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateRequestStatus</title>
<style>
body{
background-image: url('images/background1.jpg');
    margin: 0px;
}
.loginContent {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}
.loginContent form {
    background: white;
    padding: 15px;
    text-align: left;
}
.loginContent form label {
    font-weight: bold;
}
.loginContent form h1 {
    margin: 0px 0px 7px;
    text-align: center;
}
.loginContent form input {
    width: 95%;
    border: none;
    background: aliceblue;
    padding: 10px;
    margin: 10px 0px;
}
.loginContent form {
    background: white;
    padding: 15px;
    text-align: left;
    width:25%
}
.formBtn {
    display: flex;
    justify-content: center;
}
.formBtn input {
    margin: 4px 4px;
    width: auto !important;
    padding: 10px 25px !important;
    background: black !important;
    color: white;
    font-weight: bold;
}
</style>
</head>
<body>
<% int requestId=Integer.parseInt(request.getParameter("Rid"));
String EmployeeStatus=request.getParameter("empstatus");
session.setAttribute("reqId", requestId);
session.setAttribute("empstatus", EmployeeStatus);
%>
<div class="loginContent">
<form action="UpdateRequestStatus" method="post">
<h1>Request Status</h1>
<input type="text" name="requeststatus" id="requeststatus" list="Status" autofocus>
<datalist id="Status">
            <option disabled>--select--</option>
            <option value="pending">PENDING</option>
            <option value="completed">COMPLETED</option>
</datalist>
<div class="formBtn">
<input type="submit" value="update">
</div>
</form>
</div>
</body>
</html>