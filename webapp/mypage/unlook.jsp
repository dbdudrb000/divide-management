<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unlook Stop page</title>

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
	        	<li class="nav-secondary" onclick="javascript: $('.myLi').fadeToggle();"><a href="#"><i class="far fa-user"></i> ${sessionScope.loginVo.nickname}님!</a></li>
	        	<li class="nav-secondary"><a href="/mypage?nickname=${sessionScope.loginVo.nickname}"  style="font-size: 15px;" >MyPage</a></li>	    	
	        	<li class="nav-primary myLi"><a href="#" style="font-size: 15px; " ><i class="fas fa-unlock-alt"></i>&nbsp;Unlock stop</a></li>	        			    	
	        	<li class="nav-secondary myLi"><a onclick = "logout()" style = "cursor: pointer; font-size: 15px;"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a></li>
	        </c:if>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/history"><i class="fas fa-history"></i> history</a></li>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/community?nickname=${loginVo.nickname}"><i class="far fa-comments"></i> 커뮤니티</a></li>
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="${contextPath}/divide/insert">Divide insert</a></li>
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
	          		<header>
				        <h1 align = "center" style = "color: steelblue;">
				           	대기중인 기능
				        </h1>        
				    </header>
					<div>
					<ul class="swatch-list" style="width: 800px; overflow: auto;">
						<c:forEach var="unlookList" items="${unlookList}"> 
							<li class="swatch" style="width: 210px;">
								<div class="swatch-color color-ruby">
									<a onclick = "letgo('${unlookList.cs_func_id}')">
										<img src = "/board/img?project=codingstreet&path=${unlookList.filepath}" style = "width: 200px; cursor: pointer;">
									</a>
								</div>
								<div class="skill_menu">
									<p style = "height:35px; color:darkcyan;">${unlookList.title}<br>${unlookList.create_user }</p>
									
									<div class="wrap">
										<button class="button" onclick = "unlook('${unlookList.cs_func_id}')">기능정지해제</button>
									</div>			
								</div>
							</li>
						</c:forEach>  	
					</ul>
					</div>	
	          	</div>
	          </div>
	        </div>
	      </div>
	    </section>	
	  </div>
	</div>
<script>
		function unlook(fun_id){
			var unlookStop = confirm("정지해체하시겠습니까?");
			
		if(unlookStop){
			location.href = "/unlook/logic?cs_fun_id="+fun_id;		
		}
	}
	
		function logout(){
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if(logout){
				location.href = "/logout";
			}
		}
</script>

</body>
</html>