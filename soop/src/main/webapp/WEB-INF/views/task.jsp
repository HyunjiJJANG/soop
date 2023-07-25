<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:th="http://www.thymeleaf.org">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Datepicker - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
// Range Calender (생성)
  $( function() {
	    var dateFormat = "yyyy-MM-dd",
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        })
	        //,
	        
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
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
<script>
// Range Calender (수정)
  $( function() {
	    var dateFormat = "yyyy-MM-dd",
	    startvalue = $( "#startvalue" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to2.datepicker( "option", "minDate", getDate( this ) );
	        })
	        //,
	        
	      endvalue = $( "#endvalue" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from2.datepicker( "option", "maxDate", getDate( this ) );	        
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

<style>
	#tb{
		text-align:center;
	}
</style>

</head>
<body>
	<h2>test page - main</h2>
<div class="container">
	<br /><br />
	<h2>list</h2>
	<br /><br />
	<!-- 업무 생성 모달 버튼 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal">
	  업무 생성
	</button>
	<table class="table">
	<tr>	
	<td colspan="8">	
		<!-- <a href="write" class="btn btn-outline-primary" id="btn"/>작성</a> -->
	</td>
	</tr>
		<tr>
			<th>task_no</th>
			<th>project_no</th>
			<th>member_no</th>
			<th>task_title</th>
			<th>task_register_date</th>
			<th>task_content</th>
			<th>task_status</th>
			<th>task_start_date</th>
			<th>task_end_date</th>
		</tr>
		<c:forEach var="dto"  items="${list }">
		<tr>
			<td>${dto.task_no}</td>
			<td>${dto.project_no}</td>
			<td>${dto.member_no}</td>
			<td>${dto.task_title}</td>
			<td>${dto.task_register_date}</td>
			<td>${dto.task_content}</td>
			<td>${dto.task_status}</td>
			<td>${dto.task_start_date}</td>
			<td>${dto.task_end_date}</td>
			<td>
					<!-- 수정 모달 버튼 -->
					<button type="button" class="btn cmodel-btn btn-primary" data-no="${dto.task_no}" data-title="${dto.task_title}" data-content="${dto.task_content}" data-status="${dto.task_status}" data-start="${dto.task_start_date}" data-end="${dto.task_end_date}" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button>
					<a href="delete?task_no=${dto.task_no}"><input type="button" value="삭제" class="btn btn-outline-danger" id="btn"/></a>	
			</td>
		</tr>
		</c:forEach>
		</table>
</div>  

<!-- 업무 생성 모달 -->
<!-- 일단 업무 생성 구현 용으로 project_no와 member_no을 임의로 지정 -->
<form action="insert?project_no=1&member_no=1" method="post">
<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="insertModalLabel">업무 생성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<table class="table">
			<tr>
				<td colspan="8">업무 제목</td>
				<td><input class="form-control" id="taskName" type="text" name="task_title"></td>
				<br />
			</tr>
			<tr><td colspan="8">업무 상태	&nbsp; &nbsp;
						<td>
						<select name="task_status"id="task_status" class="form-select" aria-label="Default select example">
							<option selected>------업무 상태 선택-----</option>
							<option value="0">발의됨</option>
							<option value="1">진행중</option>
							<option value="2">일시중지</option>
							<option value="3">완료</option>
						</td>
			</td></tr>
			<tr>
				<table class="table" id="tb" >
				<p>결재 라인</p>
					<tr>
						<th>1단계</th>
						<th>2단계</th>
						<th>3단계</th>
					</tr>
					<tr>
						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th>
					</tr>
				</table>
				<br />
			</tr>
			<tr>
				<!-- Calender -->
				<label for="from">시작일</label>&nbsp; &nbsp;
				<input type="text" id="from" name="task_start_date">
				&nbsp; &nbsp;
				<label for="to">마감일</label>&nbsp; &nbsp;
				<input type="text" id="to" name="task_end_date">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				<!-- 첨부파일 버튼 -->
				<button type="button" class="btn btn-outline-secondary">첨부파일</button>
			</tr>
			<tr>
				<br />
				<br />
				<td>업무 내용</td>
				<br />
				<br />
				<td><textarea class="form-control" id="taskContext" rows="10" name="task_content"></textarea></td>
			</tr>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">업무 생성</button>
      </div>
    </div>
  </div>
</div>
</form>


<!-- 업무 수정 모달 -->
<form action="update" method="post">
<input type="hidden" id="tasknovalue" name="task_no"  />
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="updateModalLabel">업무 수정</h1>
       <!--  <h1><input type="text" id="hvalue2" name="task_no"  /></h1> -->
		<!-- <p>task_title : <input type="text" id="titlevalue" name="task_title"  /></p> -->
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<table class="table">
			<tr>
				<td colspan="8">업무 제목</td>
				<td><input class="form-control" id="titlevalue" type="text" name="task_title"></td>
				<br />
			</tr>
			<tr><td colspan="8">업무 상태	&nbsp; &nbsp;
				<td>
				<select name="task_status" id="statusvalue" class="form-select" aria-label="Default select example">
					<option selected>------업무 상태 선택-----</option>
					<option value="0">발의됨</option>
					<option value="1">진행중</option>
					<option value="2">일시중지</option>
					<option value="3">완료</option>
				</td>
			</td></tr>
			<tr>
			<tr>
				<table class="table" id="tb" >
				<p>결재 라인</p>
					<tr>
						<th>1단계</th>
						<th>2단계</th>
						<th>3단계</th>
					</tr>
					<tr>
						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th>
					</tr>
				</table>
				<br />
			</tr>
			<tr>
				<!-- Calender -->
				<label for="from2">시작일</label>&nbsp; &nbsp;
				<input type="text" id="startvalue" name="task_start_date">
				&nbsp; &nbsp;
				<label for="to2">마감일</label>&nbsp; &nbsp;
				<input type="text" id="endvalue" name="task_end_date">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				<!-- 첨부파일 버튼 -->
				<button type="button" class="btn btn-outline-secondary">첨부파일</button>
			</tr>
			<tr>
				<br />
				<br />
				<td>업무 내용</td>
				<br />
				<br />
				<td><textarea class="form-control" id="contentvalue" rows="10" name="task_content" ></textarea></td>
			</tr>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">업무 수정</button>
      </div>
    </div>
  </div>
</div>
</form>

<!-- 수정 모달에 데이터 값 넘기기 -->
<script>
	$(document).ready(function(){
	  $("#cmodal_btn").click(function(){ // cmodal_btn 버튼을 클릭하면 아래(updateModal) 실행
	    $("#updateModal").modal(); 
	    
	  });
	  
	$("#updateModal").on('show.bs.modal', function(e){ // #updateModal 실행해서 모달 창 보이면 function(e)실행
		console.dir(e.relatedTarget); // e의 값 확인
		var no = $(e.relatedTarget).data().no; // e의 no라는 데이터를 no라는 변수에 대입
		var title = $(e.relatedTarget).data().title;
		var content = $(e.relatedTarget).data().content;
		var status = $(e.relatedTarget).data().status;
		var start = $(e.relatedTarget).data().start;
		var end = $(e.relatedTarget).data().end;
		console.log(no);
		
		$("#tasknovalue").val(no); // #tasknovalue값(수정 모달에서 사용)에 no 밸류 넣기
		$("#titlevalue").val(title);
		$("#contentvalue").val(content);
		$("#statusvalue").val(status);
		$("#startvalue").val(start);
		$("#endvalue").val(end);
	/* 	$("#hvalue2").val(no); */
		
	 });
	  
	});
</script>


</body>
</html>