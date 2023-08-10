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
		$("#email").on(
				"keyup",
				function() {
					$.ajax({
						type : "GET",
						url : "/emailCheck2",
						data : {
							"email" : $("#email").val().trim(),
							"project_no" : $("#project_no").val().trim()
						},
						dataType : "json",
						success : function(list) {
							console.log(list);	
							$("#btnInvitation").attr("disabled", false);
							$("#idCheck").html("");
							for(i=0; i<list.length; i++){
								if( list[i] == 1) { // 이미 초대되었으면
									console.log("이미 초대 성공");
									$("#idCheck").html("<span class='form-text' style='color: red;'>이미 초대된 파트너입니다.</span>");
									$("#btnInvitation").attr("disabled", true);
									break;
								}
							}
						}
					});
				});
	
	// 파트너 초대 메일 비동기화 방식으로 보내기
		$("#btnInvitation").on("click", function() {// 메일 입력 유효성 검사
			var email = $("#email").val(); //사용자의 이메일 입력값
			
			// 초대내용 엔터 반영되게
			var inviteMessage = $("#inviteMessage").val(); 
			inviteMessage = inviteMessage.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			if (email == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} else {
				$.ajax({
					type : "GET",
					url : "/invite",
					data : {
						"email" : $("#email").val().trim(),
						"name" : $("#name").val().trim(),
						"inviteMessage" : inviteMessage,
						"project_no": $("#project_no").val().trim()
					},
					dataType : 'text'
					
				});
				alert("초대링크가 전송되었습니다.")
				isCertification = false; //추후 인증 여부를 알기위한 값
				
				// 파트너 초대하기 버튼클릭후 초대이메일/초대내용 빈 내용으로 초기화
				$("#email").val("");
				$("#inviteMessage").val("");
			}
		});
		
	})
	
	$(function(){
	// 멤버 강퇴
		$("#deleteMember").on("click", function(){
			$(".deleteBtn").fadeIn(50);
			$(".changeBtn").fadeOut(50);
		});
	// 관리자 권한 변경
		$("#changeAuth").on("click", function(){
			$(".changeBtn").fadeIn(50);
			$(".deleteBtn").fadeOut(50);
		});
		
	// 새로고침(초기화)
		$("#refreshBtn").on("click", function(){
			$(".changeBtn").fadeOut(50);
			$(".deleteBtn").fadeOut(50);
		});	
	});
	
	// 멤버 강퇴하기
	function deleteMember(project_no, member_no){
		if(confirm("정말 강퇴하시겠습니까?")== true){
			
			const urlParams = new URL(location.href).searchParams;
			const loginMember_no = urlParams.get("member_no");
			
			$.ajax({
				type: "GET",
				url: "/deleteMemberOne",
				data: {
					"project_no" : project_no,
					"member_no" :  member_no
				},
				success: function (data) {
		            console.log(data); 
					location.href = "feed?project_no="+project_no+"&member_no="+loginMember_no;
		        }
			});
		}
	}
	
	// 프로젝트 관리자 변경
	function changeAuth(project_no, member_no){
		if(confirm("정말 변경하시겠습니까?")== true){
			const urlParams = new URL(location.href).searchParams;
			const adminMember_no = urlParams.get("member_no");
			
			$.ajax({
				type: "GET",
				url: "/changeAuthMember",
				data: {
					"project_no" : project_no,
					"member_no" :  member_no
				},
				success: function (data) {
		            console.log(data); 
					location.href = "feed?project_no="+project_no+"&member_no="+adminMember_no;
		        }
			});
		}
	}
</script>

