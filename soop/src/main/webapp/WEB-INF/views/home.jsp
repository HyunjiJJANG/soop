<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : SOOP</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/memo.css">
<script src="https://kit.fontawesome.com/a613319909.js"	crossorigin="anonymous"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<title>::: SOOP :::</title>
<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />

<!-- Favicon icon -->
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="assets/css/style.css">
</head>
	<!-- 대시보드 일정(캘린더) -->
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	// aspectRatio: 1.35, // 가로 세로 비율(창크기 바뀔때 비율유지됨)
          	initialView: 'dayGridMonth',
          	events: [
                {
                  title: '프로젝트1',
                  start: '2023-07-01',
                  end: '2023-07-05',
                },
                {
                  title: '프로젝트2',
                  start: '2023-07-17',
                  end: '2023-07-20',   
            }],
        });
        calendar.render(); // 달력을 띄워 주는 메뉴
      });
    </script>
<body>
	
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  <script>
  /* Range Calender */
  $( function() {
	  	/* dateFormat mm/dd/yy에서 수정함 */
	    var dateFormat = "yy/mm/dd",
	      from = $( "#projectStartDate" ).datepicker({
	          changeMonth: true,
	          numberOfMonths: 1
	      })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#projectEndDate" ).datepicker({
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }	 
	      return date;
	    }
	    
	    
	    
	    
	    
	    
	  } );

  </script>
</head>
<body class="">
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar  ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div ">
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption"><label>모아보기</label></li>
					<li class="nav-item">
						<a href="#" class="nav-link ">
							<span class="pcoded-micon"><i class="feather icon-home"></i></span>
							<span class="pcoded-mtext">홈</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-clock-rotate-left"></i></span>
							<span class="pcoded-mtext">히스토리</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-calendar-days"></i></span>
							<span class="pcoded-mtext">일정</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-list-ul"></i></span>
							<span class="pcoded-mtext">내 할 일</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="faq" class="nav-link ">
							<span class="pcoded-micon"><i class="fa-solid fa-phone-volume"></i></span>
							<span class="pcoded-mtext">고객센터</span>
						</a>
					</li>
					<li class="nav-item pcoded-menu-caption"><label>프로젝트</label></li>
					<li class="nav-item">
						<a href="#">
							<span class="pcoded-micon"><i class="fa-solid fa-circle-plus" data-bs-toggle="modal" data-bs-target="#Modal"></i></span>
							<span class="pcoded-mtext">프로젝트 생성</span>
						</a>
					</li>
					
					<!-- 프로젝트 리스트가 들어갈 곳(리스트가 많아지면 자동 스크롤 생성됨)-->
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-people-group"></i></span><span class="pcoded-mtext">전체 프로젝트</span></a>
						<ul class="pcoded-submenu">
							<li><a href="bc_alert.html">프로젝트1</a></li>
							<li><a href="bc_button.html">프로젝트2</a></li>
							<li><a href="bc_badges.html">프로젝트1</a></li>
							<li><a href="bc_breadcrumb-pagination.html">프로젝트2</a></li>
							<li><a href="bc_card.html">프로젝트1</a></li>
							<li><a href="bc_collapse.html">프로젝트2</a></li>
							<li><a href="bc_carousel.html">프로젝트2</a></li>
							<li><a href="bc_grid.html">프로젝트1</a></li>
							<li><a href="bc_progress.html">프로젝트2</a></li>
							<li><a href="bc_modal.html">프로젝트1</a></li>
							<li><a href="bc_spinner.html">프로젝트2</a></li>
							<li><a href="bc_tabs.html">프로젝트1</a></li>
							<li><a href="bc_typography.html">프로젝트2</a></li>
							<li><a href="bc_tooltip-popover.html">프로젝트1</a></li>
							<li><a href="bc_toasts.html">프로젝트2</a></li>
							<li><a href="bc_extra.html">프로젝트1</a></li>
						</ul>
					</li>
