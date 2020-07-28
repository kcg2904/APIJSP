<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.*" %>
<%@ page import="dao.NaverDAOImpl" %>
<%@ page import="dto.NaverDTO" %>
<%@ page import="naver.ApiExamSearchBlog" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	NaverDAOImpl nd = new NaverDAOImpl();
		String a = request.getParameter("search");
		NaverDTO dto = new NaverDTO();
		String str = ApiExamSearchBlog.main(a);
		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(str);
		JsonArray ol = (JsonArray) jsonObj.get("items");
		for (int i = 0; i < ol.size(); i++) {
		JsonObject object = (JsonObject) ol.get(i);
		String title = object.get("title").getAsString();
		String originallink = object.get("originallink").getAsString();
		String link = object.get("link").getAsString();
		String description = object.get("description").getAsString();
		String pubDate = object.get("pubDate").getAsString();
		dto.setTitle(title);
		dto.setOriginallink(originallink);
		dto.setLink(link);
		dto.setDescription(description);
		dto.setPubDate(pubDate);
		out.println("title : " + title);%>
		<br>
		<%
		out.println("originallink : " + originallink);
		%>
		<br>
		<%
		out.print("link : ");
		%>
		<a href="<%= link
		%>"><%= link %></a>
		<br>
		<%
		out.println("description : "+ description);
		%>
		<br>
		<%
		out.println("pubDate : "+pubDate);
		%>
		<br><br>
		<%
		nd.insert(dto);
		
		
		}
		%>
		<br>
		<form action="index.jsp">
		<input type="submit" value="홈으로">
		</form>
</body>
</html>