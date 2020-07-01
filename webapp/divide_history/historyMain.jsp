<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Divide History Sotry</title>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	<script src="${contextPath}/resources/js/divide_detail.js"></script>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css">



	<link rel="stylesheet" href="/resources/css/divide/divideMain.css">
	
	<!-- 검색창 css -->
	<link rel="stylesheet" href="/resources/css/divide/divide_main_search.css">	
	
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
 		/* 기능많아지면 스크롤로 할때 쓰는 css */
	 	.card {
	  background: #fff;
	  border-radius: 2px;
	  display: inline-block;
	  height: 300px;
	  margin: 1rem;
	  position: relative;
	  width: 300px;
	}
	
	/* button css */
	
	.button {
    width:100px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 17px;
    cursor: pointer;
	border-radius:10px;
}


	
</style>
	


</head>
<body class = "divideBoby">
	
	<div class="l-nav">
	  <nav class="nav">
	      <ul>
	        <li class="nav-secondary"><a href="/divide">Home</a></li> 
	        <c:if test = "${sessionScope.loginVo.nickname == null}">
	        	<li class="nav-secondary"><a href="/divide/login">Login</a></li>
	        	<li class="nav-secondary"><a href="/joinView">회원가입</a></li> 
	        </c:if> 
	        <c:if test = "${sessionScope.loginVo.nickname != null}">
	        	<li class="nav-secondary"><a href="#">${loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage?nickname=${sessionScope.loginVo.nickname}">MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${sessionScope.loginVo.nickname}">LIKE list</a></li>
	        	<li class="nav-secondary"><a href="/unlook?nickname=${sessionScope.loginVo.nickname}" style="font-size: 15px;" ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	        	
	        	<li class="nav-secondary"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>      
		        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
	        </c:if>
	        <li class="nav-primary"><a style ="cursor: pointer;" href="/history"><i class="fas fa-history"></i> history</a></li>
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
				<!-- 스크롤 codepen import -->
				<div class="container">
				    <header>
				        <h1 align = "center" style = "color: steelblue;">
				           	History Library 
				        </h1>        
				    </header>
				    
				    <form class="form-wrapper cf" action = "/mainSearch">
					  	<input type="text" name = "serachValue" placeholder="search here..." required>
					  	<input type = "hidden" name = "search" value = "historySearch">
						<button type="submit">검색</button>
					</form>
	
					<div>
					<ul class="swatch-list a" style = "width: 800px; overflow: auto;">
						<c:forEach var="list" items="${list}">
							<li class="swatch" style = "width: 205px;">
								<div class="swatch-color color-ruby">
									<a onclick = "letgo('${list.cs_func_id}')">	
										<c:if test = "${fn:contains(list.filepath,'jpg') }">
											<img src = "/board/img?project=codingstreet&path=${list.filepath}" style = "width: 205px; height:170px; cursor: pointer;">
										</c:if>
										<c:if test = "${!fn:contains(list.filepath,'jpg') }">
											<img src = "/board/img?project=codingstreet&path=noimage.jpg" style = "width: 205px; height:170px; cursor: pointer;">
										</c:if>		
									</a>
								</div>
								<div class="skill_menu" style = "height:75px;">
									<p style = "height:35px; color:darkcyan;">${list.title}<br>작성자 : [${list.create_user}]<br>버전: ${list.ver}</p>
									<button  class='button' onclick = "location.href = '/history?history=historydetail&historyid=${list.cs_func_id}'">history 보기</button>							  
								</div>
							</li>
						</c:forEach>
					</ul>
					</div>
				</div>
			</div>
		  </div>
		 </section>
	  </div> 
	  
	
<script>
	function logout(){
		
		var logout = confirm("로그아웃 하시겠습니까?");
		
		if(logout){
			location.href = "/logout";
		}
	}
	

</script>
</body>
</html>