<!-- 					<div class="scrollbar" style="overflow-y: auto; height: 300px;">
						<li class="nav-item">
							<a href="#">
								<span class="pcoded-micon"><i class="fa-regular fa-file" style="color: #707272;"></i></span>
								<span class="pcoded-mtext">프로젝트1</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="#">
								<span class="pcoded-micon"><i class="fa-regular fa-file" style="color: #707272;"></i></span>
								<span class="pcoded-mtext">프로젝트2</span>
							</a>
						</li>

					</div> -->
					
					<br><br>
					

				</ul>
			</div>
		</div>
	</nav>
	
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header	class="navbar pcoded-header navbar-expand-lg navbar-light header-dark">
		<div class="m-header">
			<a href="#!" class="b-brand"> <!-- ========   change your logo hear   ============ -->
				<img src="assets/images/logo.png" alt="" class="logo">
				<img src="assets/images/logo-icon.png" alt="" class="logo-thumb">
			</a> 
			<a href="#!" class="mob-toggler"> 
				<i class="feather icon-more-vertical"></i>
			</a>
		</div>
		<div class="collapse navbar-collapse" style="padding-left: 20px;">
			<h4 style="width: 500px;">홍길동님 환영합니다&nbsp;<span class="pcoded-micon"><i class="fa-regular fa-face-smile"></i></span></h4>
		</div>
		<div class="collapse navbar-collapse" style="padding-left: 200px;">
			<h6 style="width: 700px;" align="right">2023년 7월 21일 금요일</h6>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li>
					<div class="dropdown">
						<a class="dropdown-toggle" href="#" data-toggle="dropdown">
							<i class="icon feather icon-bell"></i>
							<span class="badge badge-pill badge-danger">5</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right notification">
							<div class="noti-head">
								<h6 class="d-inline-block m-b-0">알림</h6>
								<div class="float-right">
									<a href="#!">읽음 처리</a>
								</div>
							</div>
							<ul class="noti-body">
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-1.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>John Doe</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>5 min</span>
											</p>
											<p>New ticket Added</p>
										</div>
									</div>
								</li>
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-2.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Joseph William</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>10 min</span>
											</p>
											<p>Prchace New Theme and make payment</p>
										</div>
									</div>
								</li>
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-1.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Sara Soudein</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>12 min</span>
											</p>
											<p>currently login</p>
										</div>
									</div>
								</li>
								<li class="notification">
									<div class="media">
										<img class="img-radius" src="assets/images/user/avatar-2.jpg"
											alt="Generic placeholder image">
										<div class="media-body">
											<p>
												<strong>Joseph William</strong>
												<span class="n-time text-muted"><i class="icon feather icon-clock m-r-10"></i>30 min</span>
											</p>
											<p>Prchace New Theme and make payment</p>
										</div>
									</div>
								</li>
							</ul>
							<div class="noti-footer">
								<a href="#!">모든 히스토리 보기</a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown drp-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="feather icon-user"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right profile-notification">
							<div class="pro-head">
								<img src="assets/images/user/avatar-1.jpg" class="img-radius" alt="User-Profile-Image">
								<span>John Doe</span>
							</div>
							<ul class="pro-body">
								<li>
									<a href="user-profile.html" class="dropdown-item">
										<i class="feather icon-user" style="color: #707272;"></i>마이페이지
									</a>
								</li>
								<li>
									<a href="email_inbox.html" class="dropdown-item">
										<i class="fa-regular fa-address-book" style="color: #707272;"></i>주소록
									</a>
								</li>
								<li>
									<a href="auth-signin.html" class="dropdown-item">
										<i class="feather icon-log-out" style="color: #707272;"></i>로그아웃
									</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</header>
	<!-- [ Header ] end -->
	
	<!-- Required Js -->
	<script src="assets/js/vendor-all.min.js"></script>
	<script src="assets/js/plugins/bootstrap.min.js"></script>
	<script src="assets/js/pcoded.min.js"></script>

	<!-- Modal -->
	<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="ModalLabel">새 프로젝트 생성</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="#" method="post">
					<div class="modal-body">
						<table class="table">
							<tr>
								<td>프로젝트 이름</td>
								<td colspan="2"><input type="text" class="form-control" id="projectName"></td>
							</tr>
							<tr>
								<td>프로젝트 기간</td>
								<td><input type="text" class="form-control" id="projectStartDate" name="projectStartDate" placeholder="시작일"></td>
								<td><input type="text" class="form-control" id="projectEndDate" name="projectEndDate" placeholder="종료일"></td>
							</tr>
							<tr>
								<td>프로젝트 설명</td>
								<td colspan="2"><textarea class="form-control" name="projectContent" id="projectContent" rows="5"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="프로젝트 생성">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

	<!-- [ Main Content ] start -->
	<!-- 왼쪽 네비바(삭제금지) -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
		<div class="row">
		<!-- 참여 중인 프로젝트 -->
            <div class="col-xl-5 col-md-12">
                <div class="card table-card"  style="height:370px;">
                    <div class="card-header">
                        <h5>참여 중인 프로젝트</h5>
                                <select style="width:30%;float:right;" class="form-select" aria-label="Default select example">
								<option selected>진행상황</option>
								<option value="1">진행중</option>
								<option value="2">보류</option>
								<option value="3">완료</option>
							</select>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                        <div class="scrollbar" style="overflow-y: auto; height: 300px;">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th colspan="2">프로젝트명</th>
                                        <th >프로젝트 기간</th>
                                        <th >진행상황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[중앙HTA] SOOP 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/21 ~ 23/7/23</td>
                                        <td><label class="badge badge-light-danger">보류</label></td>
                                    </tr>
                                    <tr>
                                        <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[까까오똑] KAKA 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/21 ~ 23/8/23</td>
                                        <td><label class="badge badge-light-primary">완료</label></td>
                                    </tr>
                                    <tr>
                                      <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/31 ~ 23/8/23</td>
                                        <td><label class="badge badge-light-success">진행중</label></td>
                                    </tr>
                                    <tr>
                                      <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/31 ~ 23/8/23</td>
                                        <td><label class="badge badge-light-success">진행중</label></td>
                                    </tr>
                                    <tr>
                                      <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/31 ~ 23/8/23</td>
                                        <td><label class="badge badge-light-success">진행중</label></td>
                                    </tr>
                                    <tr>
                                      <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>23/7/31 ~ 23/8/23</td>
                                        <td><label class="badge badge-light-success">진행중</label></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
     		<!-- 파일함 -->
            <div class="col-xl-4 col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>파일함</h5>
							<select style="width:30%;" class="form-select" aria-label="Default select example">
								<option selected>프로젝트 선택</option>
								<option value="1">프로젝트1</option>
								<option value="2">프로젝트2</option>
								<option value="3">프로젝트3</option>
							</select>
                        <button type="button" style="float:right;" class="btn btn-primary btn-sm"><i class="fa-solid fa-download" style="color: #fff;"></i>&nbsp;&nbsp;다운로드</button>
						</div>
					<!-- 파일함 리스트가 들어갈 곳(리스트가 많아지면 자동 스크롤 생성됨)-->
					<div class="scrollbar" style="overflow-y: auto; height: 300px;">	
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                  <tbody>
                                    <tr>
                                        <td>
                                            <div class="chk-option">
                                                <label class="check-task custom-control custom-radio d-flex justify-content-center done-task">
                                                    <input  type="radio" name="options" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <div class="d-inline-block align-middle">
                                                <img src="assets/images/user/avatar-4.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>파일명</h6>
                                                    <span class="text-muted m-b-0">파일크기 : 000KB</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="text-muted m-b-0">업로드한 날짜 : 2023/07/24</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="chk-option">
                                                <label class="check-task custom-control custom-radio d-flex justify-content-center done-task">
                                                    <input type="radio" name="options" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <div class="d-inline-block align-middle">
                                                <img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>파일명2</h6>
                                                    <span class="text-muted m-b-0">파일크기 : 000KB</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="text-muted m-b-0">업로드한 날짜 : 2023/07/24</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="chk-option">
                                                <label class="check-task custom-control custom-radio d-flex justify-content-center done-task">
                                                    <input  type="radio" name="options" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <div class="d-inline-block align-middle">
                                                <img src="assets/images/user/avatar-3.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                                <div class="d-inline-block">
                                                    <h6>파일명3</h6>
                                                    <span class="text-muted m-b-0">파일크기 : 000KB</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="text-muted m-b-0">업로드한 날짜 : 2023/07/24</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="chk-option">
                                                <label class="check-task custom-control custom-radio d-flex justify-content-center done-task">
                                                    <input type="radio" name="options" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <div class="d-inline-block align-middle">
                                                <img src="assets/images/user/avatar-2.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                                  <div class="d-inline-block">
                                                    <h6>파일명4</h6>
                                                    <span class="text-muted m-b-0">파일크기 : 000KB</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="text-muted m-b-0">업로드한 날짜 : 2023/07/24</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td>
                                            <div class="chk-option">
                                                <label class="check-task custom-control custom-radio d-flex justify-content-center done-task">
                                                    <input  type="radio" name="options" class="custom-control-input">
                                                    <span class="custom-control-label"></span>
                                                </label>
                                            </div>
                                            <div class="d-inline-block align-middle">
                                                <img src="assets/images/user/avatar-3.jpg" alt="user image" class="img-radius wid-40 align-top m-r-15">
                                                 <div class="d-inline-block">
                                                    <h6>파일명6</h6>
                                                    <span class="text-muted m-b-0">파일크기 : 000KB</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span class="text-muted m-b-0">업로드한 날짜 : 2023/07/24</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <!-- 메모 start -->
            <div class="col-xl-3 col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>메모</h5>
                    </div>
                    <!-- 포스트잇 start -->
						<div class="postbody">
							<div class="outline">
									<textarea class="memo_content" name="memo_content" id="memo_content" placeholder="메모를 입력해주세요" >${memoMemberDTO.memo_content}</textarea>
							</div>
						</div>
					<!-- 포스트잇 end -->

					</div>
            </div> 
            <!-- 메모 end -->
            
			<!-- 캘린더 start -->
            <div class="col-xl-6 col-md-12">
                <div class="card table-card" style="height:730px;">
                    <div class="card-header">
                        <h5>캘린더</h5>
							<div class="card-header-right">
								<button type="button" class="btn btn-primary btn-sm"><i class="fa-regular fa-pen-to-square" style="color: #fff; "></i>&nbsp;&nbsp;일정추가</button>
							</div>
						</div>
                    <div id="calendar" style="float:left; padding-left: 10px; padding-right: 10px;"></div>
                </div>
            </div>   
            <!-- 캘린더 end -->   
                    
   			<!-- 관심업무 start -->
           <div class="col-xl-6 col-md-12">
                <div class="card table-card">
                    <div class="card-header">
                        <h5>관심업무</h5>
                    </div>
                    
                        <div class="card-body p-0">
                        <div class="table-responsive">
                        <!-- 관심업무 리스트가 들어갈곳(리스트가 많아지면 자동 스크롤 생성됨) -->
                            <div class="scrollbar" style="overflow-y: auto; height: 300px;">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th class="stiky"></th>
                                        <th class="stiky">업무명</th>
                                        <th class="stiky">프로젝트명</th>
                                        <th class="stiky">진행상황</th>
                                    </tr>
                                </thead>
                        			
                                <tbody>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[보완] 랜딩페이지 개선</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[중앙HTA] SOOP 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[신규기능] 로그인 프로세스 개선</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[까까오똑] KAKA 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[로고] 이미지 시안</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[로고] 이미지 시안</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[로고] 이미지 시안</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #1ABC9C;"></i>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[로고] 이미지 시안</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>[네이바] NAVE 프로젝트</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        	<label class="badge badge-light-success">진행중</label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                              </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    <!-- 관심업무 end -->
                    
		</div>
	</div> 
</div>
<!-- [ Main Content ] end -->

</body>
</html>