<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME : SOOP</title>

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/memo.css">
<script src="https://kit.fontawesome.com/a613319909.js"	crossorigin="anonymous"></script>

<!-- Full Calendar -->
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

<link href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"	crossorigin="anonymous"></script>
<!-- jquery -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<script type="text/javascript">


	// 대시보드 일정(캘린더)
 	document.addEventListener("DOMContentLoaded", function() {
 		$.ajax({
 			type: "GET", 
 			url: "/home/selectStatus/"+${member_no},
 	  		data : {
 	  			"member_no" : ${member_no}
 	  		},
 			success: function(data){
 				let e = [];
 	  			for(var i=0; i<data.length; i++){
 	  				e.push(
 						{
     						title: data[i].project_title,
     						start: data[i].project_start_date,
     		                end: data[i].project_end_date
 						}
 					);
 				}
 	  			
 	  			var calendarEl = document.getElementById("calendar");
 		        var calendar = new FullCalendar.Calendar(calendarEl, {
 			          	initialView: "dayGridMonth",
 			          	events: e
 			     });
 		       
 		        calendar.render(); // 달력을 띄워 주는 메뉴

 			}// success
 		}); // ajax		
    });

	// 참여 중인 프로젝트 비동기 선택옵션
    function projectSelect(){
  	  let status = $("#projectStatusOption").val();
  	  $.ajax({
  		type: "GET",  
  		url: "/home/selectStatus/"+${member_no},
  		data : {
  			"member_no" : ${member_no}
  		},
  		dataType: "text",
  		success: function(data){
  			var obj = JSON.parse(data);
  			var text = "";
  			for(var i=0; i<obj.length; i++){
   				var txt = "<tr><td colspan='8'><div class='d-inline-block align-middle'><div class='d-inline-block'><h6>"
  						+ obj[i].project_title + 
  						"</h6></div></div></td><td>"
  						+ obj[i].project_start_date
  						+ " ~ " + obj[i].project_end_date + "</td>";
  				if(status==0 && obj[i].project_status==status){
  					text += txt + "<td><label class='badge badge-light-success'>진행중</label></td></tr>";
  				}else if(status==1 && obj[i].project_status==status){
  					text += txt + "<td><label class='badge badge-light-dark'>완료</label></td></tr>";                                      
  				}else if(status==2 && obj[i].project_status==status){
  					text += txt + "<td><label class='badge badge-light-danger'>보류</label></td></tr>"; 
  				}else if(status==3) {
  					if(obj[i].project_status==0){
  	  					text += txt + "<td><label class='badge badge-light-success'>진행중</label></td></tr>";
  	  				}
  					if(obj[i].project_status==1){
  	  					text += txt + "<td><label class='badge badge-light-dark'>완료</label></td></tr>";                                      
  	  				}
  					if(obj[i].project_status==2){
  	  					text += txt + "<td><label class='badge badge-light-danger'>보류</label></td></tr>"; 
  					}
  				}
  			}
  			$("#projectList").html(text);
  		}
  	  })
  	 }    
 
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
		  const memo_content = $("#memo_content").val();
		  $.ajax({
	  		  type: "POST",
	  		  url: "/home?member_no="+${member_no},
	  		  data:{
	  			  "memo_content" : memo_content
	  		  }
	  	  })
	  })
  })
  
  // 일정추가 버튼 클릭하면 캘린더에 나의 일정 추가
