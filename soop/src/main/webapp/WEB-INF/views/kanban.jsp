<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

  <style>
body {
    min-width: 1200px;
    margin-left: 300px;
  }
 
  .column {
    width: 300px;
    float: left;
    padding-bottom: 100px;
  }
  .portlet {
    margin: 0 1em 1em 0;
    padding: 0.3em;
  }
  .portlet-header {
    padding: 0.2em 0.3em;
    margin-bottom: 0.5em;
    position: relative;
  }
  .portlet-toggle {
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -8px;
  }
  .portlet-content {
    padding: 0.4em;
  }
  .portlet-placeholder {
    border: 1px dotted black;
    margin: 0 1em 1em 0;
    height: 50px;
  }
  </style>
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script>
  $( function() {


    $( ".column" ).sortable({
      connectWith: ".column",
      handle: ".portlet-header",
      cancel: ".portlet-toggle",
      placeholder: "portlet-placeholder ui-corner-all"    	
    });
 
    $( ".portlet" )
      .addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
      .find( ".portlet-header" )
        .addClass( "ui-widget-header ui-corner-all" )
        .prepend( "<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");
 
    $( ".portlet-toggle" ).on( "click", function() {
      var icon = $( this );
      icon.toggleClass( "ui-icon-minusthick ui-icon-plusthick" );
      icon.closest( ".portlet" ).find( ".portlet-content" ).toggle();
      
    });

	$("#portlet1").draggable();
	$("#portlet2").droppable({
		drop: handleDropEvent
	});
	
  } );


  function handleDropEvent(event, ui) {
	  // $(ui.draggable).find("tr").children("td") -> 해당 Jquery을 통해 이동하려는 영역의 데이터를 가져올수 있음
	  var taskNo = $(ui.draggable).find("tr").children("td")[2].textContent;	// 예시 업무번호의 td의 textContent 값을 가져옴.

	  // ajax을 통한 상태값 업데이트 및 화면 변경 처리

  }


  </script>

</head>
<body>
	<h2>kanban.jsp</h2>
<%--	<p>${dto  }</p>--%>

