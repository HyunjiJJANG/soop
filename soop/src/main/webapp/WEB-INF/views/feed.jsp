<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<title>FEED : SOOP</title>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/a613319909.js"	crossorigin="anonymous"></script>
<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- jQuery & bootstrap -->
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script> -->

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	const exampleModal = document.getElementById("exampleModal")
	if (exampleModal) {
	  exampleModal.addEventListener("show.bs.modal", event => {
	    // Button that triggered the modal
	    const button = event.relatedTarget
	    // Extract info from data-bs-* attributes
	    const recipient = button.getAttribute("data-bs-whatever")
	    // If necessary, you could initiate an Ajax request here
	    // and then do the updating in a callback.
	
	    // Update the modal's content.
	    const modalTitle = exampleModal.querySelector(".modal-title")
	    const modalBodyInput = exampleModal.querySelector(".modal-body input")
	
	    modalTitle.textContent = `New message to ${recipient}`
	    modalBodyInput.value = recipient
	  })
	}
	
	$(function() {
		$("#invitationEmail").on(
				"keyup",
				function() {
					$.ajax({
						type : "GET",
						url : "/emailCheck",
						data : {
							"invitationEmail" : $("#invitationEmail").val().trim()
						},
						dataType : "text",
						success : function(result) {
							var resp = result.trim();
							if (resp == "OK") {
								$("#idCheck").html("사용가능한 아이디입니다.").css(
										"color", "blue");
								$("#btnMailCheck").show();
							} else if($("#invitationEmail").val().trim() == ""){
								$("#idCheck").hide();
								$("#btnMailCheck").hide();
								
							}else {
								$("#idCheck").html("이미 초대된 파트너입니다.").css(
										"color", "red");
								$("#btnMailCheck").hide();
							}
						}
					});
				});

	// 인증메일 비동기화 방식으로 보내기
		/* $("#invitationEmail").on("click", function() {// 메일 입력 유효성 검사
			var invitationEmail = $("#invitationEmail").val(); //사용자의 이메일 입력값

			if (invitationEmail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {

				$.ajax({
					type : 'GET',
					url : '/mailCheck',
					data : {
						"invitationEmail" : $("#invitationEmail").val().trim()
					},
					dataType : 'text',

				});
				alert("인증번호가 전송되었습니다.")
				isCertification = false; //추후 인증 여부를 알기위한 값
				$("#authCodeDiv").show();
			}
		}); */
		
	})
