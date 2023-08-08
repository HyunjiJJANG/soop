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
			
			<!-- 업무 리스트 card -->
			<div class="col-md-8 ">
				<div class="card" style="left: 100px;">	
					<div class="card-header">
                        <button class="btn btn-primary col-md-12" type="button">
							<i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;새 업무 작성
						</button>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <tbody>
                                	<c:forEach var="feedListDTO" items="${feedListDTO}">
	                                    <tr>
	                                        <td width="10">
	                                        	<c:if test="${feedListDTO.task_status eq '0'}">
	                                       			<label class="badge badge-light-info">발의</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '1'}">
	                                       			<label class="badge badge-light-success">진행</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '2'}">
	                                       			<label class="badge badge-light-warning">검토</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '3'}">
	                                       			<label class="badge badge-light-secondary">완료</label>
	                                       		</c:if>
	                                       		<c:if test="${feedListDTO.task_status eq '4'}">
	                                       			<label class="badge badge-light-danger">보류</label>
	                                       		</c:if>
	                                        </td>
	                                        <td colspan="5">
	                                        	<a href="taskDetail?project_no=${pno}&member_no=${mno}&task_no=${feedListDTO.task_no}">${feedListDTO.task_title}</a>
	                                        </td>
	                                        <td width="50">
	                                        	<div class="input-group" style="width: 100px; border: 1px solid #78C2AD; border-radius: 30px;">
	                                        		<img src="${feedListDTO.profile_path}" alt="user image" class="img-radius wid-30">&nbsp;&nbsp;&nbsp;
	                                    			<span style="padding-top:3px;">${feedListDTO.name}</span>
                                    			</div>
	                                        </td>
	                                        <td width="50">${feedListDTO.task_register_date}</td>
	                                    </tr>
									</c:forEach>
                                </tbody>
                                <tfoot>
                                	<tr>
                                		<td colspan="8">
                                			<div class="row">
											    <div class="col-sm-4 col-md-4">
											        <ul class="btn-group pagination" style="margin-left: 150%;">
											            <c:if test="${pagenation.prev }">
											                <li>
											                    <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pagenation.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
											                </li>
											            </c:if>
											             <c:forEach begin="${pagenation.startPage }" end="${pagenation.endPage }" var="pageNum">
											                 <li>
											                    <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>&nbsp;&nbsp;
											                </li>
											            </c:forEach>
											            <c:if test="${pagenation.next && pagenation.endPage >0 }">
											                <li>
											                     <a href='<c:url value="/feed?project_no=${pno}&member_no=${mno}&page=${pagenation.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
											                </li>
											             </c:if>
											        </ul>
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