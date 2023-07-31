<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
// Range calendar (생성)
  $( function() {
	    var dateFormat = "yy-mm-dd",
	      from = $( "#from" ).datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1,
	          dateFormat: dateFormat // 날짜 형식을 변경
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }).on("select", function() {
		        $(this).change();
		    });
	        
	        
	     to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1,
	        dateFormat: dateFormat // 날짜 형식을 변경
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );	        
	      }).on("select", function() {
	          $(this).change();
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
// Range calendar (수정)
  $( function() {
	    var dateFormat = "yy-mm-dd",
	    startvalue = $( "#startvalue" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1,
	          dateFormat: dateFormat // 날짜 형식을 변경
	        })
	        .on( "change", function() {
	          to2.datepicker( "option", "minDate", getDate( this ) );
	        }).on("select", function() {
		        $(this).change();
		    });
	        
	      endvalue = $( "#endvalue" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1,
	        dateFormat: dateFormat // 날짜 형식을 변경
	      })
	      .on( "change", function() {
	        from2.datepicker( "option", "maxDate", getDate( this ) );	        
	      }).on("select", function() {
		        $(this).change();
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
		var filename = $(e.relatedTarget).data().filename;
		console.log(no);
		
		$("#tasknovalue").val(no); // #tasknovalue값(수정 모달에서 사용)에 no 밸류 넣기
		$("#titlevalue").val(title);
		$("#contentvalue").val(content);
		$("#statusvalue").val(status);
		$("#startvalue").val(start);
		$("#endvalue").val(end);
		$("#filename").val(filename);
	    $("#filedto").empty(); // 이전 파일 정보를 지웁니다.
	    $("#filedto").append("<p>기존파일 : " + filename + "</p>");
		
	 });
	  
	});
</script>

<!-- 수정 모달에서 새 파일 선택했을 때, 기존 파일 보여주는 div 숨기기 -->
<script>
	function hideFileDto() {
		// "filedto" 아이디를 가진 <div> 요소를 가져옵니다
		var fileDtoDiv = document.getElementById("filedto");

		// 파일 선택 버튼의 값이 있는지 확인하여 <div> 요소를 숨기거나 표시합니다
		var fileInput = document.getElementById("fileInput");
		if (fileInput.value) {
			fileDtoDiv.style.display = "none";
		} else {
			fileDtoDiv.style.display = "block"; // 혹은 "inline" 등 원하는 디스플레이 속성을 지정할 수 있습니다.
		}
	}
</script>

<!-- 첨부 파일 크기 제한 (업무 생성 및 수정) -->
<script>
	function checkFileSize(input) {
		// 선택된 파일 객체 가져오기
		var file = input.files[0];

		// 파일 크기 확인 (단위: bytes)
		var fileSize = file.size;
		var maxSizeInBytes = 50 * 1024 * 1024; // 50MB를 bytes로 변환

		if (fileSize > maxSizeInBytes) {
			// 파일 크기가 20MB보다 큰 경우, 경고 메시지 띄우기
			alert('파일 크기가 50MB를 초과합니다. 다른 파일을 선택해주세요.');
			// 파일 선택 input 비우기 (선택한 파일 초기화)
			input.value = '';
		}
	}
</script>

<style>
	#tb{
		text-align:center;
	}
</style>

</head>
<body>
<div class="container">
	<%-- <h2><%= application.getRealPath("/data") %></h2> --%>
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
			<th>file_name</th>
			<th>file_no</th>
			<th>file_type</th>
			<th>file_path</th>
			<th>file_register_date</th>
		</tr>
		<c:forEach var="dto"  items="${list }"> <!-- list라는 아이템을 dto라는 이름으로 controller에서 가져옴 (taskAttachedFileService)-->
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
			<td><a href="download?fileName=${dto.file_name }">${dto.file_name }</a></td>
			<td>${dto.file_no}</td>
			<td>${dto.file_type}</td>
			<td>${dto.file_path}</td>
			<td>${dto.file_register_date}</td>
			<td>
					<!-- 수정 모달 버튼 -->
					<button type="button" class="btn cmodel-btn btn-primary" data-no="${dto.task_no}" data-title="${dto.task_title}" data-content="${dto.task_content}" data-status="${dto.task_status}" data-start="${dto.task_start_date}" data-end="${dto.task_end_date}" data-filename="${dto.file_name}" data-bs-toggle="modal" data-bs-target="#updateModal">수정</button>
					<a href="delete?task_no=${dto.task_no}"><input type="button" value="삭제" class="btn btn-outline-danger" id="btn"/></a>	
			</td>
		</tr>
		</c:forEach>
		</table>
