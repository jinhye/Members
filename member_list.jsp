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
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from members";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	} catch(SQLException e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Membership Management System</title>
</head>
<body>
	<center>
	<table border="1" width="300">
		<tr align="center">
			<td colspan="2">Member List</td>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr align="center">
			<td>
				<a href="member_info.jsp?id=<%=rs.getString("id") %>">
				<%=rs.getString("id") %></a>
			</td>
			<td>
				<a href="member_delete.jsp?id=<%=rs.getString("id") %>">Delete</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	</center>
</body>
</html>