/*   $(function(){
	  $("#scheduleAdd").on("click", function(){
		  
	  })
  }) */
  
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<!-- [ Main Content ] start -->
	<br /><br />
	<div class="pcoded-main-container">
		<div class="pcoded-content">
		<div class="row">
		<!-- 참여 중인 프로젝트 -->
            <div class="col-xl-5 col-md-12">
                <div class="card table-card"  style="height:370px;">
                    <div class="card-header">
                        <h5>참여 중인 프로젝트</h5>
                            <select id="projectStatusOption" onchange="projectSelect();" style="width:30%;float:right;" class="form-select" aria-label="Default select example">
								<option value="3">전체</option>
								<option value="0">진행중</option>
								<option value="1">완료</option>
								<option value="2">보류</option>
							</select>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                        <div class="scrollbar" style="overflow-x: hidden; overflow-y: auto; height: 300px;">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th >프로젝트명</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th >프로젝트 기간</th>
                                        <th >진행상황</th>
                                    </tr>
                                </thead>
                                <tbody id="projectList">
                                <c:forEach var="dto" items="${projectList}">
                                    <tr>
                                        <td  colspan="8">
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6>${dto.project_title}</h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${dto.project_start_date} ~ ${dto.project_end_date}</td>
                                        
                                        <c:if test="${dto.project_status == 0}">
                                        	<td><label class="badge badge-light-success">진행중</label></td>                                        
                                        </c:if>
                                        <c:if test="${dto.project_status == 1}">
                                        	<td><label class="badge badge-light-dark">완료</label></td>                                        
                                        </c:if>
                                        <c:if test="${dto.project_status == 2}">
                                        	<td><label class="badge badge-light-danger">보류</label></td>                                        
                                        </c:if>
                                        
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
								<c:forEach var="dto" items="${projectList}">
									<option value="${dto.project_no}">${dto.project_title}</option>								
								</c:forEach>
							</select>
                        <button type="button" style="float:right;" class="btn btn-primary btn-sm"><i class="fa-solid fa-download" style="color: #fff;"></i>&nbsp;&nbsp;다운로드</button>
						</div>
					<!-- 파일함 리스트가 들어갈 곳(리스트가 많아지면 자동 스크롤 생성됨)-->
					<div class="scrollbar" style="overflow-x: hidden; overflow-y: auto; height: 300px;">	
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
								<textarea class="memo_content" name="memo_content" id="memo_content" placeholder="메모를 입력해주세요" >${memoDTO.memo_content}</textarea>
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
							<a href="insertProject" data-bs-toggle="modal" data-bs-target="#scheduleModal">
								<button type="button" class="btn btn-primary btn-sm scheduleAdd" ><i class="fa-regular fa-pen-to-square" style="color: #fff; "></i>&nbsp;&nbsp;일정추가</button>
							</a>
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
                        <select style="width:30%;float:right;" id="" class="form-select" aria-label="Default select example">
								<option value="4">전체</option>
								<option value="0">발의</option>
								<option value="1">진행</option>
								<option value="2">보류</option>
								<option value="3">완료</option>
						</select>
                    </div>
                    
                        <div class="card-body p-0">
                        <div class="table-responsive">
                        <!-- 관심업무 리스트가 들어갈곳(리스트가 많아지면 자동 스크롤 생성됨) -->
                            <div class="scrollbar" style="overflow-x: hidden; overflow-y: auto; height: 300px;">
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
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
                                        	<label class="badge badge-light-warning">발의</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
                                        	<label class="badge badge-light-dark">완료</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
                                        	<label class="badge badge-light-danger">보류</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
                                            <i class="fa-solid fa-star" style="color: #78C2AD;"></i>
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
<!-- Modal -->
	<div class="modal" id="scheduleModal" tabindex="-1" aria-labelledby="ModalLabel" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="ModalLabel">일정생성</h1>
					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<form action="#" method="post">
					<div class="modal-body">
						<table class="table">
							<tr>
								<td>제목</td>
								<td colspan="2"><input type="text" class="form-control" id="projectTitle"></td>
							</tr>
							<tr>
								<td>기간</td>
								<td>
									<div class="input-group">
										<input type="text" class="form-control datepicker" name="projectStartDate" id="projectStartDate" placeholder="시작일">
										<label for="projectStartDate" class="input-group-text"><i class="fa-solid fa-calendar"></i></label>	
									</div>								
								</td>
								<td>
									<div class="input-group">
										<input type="text" class="form-control" id="projectEndDate" name="projectEndDate" placeholder="종료일">
										<label for="projectStartDate" class="input-group-text"><i class="fa-solid fa-calendar"></i></label>	
									</div>	
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" id="btnCreateProject" value="일정추가">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>