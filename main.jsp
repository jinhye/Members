<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = null;
	
	if(session.getAttribute("id") != null){
		id = (String) session.getAttribute("id");
	}else{
		out.println("<script>");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	}	
	%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
	<hr size="5" color="red">
	<h3><b>You logged in with </b> [<%=id %>]</h3>
	<%
		if(id.equals("admin")){
	%>
			<a href="member_list.jsp">Access to Member list</a>
	<%
		}
	%>
	<hr size="5" color="green">
</body>
</html>