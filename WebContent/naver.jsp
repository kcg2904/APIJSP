<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String name = (String)session.getAttribute("username");
    System.out.println(name);
    if (name == null){
    	response.sendRedirect("index.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
날씨 검색<br>
<form action="json.jsp">
<input type="search" name="search"></input>
<input type="submit" value="검색"></input>
</form>
</body>
</html>