</head>
<body class="modal-open" style="overflow: hidden; padding-right: 0px;">
	<jsp:include page="nav.jsp" />
	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ Feed navigation menu ] start -->
		    <nav class="pcoded-navbar theme-horizontal menu-light" style="position: fixed; height:100px;">
		        <div class="navbar-wrapper container">
		            <div class="navbar-content sidenav-horizontal" id="layout-sidenav">
		                <table>
                         <tr>
                             <td> 
                             <ul class="nav pcoded-inner-navbar sidenav-inner">
                             <li class="nav-item">
                             <span class="pcoded-mtext" style="padding-top: 15px; font-size: 20px;">${projectDTO.project_title}</span>
                           </li>
                           </ul>
                           </td>
                        </tr>
                     <tr>
                      <td>
                     <ul class="nav pcoded-inner-navbar sidenav-inner">
                    
                          <li class="nav-item">
                              <a href="index.html" class="nav-link "><span class="pcoded-micon"><i class="fa-regular fa-message" style="color: #707272;"></i></span><span class="pcoded-mtext">피드</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="form_elements.html" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-calendar-days"></i></span><span class="pcoded-mtext">일정</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="tbl_bootstrap.html" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span><span class="pcoded-mtext">할일</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="chart-apex.html" class="nav-link "><span class="pcoded-micon"><i class="fa-regular fa-address-book"></i></span><span class="pcoded-mtext">주소록</span></a>
                          </li>
                          <li class="nav-item">
                              <a href="map-google.html" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-file-arrow-down"></i></span><span class="pcoded-mtext">첨부파일</span></a>
                          </li>

                      </ul>
                  </td>
                      
                      </tr>
                      </table>
		            </div>
		        </div>
		    </nav>
			<br /><br /><br /><br /><br /><br /><br /><br />
			
			<!-- 업무 피드 card -->
			<div class="col-xl-6 col-md-12">
				<div class="card table-card" style="left: 200px;">
					<div class="card-header">
						<div class="d-inline-block align-middle">
							<img src="${feedTaskDTO.profile_path}" alt="user image" class="img-radius wid-40 align-top m-r-15">
							<div class="d-inline-block" style="position: absolute; top: 35%;">
								<span style="font-size: 15px; font-weight: bold;">${feedTaskDTO.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
								<span style="font-size: 15px;"><i class="fa-regular fa-clock"></i>&nbsp;&nbsp;&nbsp;${feedTaskDTO.task_register_date}</span>
                             </div>
                        </div>
                        <div class="card-header-right">
	                        <div class="btn-group card-option">
	                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="feather icon-more-horizontal"></i>
	                            </button>
	                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
	                            	<li class="dropdown-item"><a href="#!"><i class="fa-regular fa-star"></i>&nbsp;&nbsp;홈 화면에 관심업무로 등록</a></li>
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
                                    	<td width="10;">
                                    		<c:if test="${feedTaskDTO.task_status eq '0'}">
                                       			<label class="badge badge-light-info">발의</label>
                                       		</c:if>
                                       		<c:if test="${feedTaskDTO.task_status eq '1'}">
                                       			<label class="badge badge-light-success">진행</label>
                                       		</c:if>
                                       		<c:if test="${feedTaskDTO.task_status eq '2'}">
                                       			<label class="badge badge-light-warning">검토</label>
                                       		</c:if>
                                       		<c:if test="${feedTaskDTO.task_status eq '3'}">
                                       			<label class="badge badge-light-secondary">완료</label>
                                       		</c:if>
                                       		<c:if test="${feedTaskDTO.task_status eq '4'}">
                                       			<label class="badge badge-light-danger">보류</label>
                                       		</c:if>
                                    	</td>
                                        <td>
                                        	<div class="row m-b-0">
                                        		<input type="hidden" name="task_no" value="${feedTaskDTO.task_no}"/>
                                        		<h4>${feedTaskDTO.task_title}</h4>
                                        	</div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody style="border-color: transparent;">
                                    <tr>
                                    	<td colspan="2"><i class="fa-regular fa-calendar"></i>&nbsp;&nbsp;&nbsp;&nbsp;${feedTaskDTO.task_start_date}부터&nbsp;&nbsp;&nbsp;${feedTaskDTO.task_end_date}까지</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">
                                    		<div style="float: left;"><i class="fa-solid fa-file-signature"></i>&nbsp;&nbsp;&nbsp;</div>
											<!-- 결재 라인 보이는 곳 -->
                                   			<c:forEach var="signDTO" items="${signDTO}">
	                                    		<div class="input-group" style="width: 130px; border: 1px solid #78C2AD; border-radius: 30px; float:left; margin-right: 20px;">
	                                    			<img src="${signDTO.profile_path}" alt="user image" class="img-radius wid-30">
	                                    			<span style="padding-top:3px; padding-left:10px;">${signDTO.sign_approver}</span>&nbsp;&nbsp;&nbsp;&nbsp;
	                                    			<c:if test="${signDTO.sign_status eq '1'}">
	                                    				<span style="padding-top:3px;"><i class="fa-solid fa-user-check"></i></span>
	                                    			</c:if>
	                                    		</div>
                                   			</c:forEach>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">
                                    		<i class="fa-solid fa-file-arrow-down"></i>&nbsp;&nbsp;&nbsp;
                                    		<!-- 해당 업무 첨부파일 보이는 곳 -->
											<a href="#" class="btn btn-outline-primary btn-sm" style="border-radius: 20px;">${feedTaskDTO.file_name}.${feedTaskDTO.file_type}</a>
                                    	</td>
                                    </tr>
                                    <tr style="border-bottom: #DEE2E6;">
                                    	<td colspan="2">
                                    		${feedTaskDTO.task_content}
                                    	</td>
                                    </tr>
                                </tbody>
                                <tfoot style="border-color: transparent;">
                                	<tr>
                                		<td colspan="2">
			                                <form action="/comment/insert" name="commentInsertForm" method="post">
												<div class="input-group m-t-0">
													<input type="hidden" name="project_no" value="${pno}" />
			                                		<input type="hidden" name="task_no" value="${tno}" />
			                                		<input type="hidden" name="member_no" value="${mno}"/>
													<input type="text" name="comment_content" class="form-control" id="comment_content" placeholder="댓글을 입력하세요.">
													<div class="input-group-append">
														<button class="btn btn-primary" id="commentInsertBtn"><i class="fa-regular fa-paper-plane"></i></button>
													</div>
	                       						</div>
		                                	</form>
                                		</td>
                                	</tr>
                                	<!-- 댓글 입력하면 여기에 append -->
                                	<tr>
                                		<td colspan="2">
		        							<c:forEach var="commentDTO" items="${commentDTO}">
			                                	<tr>
			                                		<td colspan="2">
			                                			<div class="row m-b-0">
															<div class="col-auto p-r-0">
																<img src="${commentDTO.profile_path}" alt="user image" class="img-radius wid-40">
															</div>
															<div class="col">
																<c:choose>
																	<c:when test="${commentDTO.member_no eq mno}">
																		<p class="text-muted m-b-0">${commentDTO.name}&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>${commentDTO.comment_register_date}
																		<a href="comment/delete?project_no=${pno}&member_no=${mno}&task_no=${tno}&comment_no=${commentDTO.comment_no}"> 삭제 </a></p>
																	</c:when>
																	<c:otherwise>
																		<p class="text-muted m-b-0">${commentDTO.name}&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>${commentDTO.comment_register_date}</p>
																	</c:otherwise>
																</c:choose>
																<p class="m-b-0">${commentDTO.comment_content}</p>
															</div>
			                       						</div>
			                                		</td>
			                                	</tr>
			                               	</c:forEach>
                                		</td>
                                	</tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
                
		<!-- project member start -->
 		<div class="col-xl-2 col-md-12" style="position: fixed; top: 230px; right: 300px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>참여자</h5>
                    <c:choose>
	                	<c:when test="${projectMemberDTO.member_position == 0}"> 
                        <a href="" id="refreshBtn"><i class="fa-solid fa-rotate-right" style="color: #707272;"></i></a>
		                    <div class="card-header-right">
		                        <div class="btn-group card-option">
		                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                <i class="feather icon-more-horizontal"></i>
		                            </button>
		                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
		                                <li class="dropdown-item"><a id="changeAuth"><i class="feather icon-refresh-cw"></i> 프로젝트 관리자 변경</a></li>
		                                <li class="dropdown-item"><a id="deleteMember"><i class="feather icon-trash"></i> 멤버 강퇴</a></li>
		                            </ul>
		                        </div>
		                    </div>
                   		</c:when>
	               </c:choose>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <tbody>
                           		<!-- 해당 프로젝트 멤버 리스트가 보여지는 곳 -->
                                <c:forEach var="dto" items="${memberList }">
                                <tr>
                                    <td>
                                    	<c:choose>
												<c:when test="${dto.member_position == 0}">
                                                </c:when>
                                                <c:otherwise>
                                                	<div class="chk-option changeBtn" style="display:none">
														<a href="" onclick="changeAuth(${dto.project_no }, ${dto.member_no})" ><i class="fa-solid fa-circle-check" style="color: #707272;"></i></a>
													</div>
				                                    <div class="chk-option deleteBtn" style="display:none">
														<a href="" onclick="deleteMember(${dto.project_no }, ${dto.member_no})"><i class="fa-solid fa-circle-minus" style="color: #707272;"></i></a>
													</div>
                                                </c:otherwise>
                                        </c:choose>
                                        <div class="d-inline-block align-middle">
                                            <img src="${dto.profile_path}" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                            <div class="d-inline-block">
													<h6>${dto.name }</h6>
												<c:choose>
												<c:when test="${dto.member_position == 0}">
                                                	<p class="text-muted m-b-0">프로젝트 관리자</p>
                                                </c:when>
                                                <c:otherwise>
                                                	<p class="text-muted m-b-0">프로젝트 멤버</p>
                                                </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
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
            <label for="email" class="col-form-label">초대할 이메일</label>
            <input type="text" class="form-control" id="email"  placeholder="example@soop.team">
          </div>
		<div class="col-6" id="idCheck">
			
		</div>
		  <div class="mb-3">
            <label for="message" class="col-form-label">초대내용 입력</label>
            <textarea class="form-control" id="inviteMessage"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnInvitation" >파트너 초대하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>