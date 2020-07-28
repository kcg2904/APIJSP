<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw"); 
%> 

<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/dbdb", "root", "1234");
	System.out.println("연결 성공");
	String sql = "SELECT id,pw,username FROM usertbl WHERE id=? AND pw= ?";
	pstmt = conn.prepareStatement(sql);
	// 4. 데이터 binding
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	rs = pstmt.executeQuery();
	if (rs.next()) {
		out.println("로그인 성공");
		System.out.println(">>>>>>>>>>>>>"+rs.getString("username"));
		session.setAttribute("username", rs.getString("username"));
		%>
		<script>
		alert("환영합니다.");
		location.href="index.jsp";
		</script>
		<%
		
	} else {
		out.println("로그인 실패");
		response.sendRedirect("login.jsp");
			
	}
} catch (Exception e) {
	System.out.println("에러: " + e);
} finally {
	try {
		if( pstmt != null && !pstmt.isClosed()){
            pstmt.close();
        }
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

%>

</body>
</html>