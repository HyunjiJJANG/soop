<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	margin-bottom: 40px;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 100%;
}
</style>

</head>
<body class="d-flex flex-column h-100">
	<h3>

		<div class="global-container">
			<div class="card mypage-form">
				<div class="card-body">
					<h2 class="card-title text-left" id="MypageH2">마이페이지</h2>
					<hr class="pill">
					<div class="card-text">
						<form action="/registerOk" method="post" name="frm" id="frm">
							<div class="card-title text-left" id="MypageH6">
								<h6>비밀번호 재확인</h6>
							</div>
							<hr />
							<div class="row g-3 align-items-center " style="width: 800px;">
								<div class="col-md-6 position-relative">
									<div class="col-6">
										<span class="join-label-title">닉네임</span>
										<div class="form-floating">
											<input type="text" class="form-control" name="name" id="name"
												placeholder="Name"> <label for="name">닉네임</label>
											<div class="invalid-feedback">닉네임은 2글자 이상 작성해주세야합니다.</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row g-3 align-items-center" style="width: 800px;">
								<div class="col-md-6 position-relative">
									<div class="col-6">
										<span class="join-label-title">이메일</span>
										<div class="form-floating">
											<div class="form-floating mb-3">
												<input type="email" class="form-control" name="email"
													id="email" placeholder="account@example.com"
													aria-labelledby="emailCheck" class="form-control"
													id="validationTooltipUsername"
													aria-describedby="validationTooltipUsernamePrepend"
													required> <label for="email">이메일</label>
												<div class="invalid-feedback">이메일을 입력해주세요</div>
											</div>
										</div>
									</div>
									<div class="col-6">
										<span id="idCheck" class="form-text"></span>
									</div>
								</div>

								<div class="col-1">
									<input type="button" class="btn btn-outline-success btn-sm"
										value="인증번호 받기" id="btnMailCheck"
										style="display: none; height: 45px; margin-top: 15px; margin-left: 60px;" />
								</div>
							</div>
							<div class="row g-3 align-items-center" id="authCodeDiv"
								style="display: none" style="width: 800px;">
								<div class="col-md-6 position-relative">
									<div class="col-6">
										<span class="join-label-title"
											style="width: 200px; margin-top: 20px;">이메일 확인 인증번호</span>
										<div class="form-floating">
											<input type="text" class="form-control" name="authCode"
												id="authCode" placeholder="authCode"
												aria-labelledby="btnAuth" class="form-control"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required>
											<div class="invalid-feedback">이메일 확인 인증번호를 입력해주세요</div>

										</div>
									</div>
								</div>
								<div class="col-6">
									<input type="button"
										style="height: 45px; margin-top: 60px; margin-left: 220px;"
										class="btn btn-outline-success btn-sm" value="인증" id="btnAuth" />
									&nbsp;&nbsp;&nbsp;
								</div>
								<div class="col-6">
									<span id="authCodeCheck" class="form-text"></span>
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
													aria-describedby="validationTooltipUsernamePrepend"
													required> <label for="password">비밀번호</label>
												<div class="invalid-feedback">비밀번호는 8자 이상으로 입력해주세요</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<span id="pwCheck" class="form-text"></span>
								</div>
							</div>

							<div class="row g-3 align-items-center" style="width: 800px;">
								<div class="col-md-6 position-relative">
									<div class="col-6">
										<span class="join-label-title">비밀번호 확인</span>
										<div class="form-floating">
											<div class="form-floating">
												<input type="password" class="form-control"
													name="passwordCheck" id="repeatPw" placeholder="Password"
													class="form-control"
													aria-describedby="validationTooltipUsernamePrepend"
													required> <label for="repeatPw">비밀번호 확인</label>
												<div class="invalid-feedback">비밀번호와 동일하지 않습니다.</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<span id="repeatPwCheck" class="form-text"></span>
								</div>
							</div>


							<div class="d-grid gap-2 col-12" style="height: 65px;">
								<button type="button" class="btn btn-success" value="가입하기"
									onclick="validation()">가입하기</button>

							</div>
							<div class="sign-in">
								<a href="/clogin">이미 계정이 있습니다</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
</body>
</html>