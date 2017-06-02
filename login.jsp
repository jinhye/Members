<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member login Page</title>
</head>
<body>
	<form method="post" name="login" action="loginProcess.jsp">
		<center>
			<table border="1" bgcolor="lightblue">
				<tr>
					<td colspan="2" align="center">
						<b><font size="5">Login Page</font></b>
					</td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>Pass Word</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<!-- input type="submit" value="login" -->
						<a href="javascript:login.submit()">Login</a>
						<a href="join.jsp">Sign up</a>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>