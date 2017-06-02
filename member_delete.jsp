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
		out.println("<script>");
	}
	
	String delete_id = request.getParameter("id");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "delete from members where id = ?";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("location.href='member_list.jsp'");
		out.println("</script>");
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>