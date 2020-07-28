<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="ok.jsp" >
		<label for="id"> 아이디 : <br></label> <input type="text"  name="id"><br> 
		<label for="pw"> 비밀번호 : <br></label> <input type="password"  name="pw"><br>
		<label for="name"> 이름 : <br></label> <input type="text"  name="username"><br>
		<label for="mail"> 이메일 : <br></label> <input type="email" name="mail"><br>
		<label for="mobile"> 전화번호 : <br></label> <input type="text"  name="mobile"><br>
		<br> <input type="submit" value="확인">
	</form>
</body>
</html>