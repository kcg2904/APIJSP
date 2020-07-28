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
String username = request.getParameter("username"); 
String mail = request.getParameter("mail"); 
String mobile = request.getParameter("mobile"); 
%> 

<% 
Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost/dbdb", "root", "1234");
	System.out.println("연결 성공");
	String sql = "INSERT INTO usertbl(id,pw,username,mail,mobile) VALUES(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	// 4. 데이터 binding
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, username);
	pstmt.setString(4, mail);
	pstmt.setString(5, mobile);
	
	int count = pstmt.executeUpdate();
	if (count == 0) {
		System.out.println("데이터 입력 실패");
		response.sendRedirect("form.jsp");
	} else {
		System.out.println("데이터 입력 성공");
		response.sendRedirect("index.jsp");
	}


} catch (Exception e) {
	%>
	<script>
	alert("중복된 아이디 입니다. 다시 입력하세요.")
	location.href="form.jsp";
	</script>
	<%
	System.out.println("에러: " + e);
} finally {
	try {
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
		if( pstmt != null && !pstmt.isClosed()){
            pstmt.close();
        }
	} catch (SQLException e) {
		e.printStackTrace();
	}

} %>
	
</body>
</html>