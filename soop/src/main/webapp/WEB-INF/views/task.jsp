<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  // Range Calender 
  $( function() {
	    var dateFormat = "yy/mm/dd", // dateFormat mm/dd/yy에서 수정함
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 3
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 3
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
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.taskNo}</td>
			<td>${dto.projectNo}</td>
			<td>${dto.memberNo}</td>
			<td>${dto.taskTitle}</td>
			<td>
			<!-- 날짜 포맷팅 -->
			<fmt:parseDate var="dateString" 
							value="${dto.taskRegisterDate}" 
							pattern="yyyy-MM-dd HH:mm:ss" /> <!-- ~~이런 형식의 날짜를 문자로 바꿔주세요 -->
			<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/> <!-- 위에서 가져온 날짜를 이런 형식으로 출력해주세요 -->
			</td>
			<td>${dto.taskContent}</td>
			<td>
			<!-- 날짜 포맷팅 -->
			<fmt:parseDate var="dateString" 
							value="${dto.taskStartDate}" 
							pattern="yyyy-MM-dd HH:mm:ss" /> <!-- ~~이런 형식의 날짜를 문자로 바꿔주세요 -->
			<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/> <!-- 위에서 가져온 날짜를 이런 형식으로 출력해주세요 -->
			</td>
			<td>
			<!-- 날짜 포맷팅 -->
			<fmt:parseDate var="dateString" 
							value="${dto.taskEndDate}" 
							pattern="yyyy-MM-dd HH:mm:ss" /> <!-- ~~이런 형식의 날짜를 문자로 바꿔주세요 -->
			<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/> <!-- 위에서 가져온 날짜를 이런 형식으로 출력해주세요 -->
			</td>
		</tr>
		</table>
		</c:forEach>
</div>  
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  업무 생성
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">업무 생성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<table class="table">
			<tr>
				<td>업무 제목</td>
				<td><input class="form-control" id="taskName" type="text"></td>
				<br />
			</tr>
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
				<label for="from">시작일</label>
				<input type="text" id="from" name="from">
				&nbsp; &nbsp;
				<label for="to">마감일</label>
				<input type="text" id="to" name="to">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
				<button type="button" class="btn btn-outline-secondary">첨부파일</button>
					<!-- 서브 모달 (첨부파일) -->
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal2">첨부파일</button>
						
					<div class="modal fade" id="modal2" tabindex="-1" role="dialog">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">두번째 모달 창</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <p>모달 내용</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
			</tr>
			<tr>
				<br />
				<br />
				<td>업무 내용</td>
				<br />
				<br />
				<td><textarea class="form-control" id="taskContext" rows="10"></textarea></td>
			</tr>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">업무 생성</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>