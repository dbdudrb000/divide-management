<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History Detail</title>

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
	
	/* history 디테일 css */
	
	
	.wrap
	{
	  margin:50px auto 0 auto;
	  width:100%;
	  display:flex;
	  align-items:space-around;
	  max-width:1200px;
	}
	.tile
	{
	  width:380px;
	  height:380px;
	  margin:10px;
	  background-color:#99aeff;
	  display:inline-block;
	  background-size:cover;
	  position:relative;
	  cursor:pointer;
	  transition: all 0.4s ease-out;
	  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.44);
	  overflow:hidden;
	  color:white;
	  font-family:'Roboto';
	  
	}
	.tile img
	{
	  height:100%;
	  width:100%;
	  position:absolute;
	  top:0;
	  left:0;
	  z-index:0;
	  transition: all 0.4s ease-out;
	}
	.tile .text
	{
	/*   z-index:99; */
	  position:absolute;
	  padding:30px;
	  height:calc(100% - 60px);
	}
	.tile h1
	{
	 
	  font-weight:300;
	  margin:0;
	  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
	}
	.tile h2
	{
	  font-weight:100;
	  margin:20px 0 0 0;
	  font-style:italic;
	   transform: translateX(200px);
	}
	.tile p
	{
	  font-weight:300;
	  margin:20px 0 0 0;
	  line-height: 25px;
	/*   opacity:0; */
	  transform: translateX(-200px);
	  transition-delay: 0.2s;
	}
	.animate-text
	{
	  opacity:0;
	  transition: all 0.6s ease-in-out;
	}
	.tile:hover
	{
	/*   background-color:#99aeff; */
	box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.64);
	  transform:scale(1.05);
	}
	.tile:hover img
	{
	  opacity: 0.2;
	}
	.tile:hover .animate-text
	{
	  transform:translateX(0);
	  opacity:1;
	}
	.dots
	{
	  position:absolute;
	  bottom:20px;
	  right:30px;
	  margin: 0 auto;
	  width:30px;
	  height:30px;
	  color:currentColor;
	  display:flex;
	  flex-direction:column;
	  align-items:center;
	  justify-content:space-around;
	  
	}
	
	.dots span
	{
	    width: 5px;
	    height:5px;
	    background-color: currentColor;
	    border-radius: 50%;
	    display:block;
	  opacity:0;
	  transition: transform 0.4s ease-out, opacity 0.5s ease;
	  transform: translateY(30px);
	 
	}
	
	.tile:hover span
	{
	  opacity:1;
	  transform:translateY(0px);
	}
	
	.dots span:nth-child(1)
	{
	   transition-delay: 0.05s;
	}
	.dots span:nth-child(2)
	{
	   transition-delay: 0.1s;
	}
	.dots span:nth-child(3)
	{
	   transition-delay: 0.15s;
	}
	
	
	@media (max-width: 1000px) {
	  .wrap {
	   flex-direction: column;
	    width:400px;
	  }
	}
		/* 버튼 css  */
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
	        </c:if>
	        <c:if test = "${sessionScope.loginVo.nickname != null}">
	        	<li class="nav-secondary"><a href="#">${loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage?nickname=${sessionScope.loginVo.nickname}">MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${sessionScope.loginVo.nickname}">LIKE list</a></li>
	        	<li class="nav-secondary"><a href="/unlook?nickname=${sessionScope.loginVo.nickname}" style="font-size: 15px;" ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	        	
	        	<li class="nav-secondary"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>      
		        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
	        </c:if>
	        <li class="nav-primary"><a style ="cursor: pointer;" href="/history"><i class="far fa-comments"></i> history</a></li>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/community?nickname=${loginVo.nickname}"><i class="far fa-comments"></i> 커뮤니티</a></li>	     
	        <li class="nav-secondary"><a href="#">People</a></li>
	        <li class="nav-secondary"><a href="${contextPath}/divide/detail">Skill</a></li>
	        <li class="nav-secondary"><a href="#">Portfolio</a></li>
	        <li class="nav-secondary"><a href="#">Jobs</a></li>
	      </ul>
	  </nav>				
	</div>
	
	<div class="wrap" style = "margin-left:340px;">
		<c:forEach var = "hisDetail" items = "${hisDetailList}">
			<div class="tile"> 
				<img src='https://images.unsplash.com/photo-1464054313797-e27fb58e90a9?dpr=1&auto=format&crop=entropy&fit=crop&w=1500&h=996&q=80'/>
				<div class="text">
					<c:if test = "${hisDetail.history_nickname == sessionScope.loginVo.nickname}">
					<spen style =  "margin-left: 260px;">
						 <a onclick = "location.href = '/history?history=historyUpdte&historyVer=${hisDetail.history_ver}&historyid=${hisDetail.history_id}'">
						 	<i class="fas fa-pen-alt"  style =  "cursor: cell;"></i>
						 </a> | 					
						 <a onclick = "location.href = '/historyDelete?historyId=${hisDetail.history_id}&historyVer=${hisDetail.history_ver}'">
						 	<i class="fas fa-trash-alt" style =  "cursor: no-drop;"></i>
						 </a>
					</spen>		 
					</c:if>
					<h1><i class="fab fa-audible"></i> 버전 ${hisDetail.history_ver} <i class="fab fa-audible"></i> </h1>
					<h2 class="animate-text"> 추가된 기능 : ${hisDetail.history_title}</h2>
					<p class="animate-text">기능 설명 : ${hisDetail.history_detail}</p>
					<h3 class="animate-text"> <br><br> 작성자 : ${hisDetail.history_nickname}</h3>
					<h3 class="animate-text"><br> 등록 일시 : ${hisDetail.history_create_dt}</h3>
					<c:if test = "${ !empty hisDetail.history_filepath}">
						<a  class = "animate-text" href = "/download?downFile=${hisDetail.history_filepath}">
							<button style = "margin:10px;" class = "button"><i class="fas fa-file-signature"></i> 다운로드</button>
						</a>				
					</c:if>
				</div>													
			</div> 
			<i class="fas fa-award"></i>
		</c:forEach>
	</div> <!-- wrap end -->
  
	
	
	
</body>
</html>