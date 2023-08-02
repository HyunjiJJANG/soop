<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!--
이름 변경 : nameChange

이름 변경 확인 : nameChangeOk

비밀번호 변경 : passwordChange

비밀번호 변경 확인 passwordChangeOk

원래 닉네임 div : nameDiv

새로 받을 닉네임 div : newChangeNameDiv

원래 비밀번호 div : passwordDiv

새로 받을 비밀번호 div : newChangePasswordDiv

원래 닉네임 input : nameView

 새로 받을 닉네임 : name 

원래 비밀번호 input : passwordView

새로 받을 비밀번호 : password

임력 취소 버튼: nameChangeCancel
임력 취소 버튼: passwordChangeCancel

  -->



<script type="text/javascript">
	$(function() {

		//이름 변경 버튼을 누르면 입력받는 창이 보이게
		$("#nameChange").on("click", function() {
			console.log("이름 변경 버튼 눌림 ");
			$("#nameDiv").hide();
			$("#newChangeNameDiv").show();
		});

		//이름 변경 입력 취소 버튼을 누르면 입력 받는 창이 안 보이게
		$("#nameChangeCancel").on("click", function() {
			console.log("이름 변경 입력 취소 버튼 눌림 ");
			$("#newChangeNameDiv").hide();
			$("#nameDiv").show();
		});

		// 이름 길이가 2보다 작으면 빨간 테두리
		$("#name").on("keyup", function() {
			if ($(this).val().trim().length < 0) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");

			} else if ($(this).val().trim().length >= 2) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");

			}
		})

		// 비밀번호 길이가 8보다 작으면 빨간 테두리
		$("#password").on("keyup", function() {
			if ($(this).val().trim().length < 8) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");

			} else if ($(this).val().trim().length >= 8) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");

			}
		})

		// 비밀번호 확인이 일치하지 않으면 빨간 테두리
		$("#repeatPw").on("keyup", function() {
			if ($(this).val().trim() != $("#password").val().trim()) {
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");
				isPasswordCheckOk = false;
			} else if ($(this).val().trim() == $("#password").val().trim()) {
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");
				isPasswordCheckOk = true;
			}
		})

		//이름 변경 확인 버튼을 누르면
		$("#nameChangeOk")
				.on(
						"click",
						function() {
							console.log("이름 변경 확인 버튼 눌림 ");

							if ($("#name").val().trim().length > 2
									&& $("#name").val().trim() !== $(
											"#nameView").val()) {

								$.ajax({
									type : 'GET',
									url : '/nameChange',
									data : {
										"name" : $("#name").val().trim(),
										"nameView" : $("#nameView").val(),
										"email" : $("#email").val()
									},
									dataType : 'text',
									success : function(result) {
										var resp = result.trim();
										if (resp == "OK") {
											alert("닉네임(이름) 변경이 완료되었습니다.");

											$("#newChangeNameDiv").hide();
											$("#nameDiv").show();
											location.reload();

										} else {
											alert("닉네임(이름) 변경에 실패했습니다.");

										}
									}

								});

							} else if ($("#name").val().trim().length < 3) {
								alert("최소 2글자 이상 입력하세요.");
							} else if ($("#name").val().trim() == $("#nameView")
									.val().trim()) {

								alert("변경 전 같은 이름은 사용 불가능합니다.");
							}

						});

		//비밀번호 변경 버튼을 누르면 입력받는 창이 보이게
		$("#passwordChange").on("click", function() {
			$("#passwordDiv").hide();
			$("#newChangePasswordDiv").show();
			$("#newChangePasswordCheckDiv").show();
		});

		//비밀번호 변경 입력 취소 버튼을 누르면 입력받는 창이 보이게
		$("#passwordChangeCancel").on("click", function() {
			$("#newChangePasswordDiv").hide();
			$("#newChangePasswordCheckDiv").hide();
			$("#passwordDiv").show();
		});

		//비밀번호 변경 확인 버튼을 누르면
		$("#passwordChangeOk").on(
				"click",
				function() {
					console.log("비밀번호 변경 확인 버튼 눌림 ");

					if ($("#password").val().trim().length > 7
							&& $("#password").val().trim() == $("#repeatPw")
									.val().trim()) {

						$.ajax({
							type : 'GET',
							url : '/passwordChange',
							data : {

								"password" : $("#password").val(),
								"repeatPw" : $("#repeatPw").val(),
								"email" : $("#email").val()
							},
							dataType : 'text',
							success : function(result) {
								var resp = result.trim();
								if (resp == "OK") {
									alert("비밀번호 변경이 완료되었습니다.");
									$("#newChangePasswordDiv").hide();
									$("#newChangePasswordCheckDiv").hide();
									$("#passwordDiv").show();
									location.reload();

								} else {
									alert("비밀번호 변경에 실패했습니다.");

								}
							}

						});

					} else if ($("#password").val().trim().length < 7) {
						alert("8~30자 영문 대소문자, 숫자만 입력하세요.");
					} else if ($("#password").val().trim() !== $("#repeatPw")
							.val().trim()) {

						alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					}

				});

	})