<%-- 	<table>
		<c:forEach var="tasklist" items="${dto }">
		
		<tr>
			<th>프로젝트 번호</th>
			<th>프로젝트 제목</th>
			<th>업무 번호</th>
			<th>업무 제목</th>
			<th>업무 생성자 번호</th>
			<th>업무 생성자 이름</th>
			<th>업무 상태</th>
		</tr>
		
		<tr>
			<td><c:out value="${tasklist.project_no }"></c:out></td>
			<td><c:out value="${tasklist.project_title }"></c:out></td>
			<td><c:out value="${tasklist.task_no }"></c:out></td>
			<td><c:out value="${tasklist.task_title }"></c:out></td>
			<td><c:out value="${tasklist.member_no }"></c:out></td>
			<td><c:out value="${tasklist.name }"></c:out></td>
			<td><c:out value="${tasklist.task_status }"></c:out></td>
		</tr>

		
		</c:forEach>
		
	</table> --%>
  
 		<div id="portlet1" class="column" >	<!-- column : 열 안에 portlet을 가지고 있는 형태 -->
		 	<c:forEach var="tasklist" items="${dto }">
		 		
	 	 		<c:if test="${tasklist.task_status == 0}">	<!-- 발의 : 0번 -->
	 			  <div id="childPortlet1" class="portlet">
				    <div class="portlet-header"> Title : ${tasklist.project_title} </div>
				    <div class="portlet-content">				    
				    	<table>
				    		<tr>
				    			<th>프로젝트 번호 : </th>
				    			<td>${tasklist.project_no }</td>
				    		</tr>
							<tr>
				    			<th>프로젝트 제목 : </th>
				    			<td>${tasklist.project_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 번호 : </th>
				    			<td>${tasklist.task_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 제목 : </th>
				    			<td>${tasklist.task_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무생성자번호 : </th>
				    			<td>${tasklist.member_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무생성자이름 : </th>
				    			<td>${tasklist.name }</td>
				    		</tr>
				    		<tr>
				    			<th>업무등록일 : </th>
				    			<td>${tasklist.task_register_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무시작일 : </th>
				    			<td>${tasklist.task_start_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무종료일 : </th>
				    			<td>${tasklist.task_end_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 상태 : </th>				    			
				    			<%-- <td>${tasklist.task_status }</td> --%>	
				    			<td><c:out value="발의"></c:out></td>					    					    			
				    		</tr>
				    		
				    	</table>		    
				    </div>
				  </div>
				 </c:if>		
			</c:forEach>
		</div>
		
		<div id="portlet2" class="column" >	<!-- column : 열 안에 portlet을 가지고 있는 형태 -->
		 	<c:forEach var="tasklist" items="${dto }">
	 	 		<c:if test="${tasklist.task_status == 1}">	<!-- 진행 : 1번 -->
	 			  <div id="childPortlet2" class="portlet">
				    <div class="portlet-header"> Title : ${tasklist.project_title} </div>
				    <div class="portlet-content">
				    	<table>
				    		<tr>
				    			<th>프로젝트 번호 : </th>
				    			<td>${tasklist.project_no }</td>
				    		</tr>
							<tr>
				    			<th>프로젝트 제목 : </th>
				    			<td>${tasklist.project_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 번호 : </th>
				    			<td>${tasklist.task_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 제목 : </th>
				    			<td>${tasklist.task_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 번호 : </th>
				    			<td>${tasklist.member_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 이름 : </th>
				    			<td>${tasklist.name }</td>
				    		</tr>
				    		<tr>
				    			<th>업무등록일 : </th>
				    			<td>${tasklist.task_register_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무시작일 : </th>
				    			<td>${tasklist.task_start_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무종료일 : </th>
				    			<td>${tasklist.task_end_date }</td>
				    		</tr>				    		
				    		<tr>
				    			<th>업무 상태 : </th>				    			
				    			<%-- <td>${tasklist.task_status }</td> --%>
				    			<td><c:out value="진행"></c:out></td>	
				    		</tr>
				    		
				    	</table>	
				    </div>
				  </div>
				 </c:if>		
			</c:forEach>
		</div>
				
		<div id="portlet3" class="column" >	<!-- column : 열 안에 portlet을 가지고 있는 형태 -->
		 	<c:forEach var="tasklist" items="${dto }">
	 	 		<c:if test="${tasklist.task_status == 2}">	<!-- 보류 : 2번 -->
	 			  <div  class="portlet">
				    <div class="portlet-header"> Title : ${tasklist.project_title} </div>
				    <div class="portlet-content">
					    	<table>
				    		<tr>
				    			<th>프로젝트 번호 : </th>
				    			<td>${tasklist.project_no }</td>
				    		</tr>
							<tr>
				    			<th>프로젝트 제목 : </th>
				    			<td>${tasklist.project_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 번호 : </th>
				    			<td>${tasklist.task_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 제목 : </th>
				    			<td>${tasklist.task_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 번호 : </th>
				    			<td>${tasklist.member_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 이름 : </th>
				    			<td>${tasklist.name }</td>
				    		</tr>
				    		<tr>
				    			<th>업무등록일 : </th>
				    			<td>${tasklist.task_register_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무시작일 : </th>
				    			<td>${tasklist.task_start_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무종료일 : </th>
				    			<td>${tasklist.task_end_date }</td>
				    		</tr>				    		
				    		<tr>
				    			<th>업무 상태 : </th>				    			
				    			<%-- <td>${tasklist.task_status }</td> --%>
				    			<td><c:out value="보류"></c:out></td>	
				    		</tr>
				    		
				    	</table>					   
				    </div>
				  </div>
				 </c:if>		
			</c:forEach>
		</div>
				
		<div id="portlet4" class="column" >	<!-- column : 열 안에 portlet을 가지고 있는 형태 -->
		 	<c:forEach var="tasklist" items="${dto }">
	 	 		<c:if test="${tasklist.task_status == 3}">	<!-- 완료 : 3번 -->
	 			  <div  class="portlet">
				    <div class="portlet-header"> Title : ${tasklist.project_title} </div>
				    <div class="portlet-content">
				    	<table>
				    		<tr>
				    			<th>프로젝트 번호 : </th>
				    			<td>${tasklist.project_no }</td>
				    		</tr>
							<tr>
				    			<th>프로젝트 제목 : </th>
				    			<td>${tasklist.project_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 번호 : </th>
				    			<td>${tasklist.task_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 제목 : </th>
				    			<td>${tasklist.task_title }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 번호 : </th>
				    			<td>${tasklist.member_no }</td>
				    		</tr>
				    		<tr>
				    			<th>업무 생성자 이름 : </th>
				    			<td>${tasklist.name }</td>
				    		</tr>
				    		<tr>
				    			<th>업무등록일 : </th>
				    			<td>${tasklist.task_register_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무시작일 : </th>
				    			<td>${tasklist.task_start_date }</td>
				    		</tr>
				    		<tr>
				    			<th>업무종료일 : </th>
				    			<td>${tasklist.task_end_date }</td>
				    		</tr>				    		
				    		<tr>
				    			<th>업무 상태 : </th>				    			
				    			<%-- <td>${tasklist.task_status }</td> --%>
				    			<td><c:out value="완료"></c:out></td>	
				    		</tr>
				    		
				    	</table>
				    </div>
				  
				  </div>
				 </c:if>		
			</c:forEach>
		</div>
			
</body>
</html>