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
			<td>${dto.task_no}</td>
			<td>${dto.project_no}</td>
			<td>${dto.member_no}</td>
			<td>${dto.task_title}</td>
			<td>${dto.task_register_date}</td>
			<td>${dto.task_content}</td>
			<td>${dto.task_status}</td>
			<td>${dto.task_start_date}</td>
			<td>${dto.task_end_date}</td>
		</tr>
		</c:forEach>
		</table>
</div>  
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  업무 생성
</button>

<!-- Modal -->
<!-- 일단 업무 생성 구현 용으로 project_no와 member_no을 임의로 지정 -->
<form action="insert?project_no=1&member_no=1" method="post">
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
				<td><input class="form-control" id="taskName" type="text" name="task_title"></td>
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
				<input type="text" id="from" name="task_start_date">
				&nbsp; &nbsp;
				<label for="to">마감일</label>
				<input type="text" id="to" name="task_end_date">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
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


</body>
</html>