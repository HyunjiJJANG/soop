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

<script>
	var task_no = ${tno}; //게시글 번호
	$('#commentInsertBtn').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    console.log(insertData);
	    commentInsert(insertData); //Insert 함수호출(아래)
	});
	
	//댓글 목록 
	window.onload = function commentList(){
	    $.ajax({
	        url : '/comment/list',
	        type : 'get',
	        data : {'task_no':${tno}},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	            	a += '<div class="row m-b-0"><div class="col-auto p-r-0">';
	            	a += '<img src="'+value.profile_path+'" alt="user image" class="img-radius wid-40"></div>';
	            	a += '<div class="col"><p class="text-muted m-b-0">'+value.name+'&nbsp;&nbsp;&nbsp; <i class="fa fa-clock-o m-r-10"></i>'+value.comment_register_date+'&nbsp;&nbsp;&nbsp;';
	            	a += '<a href="" onclick="commentUpdate('+value.comment_no+',\''+value.comment_content+'\');"> 수정 </a>';
	            	a += '<a href="" onclick="commentDelete('+value.comment_no+');"> 삭제 </a></p>';
	            	a += '<p class="m-b-0">'+value.comment_content+'</p></div></div>';
	            });
	            
	            $(".commentList").html(a);
	        }
	    });
	}
	
	//댓글 등록
	function commentInsert(insertData){
	    $.ajax({
	        url : '/comment/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	           
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=comment_content]').val('');
	            
	        }
	    });
	}
</script>

</head>
<body>
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
		                                    			<span style="padding-top:5px; padding-left:5px;">${signDTO.sign_approver}</span>&nbsp;&nbsp;&nbsp;&nbsp;
		                                    			<c:if test="${signDTO.sign_status eq '1'}">
		                                    				<span style="padding-top:5px;"><i class="fa-solid fa-user-check"></i></span>
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
			                                <form name="commentInsertForm">
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
		        							<div class="commentList"></div>
                                		</td>
                                	</tr>

<%--                                 	<c:forEach var="commentDTO" items="${commentDTO}">
	                                	<tr>
	                                		<td colspan="2">
	                                			<div class="row m-b-0">
													<div class="col-auto p-r-0">
														<img src="${commentDTO.profile_path}" alt="user image" class="img-radius wid-40">
													</div>
													<div class="col">
														<p class="text-muted m-b-0">${commentDTO.name}&nbsp;&nbsp;&nbsp;<i class="fa fa-clock-o m-r-10"></i>${commentDTO.comment_register_date}</p>
														<p class="m-b-0">${commentDTO.comment_content}</p>
													</div>
	                       						</div>
	                                		</td>
	                                	</tr>
                                	</c:forEach> --%>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
                
		<!-- project member start -->
        <div class="col-xl-2 col-md-12" style="position: fixed; top: 200px; right: 100px;">
            <div class="card table-card">
                <div class="card-header">
                    <h5>참여자</h5>
                    <div class="card-header-right">
                        <div class="btn-group card-option">
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="feather icon-more-horizontal"></i>
                            </button>
                            <ul class="list-unstyled card-option dropdown-menu dropdown-menu-right">
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
                            	<c:forEach var="pjmemberList" items="${pjmemberList}">
                                <tr>
                                    <td>
                                        <div class="d-inline-block align-middle">
                                            <img src="${pjmemberList.profile_path}" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                            <div class="d-inline-block">
                                                <h6>${pjmemberList.name}</h6>
                                                <c:if test="${pjmemberList.member_position eq '0'}">
	                                                <p class="text-muted m-b-0">프로젝트 관리자</p>                                                
                                                </c:if>
                                                <c:if test="${pjmemberList.member_position eq '1'}">
	                                                <p class="text-muted m-b-0">프로젝트 멤버</p>                                                
                                                </c:if>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                            	<tr>
                            		<td style="text-align: center;">
                                       <a href="#"><i class="fa-solid fa-user-plus" style="color: #1abc9c;"></i>&nbsp;&nbsp;새 멤버 초대</a>
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
</body>
</html>