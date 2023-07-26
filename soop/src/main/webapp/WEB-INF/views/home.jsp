<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> refs/remotes/origin/seulki
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

  // 메모 비동기 수정
  $(function(){
	  $("#memo_content").on("focusout", function(event){
		  var memo_content = $("#memo_content").val();
	  	  $.ajax({
	  		  type: "POST",
	  		  url: "/home?member_no=1",
	  		  data:{
	  			  "memo_content" : memo_content
	  		  }
	  	  })
	  })
  })
  </script>
  
</head>
<body>
	<jsp:include page="nav.jsp" />
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
                                <c:forEach var="dto" items="${list}">
                                    <tr>
                                    <c:forEach var="projectProjectMemberMemberServiceDTO" items="${projectList}">
                                        <td  colspan="2">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
<<<<<<< HEAD
                                                    <h6>${projectProjectMemberMemberDTO.project_title}</h6>
=======
                                                    <h6>${dto.project_title}</h6>
>>>>>>> refs/remotes/origin/seulki
                                                </div>
                                            </div>
                                        </td>
<<<<<<< HEAD
                                        <td>23/7/21 ~ 23/7/23</td>
                                        <td><label class="badge badge-light-danger">보류</label></td>
                                    </c:forEach>
=======
                                        <td>${dto.project_start_date} ~ ${dto.project_end_Date}</td>
                                        <td><label class="badge badge-light-primary"">${dto.project_status}</label></td>
>>>>>>> refs/remotes/origin/seulki
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
                                </c:forEach>
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
									<textarea class="memo_content" name="memo_content" id="memo_content" cols="40" rows="12" placeholder="메모를 입력해주세요" >${memoDTO.memo_content}</textarea>
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