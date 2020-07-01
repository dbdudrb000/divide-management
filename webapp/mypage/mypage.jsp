<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style = "background-color: #585858;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	<script src="${contextPath}/resources/js/divide_detail.js"></script>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css">

	<link rel="stylesheet" href="/resources/css/divide/divideMain.css">	
	
	<!-- font Awesome -->
	<link rel="stylesheet" href="/resources/css/fontawesome/all.css">

	<style>
		 .divideBoby{
				background-image: url('/resources/images/Positive.jpg');
				background-size: cover;
		}
		
		.skill_menu{
 			background-color: antiquewhite;
 			text-align: center;
 		}
 		
	
	 
	 	.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
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
	        	<li class="nav-secondary"><a href="#"><i class="far fa-user"></i> ${sessionScope.loginVo.nickname}님!</a></li>
	        	<li class="nav-primary"><a href="/mypage"  style="font-size: 15px;" >MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${sessionScope.loginVo.nickname}">LIKE list</a></li>
	        	<li class="nav-secondary"><a href="/unlook?nickname=${sessionScope.loginVo.nickname}" style="font-size: 15px; " ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	
	        	<li class="nav-secondary"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>
	        </c:if>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
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
			<div class="container">
    <header>
        <h1 align = "center" style = "color:#0c0117;">
           	My Skill Page
        </h1>        
    </header>
    
	<div>
	<ul class="swatch-list">
		<c:if test = "${ !empty myList}">
			<c:forEach var="myList" items = "${myList}">
				<li class="swatch">
					<div class="swatch-color color-ruby">
						<a onclick = "letgo('${myList.cs_func_id}')">														
							<c:if test = "${fn:contains(myList.filepath,'jpg') }">
								<img src = "/board/img?project=codingstreet&path=${myList.filepath}" style = "width: 200px; height:170px; cursor: pointer;">
							</c:if>
							<c:if test = "${!fn:contains(myList.filepath,'jpg') }">
								<img src = "/board/img?project=codingstreet&path=noimage.jpg" style = "width: 205px; height:170px; cursor: pointer;">
							</c:if>														
						</a>
					</div>
					<div class="skill_menu">
						<p style = "height:35px; color:darkcyan;">${myList.title}<br>${myList.create_user}<br>버전: ${myList.ver}</p><br>
						<div class="wrap">	
							<button class="button" onclick = "location.href = '/divideUp?cs_func_id=${myList.cs_func_id}&compar=Y'">수정</button>
							<button class="button" onclick = "dvdelete('${myList.cs_func_id}','${sessionScope.loginVo.nickname}')">점검하기</button>
							<button class="button" onclick = "location.href = '/history?history=inserhistory&historyid=${myList.cs_func_id}'">버전up</button>
						</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
		<c:if test = "${ !empty unlookList}">
			<c:forEach var = "unlookList" items = "${unlookList}">
				<li class="swatch">
					<div class="swatch-color color-ruby">
						<a onclick = "letgo('${unlookList.cs_func_id}')">
							<img src = "/board/img?project=codingstreet&path=${unlookList.filepath}" style = "width: 200px; height:170px; cursor: pointer;">
						</a>
					</div>
					<div class="skill_menu">
						<p style = "height:35px; color:darkcyan;">${unlookList.title}<br>${unlookList.create_user}<br>버전: ${unlookList.ver}</p><br>
						<div class="wrap">	
							<button class="button" onclick = "location.href = '/divideUp?cs_func_id=${unlookList.cs_func_id}&compar=N'">수정</button>
						</div>
					</div>
				</li>
			</c:forEach>
		</c:if>
	</ul>
	</div>
	
</div>

	<script>
	
		function letgo(param){
			location.href = "/divide/detail?param="+param;
		}
		
		
		function logout(){			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if(logout){
				location.href = "/logout";
			}
		}
		
		function dvdelete(number,nickname){
			var dvDelete = confirm("기능을 점검하시겠습니까?");
			
			if(dvDelete){
				location.href = "/delete?cs_func_id="+number+"&nickname="+nickname;
			}
		}
		
		
		
	</script>



</body>
</html>