<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 생성/수정 모달에 데이터 값 넘기기 -->
<script>

$(document).ready(function(){

		// 수정 모달에 값 넘기기
		$("#updateModal").on('show.bs.modal', function(e) { // #updateModal 실행해서 모달 창 보이면 function(e)실행
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


<!-- 결재라인 : 선택된 결재자 정보 띄우기 -->


<script>
/* $(document).ready(function () {
    $("#insert_btn").click(function () { 
        var selectedMemberNo = $("#selectMembersCreate1 option:selected").data("memberno");
        var selectedMemberName = $("#selectMembersCreate1 option:selected").data("membername");
        var selectedStep = $("#selectMembersCreate1 option:selected").data("step");
        var selectedStatus = $("#task_status").val();

        // 데이터를 폼에 설정
        $("#sign_member_no").val(selectedMemberNo);
        $("#sign_approver").val(selectedMemberName);
        $("#sign_step").val(selectedStep);
        $("#task_status").val(selectedStatus);
        
        console.log(sign_member_no);
        console.log(sign_approver);
        console.log(sign_step);
        console.log(task_status);

        // 폼 제출
        $("#insertForm").submit(); 
        
    }); */
/*$(document).ready(function () {
	$("#insert_btn").click(function () { // 업무 생성 버튼 누르면 아래 실행
		
        var selectedMemberNo = $("#selectMembersCreate1").val();
        var selectedMemberName = $("#selectMembersCreate1 option:selected").data("membername");
        var selectedStep = $("#selectMembersCreate1 option:selected").data("step"); // 선택된 결재자의 단계
        var selectedStatus = $("#task_status").val(); // 선택된 값 가져오기

        // 확인용으로 출력 => controller에서 log로 안찍힘
        alert("selectedMemberNo : " + $("#selectMembersCreate1").val());
        alert("selectedMemberName : " + $("#selectMembersCreate1 option:selected").data("membername"));
        alert("selectedStep : " + $("#selectMembersCreate1 option:selected").data("step"));
       
        
        alert("확인");
        
 		$.ajax({
			type : "POST",
			url : "/soop/insert",
			data : {
				"sign_member_no": selectedMemberNo,
				"sign_approver":selectedMemberName,
				"sign_step":selectedStep,
				 task_status: selectedStatus
			},
			dataType : "text",
			success : function(data) {
				alert("성공");
			},
			error:function(data){  
				alert("실패");
                console.log('에러'+ data);
                console.log('에러'+ JSON.stringify(data));
                console.log(JSON.stringify(data))
			}
		});
		 
	});
	
});*/

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
	<button type="button" id="insert_modal" name="insert_modal" class="btn btn-primary" data-no="${dto.task_no}" <%-- data-member="${members}"  --%>data-bs-toggle="modal" data-bs-target="#insertModal">업무 생성</button>
<!-- 	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal">
	  업무 생성
	</button> -->
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
<!-- 			<th>sign_no</th>
			<th>sign_approver</th>
			<th>sign_status</th>
			<th>sign_step</th> -->
		</tr>
		<c:forEach var="dto"  items="${list}"> <!-- list라는 아이템을 dto라는 이름으로 controller에서 가져옴 (taskAttachedFileService)-->
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
		<%-- 	<td>${dto.sign_no}</td>
			<td>${dto.sign_approver}</td>
			<td>${dto.sign_status}</td>
			<td>${dto.sign_status}</td> --%>
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
<!-- 일단 업무 생성 구현 용으로 project_no member_no을 임의로 지정 -->
<form action="insert" id="insertForm" name="insertForm" method="post" modelAttribute="uploadFile" enctype="multipart/form-data">
<div class="modal fa와de" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="insertModalLabel">업무 생성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<table class="table">
         			<!-- link에 ?로 주는 대신 hidden으로 줘보기(자꾸 데이터 형식이 안맞아서 나는 오류를 해결하기 위해) -->
		        	<input type="hidden" name="project_no" id="project_no" value="1">
		        	<input type="hidden" name="member_no" id="member_no" value="1"> 
			<tr>
				<td colspan="8">업무 제목</td>
				<td><input class="form-control" id="taskName" type="text" name="task_title"></td>
				<br />
			</tr>
			<tr><td colspan="8">업무 상태	&nbsp; &nbsp;
						<td>
						<select name="task_status_select" id="task_status_select" class="form-select" aria-label="Default select example">
							<!-- <option selected>------업무 상태 선택-----</option> -->
							<option selected value="100">--업무 상태 선택--</option>
							<option value="0">발의중</option>
							<option value="1">진행중</option>
							<option value="2">일시중지</option>
							<option value="3">완료</option>
							</select>
							<!-- 컨트롤러에 task_status 넘겨주는 역할 -->
							<input type="hidden" name="task_status" id="task_status" value="">
								<script>
									  document.getElementById("task_status_select").addEventListener("change", function () {
									    var selectedValue = this.value;
									    document.getElementById("task_status").value = selectedValue;
									  });
								</script>
							
						</td>
						
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
					<tr> 
						<td>
				            <select name="sign_approval" id="selectMembersCreate1" class="form-select" aria-label="Default select example">
				              <option value="">------결재자 선택-----</option>
				              <c:forEach var="member" items="${members}">
				                <option data-memberno="${member.member_no}" data-membername="${member.name}" data-projectno="${member.project_no}" data-step="1">${member.name}</option>
				              </c:forEach>
				            </select>
									<!-- 값 넘기기 위한.. hidden -->
									<input type="hidden" name="sign_approver" id="sign_approver" value="">
									<input type="hidden" name="sign_member_no" id="sign_member_no" value="">
									<input type="hidden" name="sign_step" id="sign_step" value=""><!-- 일단 1단계라서 1 줌 -->
						</td>
						
						<script>
								  // select 요소의 change 이벤트를 감지하여 value를 설정하는 함수
								  document.getElementById("selectMembersCreate1").addEventListener("change", function () {
								    var selectedOption = this.options[this.selectedIndex];
								    var memberNo = selectedOption.getAttribute("data-memberno");
								    var memberName = selectedOption.getAttribute("data-membername");
								    var projectNo = selectedOption.getAttribute("data-projectno");
								    var step = selectedOption.getAttribute("data-step");
								
								    // 값을 hidden input 요소에 설정
								    document.getElementById("sign_approver").value = memberName;
								    document.getElementById("sign_member_no").value = memberNo;
								    document.getElementById("sign_step").value = step;
								
								    // 선택된 값 출력
								    console.log("선택된 결재자: " + memberName);
								    console.log("선택된 결재자 번호: " + memberNo);
								    console.log("선택된 프로젝트 번호: " + projectNo);
								    console.log("선택된 단계: " + step);
								  });
						</script>
										<%-- 						<td>
				            <select name="sign_approval" id="selectMembersCreate2" class="form-select" aria-label="Default select example">
				              <option value="">------결재자 선택-----</option>
				              <c:forEach var="member" items="${members}">
				                <option value="${member.member_no}" data-membername="${member.name}" data-step="2">${member.name}</option>
				              </c:forEach>
				            </select>
						</td>
						<td>
				            <select name="sign_approval" id="selectMembersCreate3" class="form-select" aria-label="Default select example">
				              <option value="">------결재자 선택-----</option>
				              <c:forEach var="member" items="${members}">
				                <option value="${member.member_no}" data-membername="${member.name}" data-step="3" >${member.name}</option>
				              </c:forEach>
				            </select>
						</td> --%>
					</tr>
				</table>
				<br />
			</tr>
			<tr>
			<td>
				<!-- calendar -->
				
					<!-- Calendar에 기본값 주기 위한 셋팅 -->
					<c:set var="ymd" value="<%=new java.util.Date()%>" />

				<label for="from">시작일</label>&nbsp; &nbsp;
				<input type="text" id="from" name="task_start_date" value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>">
				&nbsp; &nbsp;
				<label for="to">마감일</label>&nbsp; &nbsp;
				<input type="text" id="to" name="task_end_date" value="<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				</td>
			</tr>
			<br /><br />
			<tr>	
				<!-- 첨부파일 -->
				<!-- controller로 file 넘김 -->
				<td>
				<input type="file" name="file" onchange="checkFileSize(this);"/> 
				</td>
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
        <button type="submit" id="insert_btn" class="btn btn-primary">업무 생성</button>
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
					</select>
				</td>
			</tr>
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
			<td>
				<!-- calendar -->
				<label for="from2">시작일</label>&nbsp; &nbsp;
				<input type="text" id="startvalue" name="task_start_date" >
				&nbsp; &nbsp;
				<label for="to2">마감일</label>&nbsp; &nbsp;
				<input type="text" id="endvalue" name="task_end_date">
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				</td>
			</tr>	
			<br /><br />
			<tr>	
			<td>
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
								</td>
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