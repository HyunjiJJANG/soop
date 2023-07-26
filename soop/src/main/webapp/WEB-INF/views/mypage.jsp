<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
	 	<!-- principal : 보호된 대상에 접근하는 유저(접근 주체) -> 걔에 대한 정보를 보여주세요/ test용  -->
		<sec:authentication property="principal"/>
		
	</h3>
</body>
</html>