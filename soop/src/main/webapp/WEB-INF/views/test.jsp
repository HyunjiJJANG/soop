<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	  });
	});
</script>
<style type="text/css">
	div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
	a {text-decoration:none;}
	
	.quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#fff;}
	.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
	.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
	.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
	.quickmenu ul li a:hover {color:#000;}
	.quickmenu ul li:last-child {border-bottom:0;}
	
	.content {position:relative;min-height:1000px;}
</style>
</head>
<body>
	<div class="quickmenu">
  <ul>
    <li><a href="#">등급별혜택</a></li>
    <li><a href="#">1:1문의</a></li>
    <li><a href="#">후기</a></li>
  </ul>
</div>



<div class="content">
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
</div>

</body>
</html>