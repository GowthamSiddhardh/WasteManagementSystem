<%@page import="java.sql.ResultSet"%>
<%@page import="com.cleaningmanagement.daoimpl.UserDAOImpl"%>
<%@page import="com.cleaningmanagement.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bill</title>
<style>
table,tr,th,td{
border:1px solid black;
border-collapse:collapse;

}
</head>
<body>
	<h1>Bill</h1>
	<%!User user; %>
	<%!int amount; %>
<% 
  user=(User)session.getAttribute("CurrentUser");
 UserDAOImpl userdao = new UserDAOImpl();
 ResultSet rs = userdao.userBill(user);
  
 if(user.getWallet()>amount){%>
	<table>
		<tr>
			<th>RequestID</th>
			<th>UserId</th>
			<th>Category</th>
			<th>Weight</th>
			<th>Amount</th>
			<th>EmployeeId</th>
			<th>RequestDate</th>
			<th>Location></th>
		</tr>

		<%while(rs.next()) {%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getInt(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getInt(4) %></td>
			<td><%=rs.getInt(5) %></td>
			<td><%=rs.getInt(6) %></td>
			<td><%=rs.getDate(7) %></td>
			<td><%=rs.getString(8) %></td>
		</tr>
		<%amount = rs.getInt(5); %>
		<% } %>
	</table>
	<%  
     UserDAOImpl userdao1 = new UserDAOImpl();
	boolean b1 = userdao1.updateWallet(user, amount);
	if(b1==true)
	{%>
	<h1><%= amount%>
		&nbsp;Successfully deducted!!
	</h1>
	<%}%>
	<% }else{%>
	<h1>Insufficient Balance</h1>
	<%}%>


</body>
</html>