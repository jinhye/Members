<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join in Members Page</title>
</head>
<body>
	<form method="post" name="join" action="joinProcess.jsp">
	<center>
		<table border="1" bgcolor="lightyellow">
			<tr>
				<td colspan="2" align="center"><b><font size="5">Member Register Page</font></b></td>
			</tr>
			<tr>
				<td>ID: </td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PassWord: </td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td>Name: </td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>Age: </td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>Gender: </td>
				<td><input type = "radio" name="gender" value="male" checked="checked">Male
				<input type="radio" name="gender" value="female">Female	
				</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="javascript:join.submit()">Register</a>
					<a href="javascript:join.reset()">Reset</a>
				</td>
			</tr>	
		</table>	
	</center>
	</form>
</body>
</html>