<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="/css/hhj.css">

<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>



<!-- css -->

<style>
html, body {
	height: 100%;
}

.global-container {
	margin-top: 100px;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #ffffff;
}

form {
	padding-top: 10px;
	font-size: 14px;
	margin-top: 20px;
}

.card-title {
	font-weight: 300;
}

.form-floating {
	margin-top: 10px;
}

.mypage-form {
	width: 900px;
	margin: 20px;
}

.sign-in {
	text-align: center;
	padding: 20px 0 0;
}

.card {
	--bs-card-border-color: rgb(0 0 0/ 0%);
}

.card-body {
	flex: 1 1 auto;
	padding: var(--bs-card-spacer-y) var(--bs-card-spacer-x);
	color: var(--bs-card-color);
}

.join-label-title {
	display: inline-block;
	padding: 3px 0;
	font-size: 16px;
	color: #333;
	font-weight: 700;
	text-align: left;
}

.form-control {
	margin-bottom: 20px;
	width: 450px;
}

.row g-3 align-items-center {
	width: 800px;
}

#MypageH2 {
	font-weight: bold;
}

#MypageH6 {
	margin-top: 40px;
	margin-bottom: 20px;
}

#btnNext {
	margin-top: 50px;
	width: 250px;
	height: 40px;
	margin-left: 330px;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 100%;
}

#profileImageModifyButton {
	position: fixed;
	top: 308px; /* 화면 위쪽에서 20px 떨어진 위치에 고정됩니다. */
	left: 314px; /* 화면 오른쪽에서 20px 떨어진 위치에 고정됩니다. */
	width: 50px;
	background-color: #bdbdbd;
	padding: 10px;
	border-radius: 50%; /* 반지름 값이 너비와 높이의 절반 크기가 되도록 설정 */
	object-fit: cover; /* 이미지가 요소에 꽉 차도록 설정 */
}

#profileImage {
	width: 100px;
	height: 100px;
	text-align: center;
	align-items: center;
}

#profileCard {
	text-align: left;
	align-items: center;
	 height: 500px; 
  overflow-y: auto; 
  
}
/* 검색창  */
#searchDiv {
	position: relative;
	width: 200px;
	margin-left: 660px;
	margin-top: 50px;
}

#searchInput {
	font-size: 15px;
	color: #222222;
	width: 200px;
	border: none;
	border-bottom: solid #aaaaaa 1px;
	padding-bottom: 10px;
	padding-left: 10px;
	position: relative;
	background: none;
	z-index: 5;
}

#searchInput::placeholder {
	color: #aaaaaa;
}

#searchInput:focus {
	outline: none;
}

#searchSpan {
	display: block;
	position: absolute;
	bottom: 0;
	left: 0%; /* right로만 바꿔주면 오 - 왼 */
	background-color: #666;
	width: 0;
	height: 2px;
	border-radius: 2px;
	transition: 0.5s;
}

#searchLable {
	position: absolute;
	color: #aaa;
	left: 10px;
	font-size: 20px;
	bottom: 8px;
	transition: all .2s;
}

#searchInput:focus ~ #searchLable, #searchInput:valid ~ #searchLable {
	font-size: 16px;
	bottom: 40px;
	color: #666;
	font-weight: bold;
}

#searchInput:focus ~ #searchSpan, #searchInput:valid ~ #searchSpan {
	width: 100%;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#searchInput").on("keyup", function() {
			var searchName = $(this).val().trim();
			var member_no = parseInt($("#member_no").val());
			var project_no = parseInt($("#project_no").val());
			getSearchList(searchName, member_no, project_no);
		});
	});

	function getSearchList(searchName, member_no, project_no) {
		console.log("searchName getSearchList 이벤트 발생중");

		$
				.ajax({
					url : "/getSearchList",
					method : "GET",
					data : {
						searchName : searchName,
						member_no : member_no,
						project_no : project_no
					},
					dataType : "json",
					success : function(result) {
						if (result && result.length >= 1) {
							var searchResultList = [];

							result
									.forEach(function(item) {
										var str = '<div class="col" id="searchResultList">';
										str += '<div class="card">';
										str += '<img src="' + item.profile_path + '" class="card-img-top" alt="프로필 이미지" id="profileImage">';
										str += '<div class="card-body">';
										str += '<h5 class="card-title" style="margin-top: 10px;">'
												+ item.name + '</h5>';
										str += '<p class="card-text">'
												+ item.email + '</p>';
										str += '</div>';
										str += '</div>';
										str += '</div>';

										searchResultList.push(str); 
									});

							
							$('#profileCard').empty().append(
									searchResultList.join(''));
						} else {
							
							$('#profileCard').empty();
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						console.log("Error occurred:", errorThrown);
					}
				});
	}
</script>
</head>

<body class="d-flex flex-column h-100">
	<input type="hidden" value="${email }" name="email" />
	<input type="hidden" value="${member_no }" name="member_no"
		id="member_no" />
	<input type="hidden" value="${project_no }" name="project_no"
		id="project_no" />

	<div class="global-container">
		<div class="card mypage-form">
			<div class="card-body">
				<h2 class="card-title text-left" id="MypageH2">주소록</h2>
				<hr class="pill" />
				<div id="searchDiv">
					<input type="text" id="searchInput" name="searchInput" required>
					<label id="searchLable">이름🔍</label> <span id="searchSpan"></span>
				</div>
				<div class="card-text">

					<div class="card-title text-left" id="MypageH6"></div>
					  <div class="search-result-container">
						<div class="row row-cols-1 row-cols-md-3 g-4" id="profileCard">
							<c:forEach var="memberProjectMemberdto" items="${list}">
								<div class="col" id="searchResultList">
									<div class="card">
										<img src="${memberProjectMemberdto.profile_path }"
											class="card-img-top" alt="프로필 이미지" id="profileImage">

										<div class="card-body">
											<h5 class="card-title" style="margin-top: 10px;">${memberProjectMemberdto.name }</h5>
											<p class="card-text">${memberProjectMemberdto.email }</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>