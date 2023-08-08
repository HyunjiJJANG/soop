<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<br />
	<br />
	<!-- FAQ 컨테이너 -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="row">
				<div class="col-xl-12 col-md-12">
					<div class="card table-card">
						<div class="card-header">
							<h3>자주 묻는 질문</h3>
						</div>
						<div class="card-body p-0" style="height:auto;">
							<div class="table-responsive">

							<!-- 아코디언 -->
							<div class="accordion" id="accordionExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							        개인정보 변경
							      </button>
							    </h2>
							    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							        프로젝트 / 업무 생성
							      </button>
							    </h2>
							    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
							      </div>
							    </div>
							  </div>
							  <div class="accordion-item">
							    <h2 class="accordion-header">
							      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
							        멤버 초대 및 탈퇴 / 프로젝트 관리자 권한 변경
							      </button>
							    </h2>
							    <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
							      <div class="accordion-body">
							        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
							      </div>
							    </div>
							  </div>
							</div>									
							<!-- 아코디언 end -->

							</div>
						</div>
					</div>
				</div>
			<!-- FAQ 컨테이너 end -->
			</div>
		</div>
	</div>
</body>
</html>