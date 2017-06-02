<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Process</title>
</head>
<body>
	<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	<%
			
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		String pw = null;
		
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		String sql = "select * from members where id = ?";
		
		try{
			//Database loading and connection
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			
			//Class.forName(db_1.DB.O);
			//con = DriverManager.getConnection(db_1.DB.U, db_1.DB.I, db_1.DB.P);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					session.setAttribute("id", id);
					out.println("<script>");
					out.println("location.href='main.jsp'");
					out.println("</script>");
				}
			}
	
			out.println("<script>");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		} catch (SQLException e){
			e.printStackTrace();
		}
	%>

</body>
</html>