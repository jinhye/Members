<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	<%@ page import="javax.naming.*" %>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into members values(?,?,?,?,?,?)";
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			
			//Class.forName(db_1.DB.O);
			//con = DriverManager.getConnection(db_1.DB.U, db_1.DB.I, db_1.DB.P);
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setInt(4,age);
			pstmt.setString(5,gender);
			pstmt.setString(6,email);
			
			int result = pstmt.executeUpdate();
			
			if(result != 0){
				out.println("<script>");
				out.println("location.href='login.jsp'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("location.href='join.jsp'");
				out.println("</script>");
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
	
	
	%>

</body>
</html>