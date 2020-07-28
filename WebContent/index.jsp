<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

Hello world!<br>
현재 날짜와 시간은 : <%=new java.util.Date() %><br>
 <%
 String name = (String)session.getAttribute("username");
 System.out.println(">>>>>>>>>>>>>>>>>>>>"+name);
 if (name == null){
 %><br>
 <a href="form.jsp">회원가입</a><br>
<% } 
	if (name == null) {%>
 <a href="login.jsp">로그인</a><br>
 <% } else {%>
 <a href="logout.jsp">로그아웃</a><br>
 <%} %>
 <% 
	if (name != null){ 
 %>
 <a href="naver.jsp">검색</a>
 <%} %>
</body>
</html>