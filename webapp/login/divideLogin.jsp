<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Divide Login Page</title>

<link rel="stylesheet" type="text/css" href="/resources/css/hotplace/login.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	<script src="${contextPath}/resources/js/divide_detail.js"></script>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css">

	<!-- font Awesome -->
	<link rel="stylesheet" href="/resources/css/fontawesome/all.css">
	
<style>
	.divideBoby{
			background-image: url('/resources/images/Positive.jpg');
			background-size: cover;
		}

</style>

</head>
<body class = "divideBoby">

	<div class="l-site">
	  <div class="l-nav">
	    <nav class="nav">
	      <ul>
	        <li class="nav-secondary"><a href="/divide">Home</a></li>
	        <li class="nav-primary"><a href="/divide/login">Login</a></li>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/history"><i class="fas fa-history"></i> history</a></li>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/community?nickname=${loginVo.nickname}"><i class="far fa-comments"></i> 커뮤니티</a></li>
	        <li class="nav-secondary"><a href="#">People</a></li>
	        <li class="nav-secondary"><a href="${contextPath}/divide/detail">Skill</a></li>
	        <li class="nav-secondary"><a href="#">Portfolio</a></li>
	        <li class="nav-secondary"><a href="#">Jobs</a></li>
	      </ul>
	    </nav>
	  </div>
	  <div class="l-page">
	    <div class="menu">
	      <div class="menu-hamburger"></div>
	    </div>
	    <section class="band band-a divideBoby">
	      <div class="band-container">
	        <div class="band-inner">
	          
	          <div class="">
	          	<div class="container">

<form name = "loginform" action = "/divide/loginLogic" method="post">
	<div align = "center" style = "color: #00FFFF ;">
		<caption><h1>로그인페이지</h1></caption>
	</div>
	<table align = "middle">
	<div class="login">
    	<input type="text" placeholder="email 입력" id="email" name="email">  
 	    <input type="password" placeholder="password 입력" id="password" name="password">  
 			 <a href="#" class="forgot">사랑합니다 고객님</a>
 	 	<input type="button" value="로그인" onclick = "login()">
 		<input type = "button" value = "메인으로" onclick = "location.href = '/divide'">
	</div>
		
<div class="shadow"></div>
</table>
</form>

<script>
	function login(){
		
		var email = document.getElementById("email").value;
		var pw = document.getElementById("password").value;
		
		var param = {	email : email,
						pw	  : pw
						
					};
		
		if(email=="" && pw ==""){
			alert("아이디혹은 비밀번호를 입력해주세요.");
		}else{		
			
			$.ajax({
			    type : 'POST',
			    url : "/divide/loginLogic",
			    data : param,
			    error : function(error) {
			        alert("아이디 또는 비밀번호를 확인해주십시오.");
			    },
			    success : function(data) {
			    	location.href = "/divide";
			   	},
			    complete : function() {
			    }
			});		
		}	
			
		
		
	}
</script>

</body>

</html>
