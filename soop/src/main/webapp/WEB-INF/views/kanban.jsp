<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">

 .sortable_list, .sortable_list0 {
border: 1px solid #eee;
width: 350px;
min-height: auto;
list-style-type: none;
margin: 0;
padding: 5px 0 0 0;
float: left;
margin-right: 10px;
}

.sortable_list li, .sortable_list1 li {
margin: auto;
padding: 5px;
font-size: 1.0em;
width: 300px;
}

</style>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	$( ".sortable_list" ).sortable({
	    connectWith: ".connectedSortable",
	    /*stop: function(event, ui) {
	        var item_sortable_list_id = $(this).attr('id');
	        console.log(ui);
	        //alert($(ui.sender).attr('id'))
	    },*/
	    receive: function(event, ui) {
	    	
	    	//console.dir(this) // 현재 드랍된 열의 위치
	        //console.log("dropped on = "+this.id); // 드랍 위치
	        //console.log("sender = "+ui.sender[0].id); // 드랍 되기 전 위치
	        //ui.item[0].innerHTML= this.id +"행";
	        //alert("item = "+ui.item[0].innerHTML); //Which item (or ui.item[0].id)
	        //alert("item = "+ui.item); //Which item (or ui.item[0].id)
	        
	        console.log("before_업무상태값 : " + ui.item.find("input[name='task_status']").val()); //내가 클릭한 카드의 업무상태값
        	        
	        // 업무상태가 열의 id의 상태값에 따라 변경되도록하기
	        var beforeTaskStatus = ui.sender[0].id//내가 클릭한 카드의 열의 위치
	        //console.log("현재 열의 위치 : " + beforeTaskStatus)
	        var presentTaskStatus = this.id
	        //console.log("변경된 열의 위치 : " + presentTaskStatus)	       
	        // 업무상태값
	        // 0 - 발의
	        // 1 - 진행
	        // 2 - 보류
	        // 3 - 완료
	        	        	       	        
	        var changeStatus;
	        if(beforeTaskStatus != presentTaskStatus){
	        	if(presentTaskStatus == "sortable0"){
		        	ui.item.find("td").eq(9).html("발의")		        	
		        	//ui.item.find("td").eq(10).find("input").val("0");
		        	// console.log(ui.item.find("td").eq(10));		        	
		        	changeStatus = $("table").eq(0).next().val("0");
		        	console.log("after_업무상태값 : " + $("table").eq(0).next().val());
					// 업무상태값을 변경
					// console.log(ui.item.find("input"));
					//ui.item.find("input").val("0");
	        	}else if(presentTaskStatus == "sortable1"){
	        		ui.item.find("td").eq(9).html("진행")
	        		// 업무상태값을 변경
	        		//ui.item.find("td").eq(10).html("1");
	        		changeStatus = $("table").eq(1).next().val("1");
	        		console.log("after_업무상태값 : " + $("table").eq(1).next().val());
	        	}else if(presentTaskStatus == "sortable2"){
	        		ui.item.find("td").eq(9).html("보류")
	        		// 업무상태값을 변경
	        		changeStatus = $("table").eq(2).next().val("2");
	        		console.log("after_업무상태값 : " + $("table").eq(2).next().val());
	        	}else if(presentTaskStatus == "sortable3"){
	        		ui.item.find("td").eq(9).html("완료")
	        		// 업무상태값을 변경
	        		//ui.item.find("input[name='task_status']").val("3");
	        		changeStatus = $("table").eq(3).next().val("3");
	        		console.log("after_업무상태값 : " + $("table").eq(3).next().val());
	        	}
		        	
	        }	// if문 end
	        	        
	        // ajax 변수
	        // 변동된 정보를 업데이트
	        var task_status = changeStatus.val();
	        var member_no = ui.item.find("td").eq(4).text();
	        var task_no = ui.item.find("td").eq(2).text();
	        
	        console.log("member_no : " + ui.item.find("td").eq(4).text())
	        console.log("task_no : " + ui.item.find("td").eq(2).text())
	        console.log("task_status : " + task_status)
	        
	        $.ajax({	        	
	            url: "<c:url value='/chageTaskStatus' />",
	            type: "get",
	            data: {	            		            	
	                "task_status": task_status,
	                "member_no": member_no,
	                "task_no": task_no
	            },	            	            
	            dataType : "text",
	            contentType: "application/json;charset=utf-8",
	            success: function(data) {	            	
	                console.log("성공");
	                alert("성공");
	              },
	              error: function(data) {
	                  console.log('에러'+ data);
	                  console.log('에러'+ JSON.stringify(data));
	                  console.log(JSON.stringify(data))
	              }
	            });	// ajax end               
	    }	// receive end         
	}).disableSelection();

	});	// function() end

</script>

