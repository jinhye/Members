<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id = null;
	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	}
	
	String info_id = request.getParameter("id");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from members where id = ?";
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		
		rs.next();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Look a member information</title>
</head>
<body>
	<center>
	<table border="1" width="300">
		<tr align="center">
			<td>ID: </td>
			<td><%=rs.getString("id") %></td>
		</tr>
		<tr align="center">
			<td>PassWord: </td>
			<td><%=rs.getString("pw") %></td>
		</tr>
		<tr align="center">
			<td>Name: </td>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr align="center">
			<td>Age: </td>
			<td><%=rs.getString("age") %></td>
		</tr>
		<tr align="center">
			<td>Gender: </td>
			<td><%=rs.getString("gender") %></td>
		</tr>
		<tr align="center">
			<td>Email: </td>
			<td><%=rs.getString("email") %></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="member_list.jsp">Go to List</a>
				<a href="login.jsp">Go to Login</a>
			</td>
		</tr>
		</table>
	</center>
</body>
</html>