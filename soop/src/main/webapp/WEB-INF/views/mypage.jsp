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
</style>





<script type="text/javascript">
 /*  $(function() {
	 $("#testbutton").on(
			"click",
			function() {
				var email = $("#email").val().trim(); 
				console.log(email);
				var password = $("#password").val().trim(); 
				console.log(password);
				 $.ajax({
						type : "GET",
						url : "/mypagePasswordCheck",
						data : {
							 "email" : $("#email").val().trim(),
							"password" : $("#password").val().trim() 
							"email" : email,
							"password" : password 
						},
						dataType : "text",
						success : function(result) {
							var resp = result.trim();
							if (resp == "OK") {
								alert("비밀번호 확인이 완료되었습니다.");
								isCertification = true; //인증 성공여부 check	
							} 
								
							else {
								isCertification = false; //인증 실패
								alert("비밀번호가 맞지않습니다. 다시 확인해주세요.");
							}
						}
					});
	

	});
	
})
 */
 

 

 function validation() {
	 
	 var email = $("#email").val().trim(); 
		console.log(email);
		var password = $("#password").val().trim(); 
		console.log(password);
		 $.ajax({
				type : "GET",
				url : "/mypagePasswordCheck",
				data : {
					/* "email" : $("#email").val().trim(),
					"password" : $("#password").val().trim() */
					"email" : email,
					"password" : password 
				},
				dataType : "text",
				success : function(result) {
					var resp = result.trim();
					if (resp == "OK") {
						alert("비밀번호 확인이 완료되었습니다.");
						isCertification = true; //인증 성공여부 check	
						$("#frm").attr("action", "/mypagePasswordCheckOk").submit();
					} 
						
					else {
						isCertification = false; //인증 실패
						alert("비밀번호가 맞지않습니다. 다시 확인해주세요.");
					}
				}
			});
		 
		 
	 if (isCertification == false) {
			alert("비밀번호가 맞지않습니다. 다시 확인해주세요.")
			return false;
		}

	
} 


</script>
</head>
<body class="d-flex flex-column h-100">
		<div class="global-container">
			<div class="card mypage-form">
				<div class="card-body">
					<h2 class="card-title text-left" id="MypageH2">마이페이지</h2>
					<hr class="pill"/>
					<div class="card-text">
						<form action="/mypagePasswordCheckOk" method="post" name="frm" id="frm">
							<div class="card-title text-left" id="MypageH6">
								<h5>비밀번호 재확인</h5>
							</div>
							<div>
								<span>회원님의 소중한 정보보호를 위해 비밀번호를 재확인하고 있습니다.</span>
							</div>
							<div style="margin-top: 30px; margin-bottom: 40px;">
								<hr />
							</div>
							<div class="row g-3 align-items-center" style="width: 800px;">
								<div class="col-md-6 position-relative">
									<div class="col-6">
										<span class="join-label-title">이메일</span>
										<div class="form-floating">
											<div class="form-floating mb-3">
												<input type="email" class="form-control" name="emailView"
													id="emailView" value="${memberDto.email }"
													style="--bs-border-color: #ffffff;" readonly />
													<input type="hidden" id="email" name="email" value="${memberDto.email }"/>

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
													aria-describedby="validationTooltipUsernamePrepend"
													required /> <label for="password">비밀번호</label> <input
													type="hidden" id="passwordCheckTest" name="passwordCheckTeset"
													value="${memberDto.password }" /> 
													
													
											</div>
										</div>
									</div>
								</div>

							</div>
							<hr />
							<div class="d-grid gap-2 col-12" style="height: 65px;">
								<button type="button" class="btn btn-success" id="btnNext"
									value="다음" onclick="validation()">다음</button>

							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
</body>
</html>