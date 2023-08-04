<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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

.card-text {
	
}

.form-floating {
	margin-top: 10px;
}

.login-form {
	width: 500px;
	margin: 20px;
}

.sign-in {
	text-align: center;
	padding: 20px 0 0;
	border-top: #333 1px;
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

.line {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 14px;
	margin: 8px 0px;
}

.line::before {
	content: "";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.line::after {
	content: "";
	flex-grow: 1;
	margin: 0px 16px;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
}

.loginButton {
	
}

.link {
	font-size: 16px;
	margin-top: 80px;
	color: black;
	align-items: center;
}
</style>
</head>
<body class="d-flex flex-column h-100">

	<div class="global-container">
		<div class="card login-form">
			<div class="card-body">
				<h3 class="card-title text-center">LOGIN</h3>
				<div class="card-text">
					<form action="/login" method="post" name="frm" id="frm">

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">이메일</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" name="username"
												id="username" placeholder="account@example.com"
												aria-labelledby="emailCheck" class="form-control"
												id="validationTooltipUsername"

												aria-describedby="validationTooltipUsernamePrepend" required value="test1@naver.com">
											<label for="email">이메일</label>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Password" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required value="11111111">

												
											<label for="email">이메일</label>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="password"
												id="password" placeholder="Password" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>

											<label for="password">비밀번호</label> <input type="hidden"
												name="${_csrf.parameterName }" value="${_csrf.token }" />
										</div>
									</div>
								</div>
							</div>

						</div>


						<div class="d-grid gap-2 col-12"
							style="width: 276px; height: 36px;">
							<input type="submit" class="btn btn-success" value="로그인"
								style="margin-top: 20px; width: 450px; height: 50px; " />
						</div>
					</form>
					<div class="link">
						<a href="/searchPassword" style="margin-left: 90px; color: black;  text-decoration-line: none;">비밀번호 찾기</a> <a
							href="/register" style="margin-left: 100px; color: black;  text-decoration-line: none;">회원가입</a>

					</div>

					<div class="line" style="margin-top: 70px; padding-right: 20px; margin-bottom: 35px;">SNS
						계정 로그인</div>

					<div class="loginButton">
						<a href="oauth2/authorization/kakao"><img alt="kakaoLogin"
							src="/images/kakao_login_medium_narrow.png"
							style="width: 150px; height: 40px; margin-left: 45px;"></a> <a
							href="oauth2/authorization/google"><img alt="googleLogin"
							src="/images/btn_google_signin_light_normal_web.png"
							style="margin-left: 10px; width: 150px; height: 43px; margin-left: 50px;"></a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>