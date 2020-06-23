<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style = "background-color: #585858;">
<head>
<meta charset="UTF-8">
<title>divide skill 메인페이지</title>

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
	
</style>


</head>
<body class = "divideBoby"> <!-- class = "divideBoby" -->
	
	<div class="l-site">
	  <div class="l-nav">
	  <nav class="nav">
	      <ul>
	        <li class="nav-primary"><a href="/divide">Home</a></li>        
	        <c:if test = "${loginVo.nickname == null}">
	        	<li class="nav-secondary"><a href="/divide/login">Login</a></li>
	        	<li class="nav-secondary"><a href="/joinView">회원가입</a></li>
	        </c:if>
	        <c:if test = "${loginVo.nickname != null}">
	        	<li class="nav-secondary"><a href="#"> <i class="far fa-user"></i> ${loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage?nickname=${loginVo.nickname}">MyPage</a></li>
	        	<li class="nav-secondary"><a href="/likelist?nickname=${loginVo.nickname}">LIKE list</a></li>
	        	<li class="nav-secondary"><a href="/unlook?nickname=${loginVo.nickname}" style="font-size: 15px;" ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	        	
	        	<li class="nav-secondary"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>
		        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
	        </c:if>
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
				<!-- 스크롤 codepen import -->
				<div class="container">
				    <header>
				        <h1 align = "center" style = "color: steelblue;">
				           	기능 모음집 
				        </h1>        
				    </header>
				    
				    <form class="form-wrapper cf" action = "/mainSearch">
					  	<input type="text" name = "serachValue" placeholder="search here..." required>
					  	<input type = "hidden" name = "search" value = "mainSearch">
						 <button type="submit">검색</button>
					</form>
	
					<div>
					<ul class="swatch-list a" style = "width: 800px; overflow: auto;">
						<c:forEach var="list" items="${list}">
							<li class="swatch" style = "width: 205px;">
								<div class="swatch-color color-ruby">
									<a onclick = "letgo('${list.cs_func_id}')">
										<img src = "/board/img?project=codingstreet&path=${list.filepath}" style = "width: 200px; height:170px; cursor: pointer;">
									</a>
								</div>
								<div class="skill_menu" style = "height:75px;">
									<p style = "height:35px; color:darkcyan;">${list.title}<br>작성자 : [${list.create_user}]<br>버전: ${list.ver}</p>
								<br><span>&nbsp;<i class="fas fa-eye"></i>&nbsp;${list.cnt}</span>
								    <c:if test = "${loginVo.nickname != null}">
									    <c:if test = "${!empty likeList}">								    									  	
								    	<c:set var = "isLike" value = "N"/> 
											<c:forEach var = "like" items = "${likeList}">													 					
												<c:if test = "${like.like_like eq list.cs_func_id}">  
													<c:set var = "isLike" value = "Y"/>								
												</c:if> 										 
											</c:forEach>			
												<c:if test = "${isLike eq 'Y'}">
													<a onclick = "cs_like(this,'${list.cs_func_id}','${loginVo.nickname}','${loginVo.email}','${list.title}')" style = "cursor: pointer;">
														&nbsp;<i class="far fa-heart" id = "Heart" name = "dohreat"></i>&nbsp;
														<span>${list.cs_like}</span>
													</a>	
												</c:if>
												<c:if test = "${isLike eq 'N'}">									
													<a onclick = "cs_like(this,'${list.cs_func_id}','${loginVo.nickname}','${loginVo.email}','${list.title}')" style = "cursor: pointer;">
														&nbsp;<i class="fas fa-heart" id = "Heart" name = "dohreat"></i>&nbsp;
														<span>${list.cs_like}</span>
													</a>									  
												</c:if>													 							
										</c:if>
											
										<c:if test = "${empty likeList}">
											<a onclick = "cs_like(this,'${list.cs_func_id}','${loginVo.nickname}','${loginVo.email}','${list.title}')" style = "cursor: pointer;">
												&nbsp;<i class="fas fa-heart" id = "noHeart" name = "dohreat"></i>&nbsp;<span>${list.cs_like}</span>
											</a>
									</c:if>
									</c:if>
									
									<c:if test = "${loginVo.nickname == null}">
										<a onclick = "alert('로그인후 이용가능합니다.')" style = "cursor: pointer;">
											&nbsp;<i class="fas fa-heart" id = "good"></i>&nbsp;<span>${list.cs_like}</span>
										</a>	
									</c:if>		 
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
	
	function cs_like(target,fun_id, nickname, email, title){
		var heartImg = $(target).find('i')[0];
		var isLike = heartImg.className == 'far fa-heart' ? 'Y' : 'N';
		var likeSpan = $(target).find('span');
		var param = { 	  fun_id : fun_id   ,
					  	  nick 	 : nickname ,	
					  	  email	 : email	,
					  	  title  : title
					}; 
				
		if(isLike == 'N'){
			$.ajax({
			    type : 'POST',
			    url : "/like",
			    data : param,
			    error : function(error) {
			        alert("Error!");
			    },
			    success : function(data) {
			        likeSpan.text(Number(likeSpan.text()) + 1);
			        heartImg.className = 'far fa-heart';
			    },
			    complete : function() {
			    }
			});
			
		}else{
			$.ajax({
			    type : 'POST',
			    url : "/deleteLike",
			    data : param,
			    error : function(error) {
			        alert("Error!");
			    },
			    success : function(data) {
			    	likeSpan.text(Number(likeSpan.text()) - 1);
			    	heartImg.className = 'fas fa-heart';
			   	},
			    complete : function() {
			    }
			});
			
		}
		
		
	}
	
</script>
</body>
</html>