</head>
<body>
<%-- <jsp:include page="nav.jsp" /> --%>
<ul id="sortable0" class="sortable_list connectedSortable">
	<c:forEach var="tasklist" items="${dto }">
		<c:if test="${tasklist.task_status == 0}">
			<li class="ui-state-default">								
				<table>					
				    <tr>				    	
				    	<th style=" display: none;" >프로젝트 번호 : </th>
				    	<td style=" display: none;">${tasklist.project_no }</td>
				    </tr>
					<tr>
				    	<th style=" display: none;">프로젝트 제목 : </th>
				    	<td style=" display: none;">${tasklist.project_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무 번호 : </th>
				    	<td style=" display: none;">${tasklist.task_no }</td>
				    </tr>
				    <tr>
				    	<th>업무 제목 : </th>
				    	<td>${tasklist.task_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자번호 : </th>
				    	<td style=" display: none;">${tasklist.member_no }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자이름 : </th>
				    	<td style=" display: none;">${tasklist.name }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무등록일 : </th>
				    	<td style=" display: none;">${tasklist.task_register_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무시작일 : </th>
				    	<td style=" display: none;">${tasklist.task_start_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무종료일 : </th>
				    	<td style=" display: none;">${tasklist.task_end_date }</td>
				    </tr>
					<tr>
						<th>업무 상태 :</th>
							<td>
							<c:out value="발의"></c:out>
						</td>
					</tr>				    		
				</table>
				<input type="hidden" name="task_status" value="${tasklist.task_status}" />
			</li>
		</c:if>
	</c:forEach>
</ul>
     
<ul id="sortable1" class="sortable_list connectedSortable">
	<c:forEach var="tasklist" items="${dto }">
		<c:if test="${tasklist.task_status == 1}">
			<li class="ui-state-default">								
				<table>					
				    <tr>				    	
				    	<th style=" display: none;" >프로젝트 번호 : </th>
				    	<td style=" display: none;">${tasklist.project_no }</td>
				    </tr>
					<tr>
				    	<th style=" display: none;">프로젝트 제목 : </th>
				    	<td style=" display: none;">${tasklist.project_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무 번호 : </th>
				    	<td style=" display: none;">${tasklist.task_no }</td>
				    </tr>
				    <tr>
				    	<th>업무 제목 : </th>
				    	<td>${tasklist.task_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자번호 : </th>
				    	<td style=" display: none;">${tasklist.member_no }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자이름 : </th>
				    	<td style=" display: none;">${tasklist.name }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무등록일 : </th>
				    	<td style=" display: none;">${tasklist.task_register_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무시작일 : </th>
				    	<td style=" display: none;">${tasklist.task_start_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무종료일 : </th>
				    	<td style=" display: none;">${tasklist.task_end_date }</td>
				    </tr>
					<tr>
						<th>업무 상태 :</th>
							<td>
							<c:out value="진행"></c:out>
							</td>
					</tr>				    		
				</table>
				<input type="hidden" name="task_status" value="${tasklist.task_status}" />
			</li>
		</c:if>
	</c:forEach>
</ul>     
     
<ul id="sortable2" class="sortable_list connectedSortable">
	<c:forEach var="tasklist" items="${dto }">
		<c:if test="${tasklist.task_status == 2}">
			<li class="ui-state-default">								
				<table>					
				    <tr>				    	
				    	<th style=" display: none;" >프로젝트 번호 : </th>
				    	<td style=" display: none;">${tasklist.project_no }</td>
				    </tr>
					<tr>
				    	<th style=" display: none;">프로젝트 제목 : </th>
				    	<td style=" display: none;">${tasklist.project_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무 번호 : </th>
				    	<td style=" display: none;">${tasklist.task_no }</td>
				    </tr>
				    <tr>
				    	<th>업무 제목 : </th>
				    	<td>${tasklist.task_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자번호 : </th>
				    	<td style=" display: none;">${tasklist.member_no }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자이름 : </th>
				    	<td style=" display: none;">${tasklist.name }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무등록일 : </th>
				    	<td style=" display: none;">${tasklist.task_register_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무시작일 : </th>
				    	<td style=" display: none;">${tasklist.task_start_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무종료일 : </th>
				    	<td style=" display: none;">${tasklist.task_end_date }</td>
				    </tr>
					<tr>
						<th>업무 상태 :</th>
							<td>
							<c:out value="보류"></c:out>
							</td>
					</tr>				    							    		
				</table>
				<input type="hidden" name="task_status" value="${tasklist.task_status}" />
			</li>
		</c:if>
	</c:forEach>
</ul> 

<ul id="sortable3" class="sortable_list connectedSortable">
	<c:forEach var="tasklist" items="${dto }">
		<c:if test="${tasklist.task_status == 3}">
			<li class="ui-state-default">								
				<table>					
				    <tr>				    	
				    	<th style=" display: none;" >프로젝트 번호 : </th>
				    	<td style=" display: none;">${tasklist.project_no }</td>
				    </tr>
					<tr>
				    	<th style=" display: none;">프로젝트 제목 : </th>
				    	<td style=" display: none;">${tasklist.project_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무 번호 : </th>
				    	<td style=" display: none;">${tasklist.task_no }</td>
				    </tr>
				    <tr>
				    	<th>업무 제목 : </th>
				    	<td>${tasklist.task_title }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자번호 : </th>
				    	<td style=" display: none;">${tasklist.member_no }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무생성자이름 : </th>
				    	<td style=" display: none;">${tasklist.name }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무등록일 : </th>
				    	<td style=" display: none;">${tasklist.task_register_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무시작일 : </th>
				    	<td style=" display: none;">${tasklist.task_start_date }</td>
				    </tr>
				    <tr>
				    	<th style=" display: none;">업무종료일 : </th>
				    	<td style=" display: none;">${tasklist.task_end_date }</td>
				    </tr>
					<tr>
						<th>업무 상태 :</th>
						<td>
							<c:out value="완료"></c:out>
						</td>
					</tr>						    		
				</table>
				<input type="hidden" name="task_status" value="${tasklist.task_status}" />
			</li>
		</c:if>
	</c:forEach>
</ul> 
		
</body>
</html>