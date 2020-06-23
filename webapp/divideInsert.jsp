<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Divide Insert Page</title>

<link rel="stylesheet" href="/resources/css/divide/divideMain.css">	

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- Detail Scripts -->
<script src="${contextPath}/resources/js/divide_detail.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css">

<!-- font Awesome -->
<link rel="stylesheet" href="/resources/css/divide/divideMain.css">
<link rel="stylesheet" href="/resources/css/fontawesome/all.css">

	<style>
		 .divideBoby{
			background-image: url('/resources/images/Positive.jpg');
			background-size: cover;
			
			}
			
		/* codepen 에서 가져온 것. */
	 .ui_border{font-family:"Nanum Gothic","나눔고딕","돋움", Dotum, "돋움체", DotumChe, sans-serif}
	 .ui_border .border_tit{font-size:28px;line-height:57px;color:#333;font-weight:bold;text-align:center} */
	 .ui_border .border_cont{border-top:3px solid #8b8b8b;border-bottom:3px solid #8b8b8b} 
	 .ui_border .border_cont input[type="text"] , textarea{padding:0 30px;box-sizing:border-box;-webkit-box-sizing:border-box;display:block;width:70%;border:0;text-align:left}
 	.ui_border .border_cont textarea{padding:38px 20px;font-size:24px;line-height:36px;color:#666}
	.ui_border .border_cont .inq_field{line-height:57px;border-bottom:1px solid #dedede !important}
	.btn_area{margin-top:30px;text-align:center} 
	
	/* 버튼 공통 */
	 button,input{margin:0;padding:0;border:0}
	.ui_btn{display:block;padding:10px 0;cursor:pointer;color:#8f8f8f;text-align:center;font-size:13px;line-height:1.5em;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-weight:bold;background:0 0;border:1px solid #a8a8a8;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;text-decoration:none;box-sizing:border-box}
	.ui_btn.btn_inline{display:inline-block !important;padding:10px 0;width:15%}
	.ui_btn.btn_emph{color:#fff;background-color:#2078d2;border-color:#2078d2} 
	
	</style>
</head>
<body class = "divideBoby">

	<div class="l-site">
	  <div class="l-nav">
	    <nav class="nav">
	      <ul>
	        <li class="nav-secondary"><a href="${contextPath}/divide">Home</a></li>
	        <c:if test = "${sessionScope.loginVo.nickname != null}">
	        	<li class="nav-secondary"><a href="#"><i class="far fa-user"></i> ${sessionScope.loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage?nickname=${sessionScope.loginVo.nickname}">MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${sessionScope.loginVo.nickname}">LIKE list</a></li>
	        	<li class="nav-secondary"><a href="/unlook?nickname=${sessionScope.loginVo.nickname}" style="font-size: 15px; " ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>
	        	<li class="nav-secondary"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a></li>
	        </c:if>
	        <li class="nav-primary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
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


	<div class="ui_container">
  <div class="ui_border">
    <h3 class="border_tit">기능등록 사항</h3>
    <div class="border_cont" style = "margin-left: 27%;"> 
    <form id = "insertForm" action = "/insertDivide" enctype="multipart/form-data" method = "post">
      	<input type="text" placeholder ="제목" class="inq_field" name = "dvTitle" required/>
      	<input type="text" placeholder ="URL 참고" class="inq_field" name = "dvUrl"required/>
     	
      <table border = "8">
     	 <th>배너이미지</th>
     	 <td>
 	 	 	<input type = "file" class="ui_border" id = "image_file" name = "files">
 	 	 	url 유무:
 	 	 	<i class="fas fa-map-pin"></i>
      		<input type = "radio" value = "N" name = "own">Y
      		<input type = "radio" value = "Y" name = "own">N
      		<i class="fas fa-map-pin"></i>
 		  </td>
 	  </table>
      <!-- <textarea id="" cols="30" rows="8" placeholder = "설명을 입력해주세요." name = "dvDetail"></textarea> -->
      <input type = "text" placeholder = "설명을 입력해주세요." name = "dvDetail" style = "height: 350px;">
	</div>
    <div style = "margin-left:27%; margin-top: 5px;">
    	<input type = "text" placeholder = "작성자" value = "${sessionScope.loginVo.nickname}" style ="height:20px; margin-top: 5px;" name = "dvUser" readonly>
    </div>
	<div class="btn_area">
      	<input type="reset" value="취소" class="ui_btn btn_inline" >
      	<input type="submit" value="등록" class="ui_btn btn_inline btn_emph" >
	</div>
	</div>
	</div>
	</form>
</body>

<script>

	function logout(){
		
		var out = confirm("로그아웃 하시겠습니까?");
		
		if(out){
			location.href = "/logout";
		}
	}

</script>



</html>