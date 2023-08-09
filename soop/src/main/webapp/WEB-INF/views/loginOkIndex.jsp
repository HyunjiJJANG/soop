<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		<!-- principal : 보호된 대상에 접근하는 유저(접근 주체) -> 걔에 대한 정보를 보여주세요~~~~뜻  -->
		<sec:authentication property="principal" />
	</h3>
	<hr />
	<%-- <p>사용자 이름 : <sec:authentication property="principal.username"/> </p>  --%>
	<hr />
	<c:if test="${not empty memberDto}">
	memberDto 이거 맞나요
	${memberDto}
		
	<h1>
		<a
			href="/mypage?member_no=${memberDto.member_no }&email=${memberDto.email}">mypage</a>
	</h1>
	<h1>
		<a
			href="/contact?member_no=${memberDto.member_no }&email=${memberDto.email}">/주소록</a>
	</h1>
	<h1>
		<a
			href="/home?member_no=${memberDto.member_no }">home</a>
	</h1>
	</c:if>
	<c:if test="${not empty memberOauth2Dto}">
	memberOauth2Dto 이거 맞나요
	${memberOauth2Dto}
		
	<h1>
		<a
			href="/mypageOauth2?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}">mypage</a>
	</h1>
	<h1>
		<a
			href="/contact?member_no=${memberOauth2Dto.member_no }&email=${memberOauth2Dto.email}">/주소록</a>
	</h1>
		<h1>
		<a
			href="/home?member_no=${memberOauth2Dto.member_no }">home</a>
		</h1>
	</c:if>

</body>
</html>