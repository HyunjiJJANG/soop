<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리</title>
<!-- 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="/css/hhj.css">

<!-- AJAX -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 부트스트랩 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>


<!-- CSS -->
<style type="text/css">
html, body {
	height: 100%;
}

body {
	padding: 1.5em;
	background: #ffffff;
}

#historyH2 {
	margin-left: 50px;
	font-weight: bold;
	margin-top: 100px;
	align-items: center;
}

.pill {
	height: 0px;
	border-radius: 2px;
	color: #009e2a;
	border: 2px solid currentColor;
	width: 90%;
	text-align: center;
	align-items: center;
	margin-left: 60px;
	margin-top: 40px;
	margin-bottom: 40px;
}

table {
	border: 1px #00480c solid;
	font-size: .9em;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: center;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #00480c;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
	text-align: center;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}

a {
	color: #00480c;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: center;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: center;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
		text-align: center;
	}
	tr {
		display: inline-block;
		vertical-align: top;
		text-align: center;
	}
	th {
		border-bottom: 1px solid #00480c;
		text-align: center;
	}
	td {
		border-bottom: 1px solid #e5e5e5;
		text-align: center;
	}
}

ul {
	text-align: center;
	margin-top: 30px;
	vertical-align: middle;
}
</style>


<script>
	$(document)
			.ready(
					function() {
						$("#projectList")
								.change(
										function() {
											var selectedProjectNo = $(this)
													.val();
											var member_no = parseInt($(
													"#member_no").val());
											if (selectedProjectNo) {
												$
														.ajax({
															url : "/getSelectProjectHistoryList", // 서버에서 히스토리 리스트를 반환하는 URL
															method : "GET",
															data : {
																project_no : selectedProjectNo,
																member_no : member_no

															},
															dataType : "json",
															success : function(
																	result) {
																if (result
																		&& result.length >= 1) {
																	var searchResultList = [];
																	result
																			.forEach(function(
																					item) {

																				var str = '<tr>';
																				str += '<td>'
																						+ item.project_title
																						+ '</td>';
																				str += '<td><a href="/historyDetail?task_no='
																						+ item.task_no
																						+ '">'
																						+ item.task_title
																						+ '</a></td>';
																				str += '<td>'
																						+ item.history_content
																						+ '</td>';
																				str += '<td>'
																						+ item.name
																						+ '</td>';
																				str += '<td>';

																				// 날짜 변환
																				var date = new Date(
																						item.history_register_date);
																				var formattedDate = date
																						.toLocaleDateString(
																								"en-US",
																								{
																									year : "numeric",
																									month : "2-digit",
																									day : "2-digit"
																								});

																				str += formattedDate;
																				str += '</td>';
																				str += '</tr>';
																				searchResultList
																						.push(str);

																			});

																	$(
																			'#historyListDiv')
																			.empty()
																			.append(
																					searchResultList
																							.join(''));

																} else {

																	$(
																			'#historyListDiv')
																			.empty();
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.log(
																				"Error occurred:",
																				errorThrown);
															}
														});
											}
										});
					});
</script>


</head>
<body>

	<input type="hidden" value="${member_no }" name="member_no"
		id="member_no" />

	<div>
		<h2 class="card-title text-left" id="historyH2">히스토리</h2>
		<hr class="pill" />
		<div class="container">
			<table>
				<thead>
					<tr>
						<th>프로젝트 제목</th>
						<th>업무 제목</th>
						<th>히스토리 내용</th>
						<th>작성자</th>
						<th>시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>


						<td><select class="form-select"
							aria-label="Default select example" name="projectList"
							id="projectList">
								<option selected>프로젝트 선택</option>
								<c:forEach var="project" items="${projectList}">
									<option value="${project.project_no}">${project.project_title}</option>
								</c:forEach>
						</select></td>

					</tr>

					<tbody id="historyListDiv">
			<c:forEach var="historydto" items="${list }">
						<h2>멤버 번호 ${historydto.member_no }</h2>
						<h2>프로젝트 번호 ${historydto.project_no }</h2>

						<tr>
							<td>${historydto.project_title }</td>
							<td><a href="/historyDetail?task_no=${hitorydto.task_no}">${historydto.task_title }</a></td>
							<td>${historydto.history_content }</td>
							<td>${historydto.name }</td>

							<td>
								<%-- ${historydto.history_register_date }  --%> <!-- 이 때 여기 value는 날짜값이 와야 합니다. string일 경우 날짜값으로 바꿔줘야 함 -->
								<fmt:parseDate var="dateString"
									value="${historydto.history_register_date }"
									pattern="yyyy-MM-dd HH:mm:ss" /> <!-- 위에 저런 문자로 되어있으니까 날짜로 인식해서 바꿔줘 -->
								<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" />
							</td>
						</tr>


					</c:forEach>
				</tbody>

				<tr>
					<td colspan="5">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${map.prev }">
									<li class="page-item"><a class="page-link"
										href="historyList?currentPage=${map.currentPage-5}&member_no=${member_no}">이전</a></li>
								</c:if>
								<c:forEach var="i" begin="${map.startPageNo}"
									end="${map.endPageNo}">
									<li class="page-item"><a class="page-link"
										href="historyList?currentPage=${i}&member_no=${member_no}">${i}</a></li>
								</c:forEach>
								<c:if test="${map.next }">
									<li class="page-item"><a class="page-link"
										href="historyList?currentPage=${map.currentPage+5}&member_no=${member_no}">다음</a></li>
								</c:if>
							</ul>
						</nav>

					</td>
				</tr>
				</tbody></table>

		</div>
	</div>
</body>


</html>