</div>  

<!-- 업무 생성 모달 -->
<!-- 일단 업무 생성 구현 용으로 project_no와 member_no을 임의로 지정 -->
<form action="insert?project_no=1&member_no=1" method="post" modelAttribute="uploadFile" enctype="multipart/form-data">
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
							<!-- <option selected>------업무 상태 선택-----</option> -->
							<option selected value="0">발의됨</option>
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
										
					<tr>
					    <td>
					        <select name="sign_approval" id="sign_approval" class="form-select" aria-label="Default select example">
					            <option value="">------결재자 선택-----</option> <!-- 선택하지 않은 경우의 기본 옵션 -->
					            <c:forEach items="${members}" var="member">
					                <option value="${member.member_no}">${member.name}</option>
					            </c:forEach>
					        </select>
					    </td>
						<td>
							<select name="sign_approval" id="sign_approval" class="form-select" aria-label="Default select example">
								<option selected>------업무 상태 선택-----</option>
								<option value="0">사람1</option>
								<!-- project dto에서 해당 project의 사람을 한사람씩 띄워줌? -->
								<option value="1">사람2</option>
								<option value="2">사람3</option>
								<option value="3">사람4</option>
						</td>
						<td>
							<select name="sign_approval" id="sign_approval" class="form-select" aria-label="Default select example">
								<option selected>------업무 상태 선택-----</option>
								<option value="0">사람1</option>
								<!-- project dto에서 해당 project의 사람을 한사람씩 띄워줌? -->
								<option value="1">사람2</option>
								<option value="2">사람3</option>
								<option value="3">사람4</option>
						</td>
	
					
<!-- 						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th>
						<th><input type="button" value="+" /></th> -->
					</tr>
				</table>
				<br />
			</tr>
			<tr>
				<!-- calendar -->
				
					<!-- Calendar에 기본값 주기 위한 셋팅 -->
					<c:set var="ymd" value="<%=new java.util.Date()%>" />

				<label for="from">시작일</label>&nbsp; &nbsp;
				<input type="text" id="from" name="task_start_date" value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>">
				&nbsp; &nbsp;
				<label for="to">마감일</label>&nbsp; &nbsp;
				<input type="text" id="to" name="task_end_date" value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
			</tr>
			<br /><br />
			<tr>	
				<!-- 첨부파일 -->
				<!-- controller로 file 넘김 -->
				<input type="file" name="file" onchange="checkFileSize(this);"/> 
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
<form action="update" method="post" modelAttribute="uploadFile" enctype="multipart/form-data">
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
				<!-- calendar -->
				<label for="from2">시작일</label>&nbsp; &nbsp;
				<input type="text" id="startvalue" name="task_start_date" >
				&nbsp; &nbsp;
				<label for="to2">마감일</label>&nbsp; &nbsp;
				<input type="text" id="endvalue" name="task_end_date">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
			</tr>	
			<br /><br />
			<tr>	
				<!-- 첨부파일 -->
				<!-- controller로 file 넘김 -->
				<input type="file" name="file" id="fileInput" onchange="hideFileDto(); checkFileSize(this);"/>
				    <!-- 기존 첨부파일 정보를 출력할 div 영역 -->
								<div id="filedto">
									<c:forEach var="file" items="${filedto}">
										<p>${file.file_name}</p>
										<p>${file.file_path}</p>
									</c:forEach>
								</div>
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




</body>
</html>