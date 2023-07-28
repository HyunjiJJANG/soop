<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>

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
</style>


</head>

${list }
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card mypage-form">
			<div class="card-body">
				<h2 class="card-title text-left" id="MypageH2">주소록</h2>
				<hr class="pill" />
				<div class="card-text">
					
						
						<!--회원 프로필 사진  -->
						<div class="text-left"
							style="margin-top: 50px; margin-bottom: 50px;">
							<img src="${memberDto.profile_path }" class="rounded"
								alt="profile_image"> 


						</div>


			

				</div>
			</div>
		</div>
	</div>
</body>




</html>