<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Skill Update Page </title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	<script src="${contextPath}/resources/js/divide_detail.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css">

	<link rel="stylesheet" href="/resources/css/divide/divideMain.css">	
	<link rel="stylesheet" href="/resources/css/divide/divideUserUpdate.css">	
	
	<!-- font Awesome -->
	<link rel="stylesheet" href="/resources/css/fontawesome/all.css">

	<!-- 코드미러 -->
	<link rel="stylesheet" href="${contextPath}/resources/js/CodeMirror-master/lib/codemirror.css">
	<link rel="stylesheet" href="${contextPath}/resources/js/CodeMirror-master/theme/seti.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.35.0/codemirror.js"></script>
	<script src="https://codemirror.net/mode/javascript/javascript.js"></script>
<%-- 	<script type="module" src="${contextPath}/resources/js/CodeMirror-master/src/codemirror.js"></script> --%>
<%-- 	<script src="${contextPath}/resources/js/CodeMirror-master/mode/javascript/javascript.js"></script> --%>
	
	<style>
		 .divideBoby{
				background-image: url('/resources/images/Positive.jpg');
				background-size: cover;
		}
		
		.skill_menu{
 			background-color: antiquewhite;
 			text-align: center;
 		}

		.preview_div{
		text-align: center;
		width: 205px;
		min-height: 175px;		
		margin-top: 5px;
		top:50%;
		left:50%;
		
		
		display:flex;
		align-items:center;
		color: #00FFFF;
	}


	.preview_img{
		display:none;
		width:100%;
	}
	
	 </style>
</head>
<body class = "divideBoby">


	<div class="l-site">
	  <div class="l-nav">
	    <nav class="nav">
	      <ul>
	        <li class="nav-secondary"><a href="${contextPath}/divide">Home</a></li>
	        <c:if test = "${sessionScope.loginVo.nickname != null}">
	        	<li class="nav-secondary" onclick="javascript: $('.myLi').fadeToggle();"><a href="#"><i class="far fa-user"></i> ${sessionScope.loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage"  style="font-size: 15px;" >MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${sessionScope.loginVo.nickname}">LIKE list</a></li>	    	
	        	<li class="nav-secondary"><a href="/unlook?nickname=${sessionScope.loginVo.nickname}" style="font-size: 15px; " ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	        			    	
	        	<li class="nav-secondary myLi"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a></li>
	        </c:if>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
	        <li class="nav-primary"><a style ="cursor: pointer;" href="/history"><i class="far fa-comments"></i> history</a></li>
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
			<div class="container">
			
			
			
		<!-- codepen  -->
	<form name = "upform" action = "/divide/updateHistory" enctype="multipart/form-data" method = "post">
		<div id="login-box">
		  <div class="left">
		    <h1 style = "color: gray;">history 수정</h1>
		    <input type = "hidden" name = "history_id" value ="${updateHistory.history_id}">
		    버전  <input type = "text" name = "history_ver" value = "${updateHistory.history_ver}"  readonly>
		    <input type="text" name="history_title" value = "${updateHistory.history_title}"/>
		   	<textarea name="history_detail" style = "height:250px; width:230px;" >${updateHistory.history_detail}</textarea>
			
		    <input type="button" value="수정하기" onclick = "divideup()"/>    
		  </div>
		  
		  	<div class="right">
		    	<span class="loginwith">Sign in with<br />social network</span>		    
		    	<input type = "file" id = "image_file" name = "files">
		    	<c:if test = "${ !empty updateHistory.history_filepath }">
		  			<img src = "/board/img?project=codingstreet&path=${updateHistory.history_filepath}" id = "originalImg"  style = "width: 200px; display:block;">
		  			<span class = "preview_span"></span>
					<input type = "hidden" id = "imgsrc" name = "imgsrc">
		  			<input type = "hidden" name = "imgFilepath" value = "${updateHistory.history_filepath}">
		  		</c:if>
		  		<c:if test = "${ empty updateHistory.history_filepath }">
		  			<img src = "/resources/images/noImage.png" id = "originalImg"  style = "width: 200px; display:block;">
		  			<span class = "preview_span"></span>
					<input type = "hidden" id = "imgsrc" name = "imgsrc">
		  		</c:if>
		  		<div id = "preview_div" class = "preview_div">
		  			<img src="/resources/images/noImage.png" class = "preview_img" name = "upimg">
		  			<span class = "preview_span"></span>
					<input type = "hidden" id = "imgsrc" name = "imgsrc">
		  		</div>
		  	</div>
		  <div class="or">OR</div>
		</div>	
	</form>
	
	
	<script>
	
	$(document).ready(function () {
				
		//이벤트 부착
		attachEvent();
	});
	
	function divideup(){
		var change = confirm("수정하시겠습니까?");
		
		if(change){
			upform.submit();
		}	
	}
	
	function logout(){
				
		var logout = confirm("로그아웃 하시겠습니까?");
		
		if(logout){
			location.href = "/logout";
		}
	}
 	
 	
	function attachEvent(){
		//변수 선언
 		const inpFile = document.getElementById("image_file");  			// input 타입 file 인것.
		const origImg = document.getElementById("originalImg");  			// 이미지 변경전 element
		const previewDiv = document.getElementById("preview_div");			// <div>
		const previewimg = previewDiv.querySelector(".preview_img");		// css 를 가져오는 요소
		const previewspan = previewDiv.querySelector(".preview_img"); 		// css 를 가져오는 요소
		
		inpFile.addEventListener("change",function(){
			var file = this.files[0]; 
		
			if(file){
			
				var reader = new FileReader();
			
				origImg.style.display = "none";
			
				previewspan.style.display = "none";
				previewimg.style.display = "block";
			
			
			
				reader.addEventListener("load",function(){
				previewimg.setAttribute("src",this.result);	
			
				var img = document.getElementsByClassName('preview_img');
				document.getElementById("imgsrc").value = this.result ;
				
				});
					reader.readAsDataURL(file);
			}
		});
 	}
	</script>

</body>
</html>