</script>


</head>
<c:if test="${not empty memberDto}">
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card mypage-form">
			<div class="card-body">
				<h2 class="card-title text-left" id="MypageH2">마이페이지</h2>
				<hr class="pill" />
				<div class="card-text">
					<form name="frm" id="frm">
						<div class="card-title text-left" id="MypageH6">
							<h5>회원정보</h5>
						</div>
						<!--회원 프로필 사진  -->
						<div class="text-left"
							style="margin-top: 50px; margin-bottom: 50px;">
							<img src="${memberDto.profile_path }" class="rounded"
								alt="profile_image"> 
								<a href="#" id="profileImageModify"><img src="/images/iconmodify.png"
								 alt="profile_image"
								id="profileImageModifyButton"></a>
								

						</div>




						<!-- 이메일 -->
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">이메일(아이디)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" name="emailView"
												id="emailView" value="${memberDto.email }"
												style="--bs-border-color: #ffffff; padding-top: 0px;"
												readonly /> <input type="hidden" id="email" name="email"
												value="${memberDto.email }" />

										</div>
									</div>
								</div>
							</div>
						</div>




















						<div style="margin-top: 30px; margin-bottom: 40px;">
							<hr />
						</div>
						<div class="card-title text-left" id="MypageH6">
							<h5>회원정보 수정</h5>
						</div>
						<div style="margin-top: 30px; margin-bottom: 40px;">
							<hr />
						</div>
						<div style="margin-bottom: 30px;">
							<span>로그인 정보</span>
						</div>
						<!-- hidden -->




						<!-- 닉네임 -->
						<div class="row g-3 align-items-center" style="width: 800px;"
							id="nameDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="nameView"
												id="nameView" value="${memberDto.name }"
												style="--bs-border-color: #ffffff; padding-top: 0px; width: 100px; margin-bottom: 45px;"
												readonly />
										</div>

									</div>
								</div>
							</div>

							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>

						</div>

						<!-- 닉네임 변경 후 보일 div -->
						<div class="row g-3 align-items-center"
							style="width: 800px; display: none;" id="nameChangOkDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<div class="col-6">
												<span id="nameCkView" class="form-text"></span>
											</div>
										</div>

									</div>
								</div>
							</div>

							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>

						</div>


						<!-- 새로 받을 닉네임 -->
						<div class="row g-3 align-items-center" id="newChangeNameDiv"
							style="width: 800px; display: none;">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="name" id="name"
												style="padding-top: 0px; width: 250px; margin-bottom: 45px;"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required />
											<div class="invalid-feedback"
												style="width: 300px; margin-bottom: 30px; margin-top: -20px;">닉네임은
												2글자 이상 작성해주세야합니다.</div>
										</div>

									</div>
								</div>
							</div>

							<div class="col-1" style="margin-top: 10px;">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChangeOk"
									style="height: 45px; margin-top: 15px; margin-left: 150px;" />
							</div>
							<div class="col-1" style="margin-top: 10px;">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="입력 취소" id="nameChangeCancel"
									style="height: 45px; margin-top: 15px; margin-left: 190px;" />
							</div>

						</div>


						<!-- 비밀번호 -->
						<div class="row g-3 align-items-center" style="width: 800px;"
							id="passwordDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">


											<input type="password" class="form-control" name="pwView"
												id="pwView" class="form-control" value="password"
												style="--bs-border-color: #ffffff; width: 100px; margin-bottom: 45px;"
												readonly /> <input type="hidden" class="form-control"
												name="passwordView" id="passwordView" class="form-control"
												value="${memberDto.password }" /> <label for="password"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="passwordChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />

							</div>
						</div>

						<!-- 변경 할 비밀번호 -->
						<div class="row g-3 align-items-center"
							style="width: 800px; display: none;" id="newChangePasswordDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="password"
												id="password" class="form-control"
												style="width: 250px; margin-bottom: 45px;"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required />
											<label for="password"></label>
											<div class="invalid-feedback"
												style="width: 300px; margin-bottom: 30px; margin-top: -20px;">8~30자
												영문 대소문자, 숫자만 입력하세요.</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 변경 할 비밀번호 확인 -->
						<div class="row g-3 align-items-center"
							style="width: 800px; display: none; margin-top: -50px;"
							id="newChangePasswordCheckDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">비밀번호 확인</span>
									<div class="form-floating">
										<div class="form-floating">
											<input type="password" class="form-control" name="repeatPw"
												id="repeatPw" class="form-control"
												style="width: 250px; margin-bottom: 45px;"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required />
											<label for="password"></label>
											<div class="invalid-feedback"
												style="width: 300px; margin-bottom: 30px; margin-top: -20px;">비밀번호와
												동일하지 않습니다.</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="passwordChangeOk"
									style="height: 45px; margin-top: 15px; margin-left: 150px;" />
							</div>
							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="입력 취소" id="passwordChangeCancel"
									style="height: 45px; margin-top: 15px; margin-left: 190px;" />
							</div>

						</div>

						<hr />

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
	</c:if>
	
	
	
	<c:if test="${not empty memberOauth2Dto}">
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card mypage-form">
			<div class="card-body">
				<h2 class="card-title text-left" id="MypageH2">마이페이지</h2>
				<hr class="pill" />
				<div class="card-text">
					<form name="frm" id="frm">
						<div class="card-title text-left" id="MypageH6">
							<h5>회원정보</h5>
						</div>
						<!--회원 프로필 사진  -->
						<div class="text-left"
							style="margin-top: 50px; margin-bottom: 50px;">
							<img src="${memberOauth2Dto.profile_path }" class="rounded"
								alt="profile_image"> 
								<a href="#" id="profileImageModify"><img src="/images/iconmodify.png"
								 alt="profile_image"
								id="profileImageModifyButton"></a>
								

						</div>




						<!-- 이메일 -->
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-md-6 position-relative">
								<div class="col-6">
									<span class="join-label-title">이메일(아이디)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="email" class="form-control" name="emailView"
												id="emailView" value="${memberOauth2Dto.email }"
												style="--bs-border-color: #ffffff; padding-top: 0px;"
												readonly /> <input type="hidden" id="email" name="email"
												value="${memberOauth2Dto.email }" />

										</div>
									</div>
								</div>
							</div>
						</div>



						<div style="margin-top: 30px; margin-bottom: 40px;">
							<hr />
						</div>
						<div class="card-title text-left" id="MypageH6">
							<h5>회원정보 수정</h5>
						</div>
						<div style="margin-top: 30px; margin-bottom: 40px;">
							<hr />
						</div>
						<div style="margin-bottom: 30px;">
							<span>로그인 정보</span>
						</div>
						<!-- hidden -->




						<!-- 닉네임 -->
						<div class="row g-3 align-items-center" style="width: 800px;"
							id="nameDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="nameView"
												id="nameView" value="${memberOauth2Dto.name }"
												style="--bs-border-color: #ffffff; padding-top: 0px; width: 100px; margin-bottom: 45px;"
												readonly />
										</div>

									</div>
								</div>
							</div>

							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>

						</div>

						<!-- 닉네임 변경 후 보일 div -->
						<div class="row g-3 align-items-center"
							style="width: 800px; display: none;" id="nameChangOkDiv">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<div class="col-6">
												<span id="nameCkView" class="form-text"></span>
											</div>
										</div>

									</div>
								</div>
							</div>

							<div class="col-1">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChange"
									style="height: 45px; margin-top: 15px; margin-left: 60px;" />
							</div>

						</div>


						<!-- 새로 받을 닉네임 -->
						<div class="row g-3 align-items-center" id="newChangeNameDiv"
							style="width: 800px; display: none;">
							<div class="col-md-6 position-relative" style="width: 150px;">
								<div class="col-6">
									<span class="join-label-title"
										style="width: 200px; margin-top: 20px;">닉네임(이름)</span>
									<div class="form-floating">
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="name" id="name"
												style="padding-top: 0px; width: 250px; margin-bottom: 45px;"
												id="validationTooltipUsername"
												aria-describedby="validationTooltipUsernamePrepend" required />
											<div class="invalid-feedback"
												style="width: 300px; margin-bottom: 30px; margin-top: -20px;">닉네임은
												2글자 이상 작성해주세야합니다.</div>
										</div>

									</div>
								</div>
							</div>

							<div class="col-1" style="margin-top: 10px;">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="변경" id="nameChangeOk"
									style="height: 45px; margin-top: 15px; margin-left: 150px;" />
							</div>
							<div class="col-1" style="margin-top: 10px;">
								<input type="button" class="btn btn-outline-success btn-sm"
									value="입력 취소" id="nameChangeCancel"
									style="height: 45px; margin-top: 15px; margin-left: 190px;" />
							</div>

						</div>


						<hr />

					</form>

				</div>
			</div>
		</div>
	</div>
</body>
	</c:if>
	
</html>