</script>
</head>
<body class="modal-open" style="overflow: hidden; padding-right: 0px;">
	<jsp:include page="nav.jsp" />
	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ Feed navigation menu ] start -->
		    <nav class="pcoded-navbar theme-horizontal menu-light" style="position: fixed;">
		        <div class="navbar-wrapper container" style="text-align: left;">
		            <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
		                <ul class="nav pcoded-inner-navbar sidenav-inner">		                    
		                    <li class="nav-item">
		                        <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="fa-regular fa-message" style="color: #707272;"></i></span><span class="pcoded-mtext">피드</span></a>
		                    </li>
		                    <li class="nav-item pcoded-menu-caption">
		                        <label>Forms &amp; table</label>
		                    </li>
		                    <li class="nav-item">
		                        <a href="form_elements.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-file-text"></i></span><span class="pcoded-mtext">Forms</span></a>
		                    </li>
		                    <li class="nav-item">
		                        <a href="tbl_bootstrap.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-align-justify"></i></span><span class="pcoded-mtext">Bootstrap table</span></a>
		                    </li>
		                    <li class="nav-item pcoded-menu-caption">
		                    	<label>Chart & Maps</label>
		                    </li>
		                    <li class="nav-item">
		                        <a href="chart-apex.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">Chart</span></a>
		                    </li>
		                    <li class="nav-item">
		                        <a href="map-google.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Maps</span></a>
		                    </li>
		                    <li class="nav-item pcoded-menu-caption">
		                    	<label>Pages</label>
		                    </li>
		                    <li class="nav-item pcoded-hasmenu">
		                        <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
		                        <ul class="pcoded-submenu">
		                            <li><a href="auth-signup.html" target="_blank">Sign up</a></li>
		                            <li><a href="auth-signin.html" target="_blank">Sign in</a></li>
		                        </ul>
		                    </li>
		                    <li class="nav-item"><a href="sample-page.html" class="nav-link "><span class="pcoded-micon"><i class="feather icon-sidebar"></i></span><span class="pcoded-mtext">Sample page</span></a></li>
		
		                </ul>
		            </div>
		        </div>
		    </nav>
			<br /><br /><br /><br /><br /><br />
			
			<!-- 업무 피드 card -->
			<div class="col-xl-6 col-md-12">
				<div class="card table-card">
					<div class="card-header">
						<div class="d-inline-block align-middle">
							<img src="assets/images/user/avatar-4.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
							<div class="d-inline-block" style="position: absolute; top: 35%;">
								<span style="font-size: 15px; font-weight: bold;">작성자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
								<span style="font-size: 15px;"><i class="fa-regular fa-clock"></i>&nbsp;&nbsp;&nbsp;2023-07-19 15:10</span>
                             </div>
                        </div>
                        <div class="card-header-right">
	                        <div class="btn-group card-option">
	                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="feather icon-more-horizontal"></i>
	                            </button>
	                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
	                            	<li class="dropdown-item"><a href="#!"><i class="fa-regular fa-star"></i>&nbsp;&nbsp;홈 화면에 관심업무로 등록</a></li>
	                            	<li class="dropdown-item"><a href="#!"><i class="fa-solid fa-thumbtack"></i>&nbsp;&nbsp; 상단 고정</a></li>
	                                <li class="dropdown-item"><a href="#!"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;수정</a></li>
	                                <li class="dropdown-item"><a href="#!"><i class="feather icon-trash"></i>&nbsp;&nbsp;삭제</a></li>
	                            </ul>
	                        </div>
	                    </div>
                	</div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table mb-0" >
                                <thead style="border-color: transparent;">
                                    <tr>
                                        <td>
                                        	<div class="row m-b-0"><h4>업무 이름</h4></div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody style="border-color: transparent;">
                                	<tr>
                                		<td>
                                			<i class="fa-solid fa-chart-simple"></i>
                                			&nbsp;&nbsp;
											<div class="btn-group btn-group-toggle" data-toggle="buttons">
												<label class="btn btn-outline-info btn-sm active" style="border-radius: 10px;">
												<input type="radio" name="options" id="option1" checked>발의</label>
												&nbsp;&nbsp;&nbsp;
												<label class="btn btn-outline-success btn-sm" style="border-radius: 10px;">
												<input type="radio" name="options" id="option2">진행</label>
												&nbsp;&nbsp;&nbsp;
												<label class="btn btn-outline-warning btn-sm" style="border-radius: 10px;">
												<input type="radio" name="options" id="option3">검토</label>
												&nbsp;&nbsp;&nbsp;
												<label class="btn btn-outline-secondary btn-sm" style="border-radius: 10px;">
												<input type="radio" name="options" id="option4">완료</label>
												&nbsp;&nbsp;&nbsp;
												<label class="btn btn-outline-danger btn-sm" style="border-radius: 10px;">
												<input type="radio" name="options" id="option5">보류</label>
											</div>
                                		</td>
                                	</tr>
                                    <tr>
                                    	<td><i class="fa-regular fa-calendar"></i>&nbsp;&nbsp;&nbsp;&nbsp;0000/00/00부터&nbsp;&nbsp;&nbsp;0000/00/00까지</td>
                                    </tr>
                                    <tr style="border-bottom: #DEE2E6;">
                                    	<td>
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    		냉무 <br />
                                    	</td>
                                    </tr>
                                </tbody>
                                <tfoot style="border-color: transparent;">
                                	<tr>
                                		<td>
											<div class="input-group m-t-0">
												<div class="col-auto p-r-0">
													<img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40">
												</div>
												&nbsp;&nbsp;&nbsp;
												<input type="text" name="" class="form-control" id="comment" placeholder="댓글을 입력하세요.">
												<div class="input-group-append">
													<button class="btn btn-primary"><i class="fa-regular fa-paper-plane"></i></button>
												</div>
                       						</div>
                                		</td>
                                	</tr>
                                	<!-- 댓글 입력하면 여기에 append -->
                                	<tr>
                                		<td>
                                			<div class="row m-b-0">
												<div class="col-auto p-r-0">
													<img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40">
												</div>
												<div class="col">
													<p class="text-muted m-b-0">작성자&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>작성시간</p>
													<p class="m-b-0">Nice to meet you!</p>
												</div>
                       						</div>
                                		</td>
                                	</tr>
                                	<tr>
                                		<td>
                                			<div class="row m-b-0">
												<div class="col-auto p-r-0">
													<img src="assets/images/user/avatar-3.jpg" alt="user image" class="img-radius wid-40">
												</div>
												<div class="col">
													<p class="text-muted m-b-0">작성자&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>작성시간</p>
													<p class="m-b-0">Nice to meet you too!</p>
												</div>
                       						</div>
                                		</td>
                                	</tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


		<!-- buttons -->            
		<div class="col-xl-2 col-md-12" style="position: fixed; top: 150px; right: 508px;">
			<button class="btn btn-primary col-md-12" type="button" data-bs-toggle="modal" data-bs-target="#insertModal">
				<i class="fa-solid fa-pen-to-square" style="color: #fff;"></i>&nbsp;&nbsp;업무 생성
			</button> <br />
		</div>
                
		<!-- project member start -->
        <div class="col-xl-2 col-md-12" style="position: fixed; top: 200px; right: 508px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>참여자</h5>
                    <div class="card-header-right">
                        <div class="btn-group card-option">
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="feather icon-more-horizontal"></i>
                            </button>
                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                                <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
                                <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
                                <li class="dropdown-item reload-card"><a href="#!"><i class="feather icon-refresh-cw"></i> reload</a></li>
                                <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i> remove</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-inline-block align-middle">
                                            <img src="assets/images/user/avatar-4.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                            <div class="d-inline-block">
                                                <h6>John Deo</h6>
                                                <p class="text-muted m-b-0">프로젝트 매니저</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-inline-block align-middle">
                                            <img src="assets/images/user/avatar-4.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                            <div class="d-inline-block">
                                                <h6>John Deo</h6>
                                                <p class="text-muted m-b-0">프로젝트 멤버</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                            	<tr>
                            		<td style="text-align: center;">
                            			<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"><i class="fa-solid fa-user-plus" style="color:#78C2AD"></i>&nbsp;&nbsp;새 멤버 초대</a>
                            		</td>
                            	</tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>


		<!-- chatting -->
		<div class="col-lg-3 col-md-30" style="position: fixed; top: 150px; right: 20px;">
                <div class="card chat-card">
                    <div class="card-header">
                        <h5>대화</h5>
                        <div class="card-header-right">
                            <div class="btn-group card-option">
                                <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="feather icon-more-horizontal"></i>
                                </button>
                                <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-item full-card"><a href="#!"><span><i class="feather icon-maximize"></i> maximize</span><span style="display:none"><i class="feather icon-minimize"></i> Restore</span></a></li>
                                    <li class="dropdown-item minimize-card"><a href="#!"><span><i class="feather icon-minus"></i> collapse</span><span style="display:none"><i class="feather icon-plus"></i> expand</span></a></li>
                                    <li class="dropdown-item reload-card"><a href="#!"><i class="feather icon-refresh-cw"></i> reload</a></li>
                                    <li class="dropdown-item close-card"><a href="#!"><i class="feather icon-trash"></i> remove</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row m-b-20 received-chat">
                            <div class="col-auto p-r-0">
                                <img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40">
                            </div>
                            <div class="col">
                                <div class="msg">
                                    <p class="m-b-0">Nice to meet you!</p>
                                </div>
                                <p class="text-muted m-b-0"><i class="fa fa-clock-o m-r-10"></i>10:20am</p>
                            </div>
                        </div>
                        <div class="row m-b-20 send-chat">
                            <div class="col">
                                <div class="msg">
                                    <p class="m-b-0">Nice to meet you!</p>
                                </div>
                                <p class="text-muted m-b-0"><i class="fa fa-clock-o m-r-10"></i>10:20am</p>
                            </div>
                            <div class="col-auto p-l-0">
                                <img src="assets/images/user/avatar-3.jpg" alt="user image" class="img-radius wid-40">
                            </div>
                        </div>
                        <div class="row m-b-20 received-chat">
                            <div class="col-auto p-r-0">
                                <img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40">
                            </div>
                            <div class="col">
                                <div class="msg">
                                    <p class="m-b-0">Nice to meet you!</p>
                                    <img src="assets/images/widget/dashborad-1.jpg" alt="">
                                    <img src="assets/images/widget/dashborad-3.jpg" alt="">
                                </div>
                                <p class="text-muted m-b-0"><i class="fa fa-clock-o m-r-10"></i>10:20am</p>
                            </div>
                        </div>
                        <div class="input-group m-t-15">
                            <input type="text" name="task-insert" class="form-control" id="Project" placeholder="Send message">
                            <div class="input-group-append">
                                <button class="btn btn-primary">
                                    <i class="feather icon-message-circle"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
		
		
		</div>

	</div>
	</div>
	
	<!-- 새 멤버 추가 modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">파트너 초대하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">초대할 이메일</label>
            <input type="text" class="form-control" id="invitationEmail"  placeholder="example@soop.team">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">초대내용 입력</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnInvitation">파트너 초대하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>