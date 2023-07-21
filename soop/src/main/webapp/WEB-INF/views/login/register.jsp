<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- AJAX -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

.form-floating {
	margin-top: 10px;
}

#btnRegister {
	font-size: 14px;
	margin-top: 20px;
	 width: 450px;
	
}

.register-form {
	width: 500px;
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
</style>

<script type="text/javascript">
	$(function(){
		
		var $email = $("#mid");
		
		$("#email").on("keyup", function(){
			$.ajax({
				type: "GET",
				url: "/emailCheck",
				data: {"email":$("#email").val().trim()},
				dataType : "text", 
				success: function(result){
					var resp = result.trim();
					if(resp == "OK") {
						$("#idCheck").html("사용가능한 아이디입니다.").css("color","blue");
					}else{
						$("#idCheck").html("이미 존재하는 아이디입니다.").css("color","red");
					}
				}
			});
		});
		// 비밀번호 길이가 8보다 작으면 빨간 테두리
		$("#password").on("keyup",function(){
			if($(this).val().trim().length < 8){
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");
			}else if($(this).val().trim().length >= 8){
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");
			}
		})
		// 비밀번호 확인이 일치하지 않으면 빨간 테두리
		$("#repeatPw").on("keyup",function(){
			if($(this).val().trim() != $("#pw").val().trim()){
				$(this).removeClass("form-control");
				$(this).addClass("form-control is-invalid");
			}else if($(this).val().trim() == $("#pw").val().trim()){
				$(this).removeClass("form-control is-invalid");
				$(this).addClass("form-control");
			}
		})
		// 인증메일 비동기화 방식으로 보내기
		$("#btnMailCheck").on("click",function(){
			$.ajax({
				type:"GET",
				url:"/mailCheck",
				data: {"email":$("#email").val().trim()}
			});
			$("#authCodeDiv").show();
		})
		// 인증번호 일치여부 확인
		$("#btnAuth").on("click", function(){
			$.ajax({
				type: "GET",
				url: "authCodeCheck.jsp",
				data: {"authCode":$("#authCode").val().trim()},
				success: function(response){
					var authCode = response.trim();
					if(authCode == $("#authCode").val().trim()) {
						$("#authCodeCheck").html("인증번호 일치").css("color","blue");
						$("#btnRegister").removeClass("btn btn-primary disabled");
						$("#btnRegister").addClass("btn btn-primary");
				 		/* if(&& $("#pw").val().trim().length>=8 && $("repeatPw").val().trim()==$("#pw").val().trim()){							
						} */
					}else if(authCode != $("#authCode").val().trim()) {
						$("#authCodeCheck").html("인증번호 불일치").css("color","red");
					}
				}
			})
		})
	})
</script>



</head>
<body class="d-flex flex-column h-100">
	<div class="global-container">
		<div class="card register-form">
			<div class="card-body">
				<h3 class="card-title text-center">SIGN UP</h3>
				<div class="card-text">
					<form action="/registerOk" method="post" name="frm">
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-6">
								<span class="join-label-title">닉네임</span>
								<div class="form-floating">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="Name"> <label for="name">닉네임</label>
								</div>
							</div>
						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
					<div class="col-6">
						<span class="join-label-title">이메일</span>
						<div class="form-floating">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="account@example.com" aria-labelledby="emailCheck"
									> <label for="email">이메일</label>
							</div>
						</div>
						<div class="col-6">
								<span id="idCheck" class="form-text"></span>
							</div>
							
					</div>
					< <div class="col-1">
						<input type="button" class="btn btn-outline-success btn-sm"
							value="인증번호 받기" id="btnMailCheck"
							style="height: 45px; margin-top: 15px;" />
					</div>
				</div>
				 <div class="row g-3 align-items-center" id="authCodeDiv"
					style="display: none" style="width: 800px;">
					<div class="col-6">
						<div class="form-floating">
							<span class="join-label-title">인증번호</span> <input type="text"
								class="form-control" name="authCode" id="authCode"
								placeholder="authCode" aria-labelledby="btnAuth"> <label
								for="authCode">인증번호</label>
						</div>
					</div>
					<div class="col-6">
						<input type="button" class="btn btn-outline-primary btn-sm"
							value="인증" id="btnAuth" /> &nbsp;&nbsp;&nbsp; <span
							id="authCodeCheck" class="form-text"></span>
					</div>
				</div>
						</div>
						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-6">
								<span class="join-label-title">비밀번호</span>
								<div class="form-floating">
									<div class="form-floating">
										<input type="password" class="form-control" name="password"
											id="password" placeholder="Password"
											> <label for="password">비밀번호</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row g-3 align-items-center" style="width: 800px;">
							<div class="col-6">
								<span class="join-label-title">비밀번호 확인</span>
								<div class="form-floating">
									<div class="form-floating">
										<input type="password" class="form-control"
											name="passwordCheck" id="passwordCheck"
											placeholder="Password"> <label for="repeatPw">비밀번호
											확인</label>
									</div>
								</div>
							</div>
						</div>

			
				<div class="d-grid gap-2 col-12" style="height: 65px;">
					<input type="submit" class="btn btn-success" value="가입하기"
						id="btnRegister" />
				</div>
				<div class="sign-in">
					<a href="/clogin">이미 계정이 있습니다</a>
				</div>
				</div>
				
				</form>
			</div>
		</div>
	</div>
	</div>

</body>
</html>