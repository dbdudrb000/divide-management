<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 </title>

	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	 <script src="${contextPath}/resources/js/divide_detail.js"></script> 
	
	 <link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css"> 

	 <!-- <link rel="stylesheet" href="/resources/css/divide/divideMain.css">  -->
	
	<!-- 검색창 css -->
	<link rel="stylesheet" href="/resources/css/divide/divide_main_search.css">	 
	
	<!-- font Awesome -->
	<link rel="stylesheet" href="/resources/css/fontawesome/all.css">
	
	<!-- 검색창 css -->
	<link rel="stylesheet" href="/resources/css/divide/divide_main_search.css">

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
	/* 게시판 css */
	
	/* body {
	
	color: #444;
	font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
	text-shadow: 0 1px 0 #fff;
} */

	strong {
		font-weight: bold; 
	}
	
	em {
		font-style: italic; 
	}
	
	table {
		background: #f5f5f5;
		border-collapse: separate;
		box-shadow: inset 0 1px 0 #fff;
		font-size: 12px;
		line-height: 24px;
		margin: 30px auto;
		text-align: left;
		width: 1040px;
		margin-left: 23%;
	}	
	
	th {
		background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
		border-left: 1px solid #555;
		border-right: 1px solid #777;
		border-top: 1px solid #555;
		border-bottom: 1px solid #333;
		box-shadow: inset 0 1px 0 #999;
		color: #fff;
	  font-weight: bold;
		padding: 10px 15px;
		position: relative;
		text-shadow: 0 1px 0 #000;	
	}
	
	th:after {
		background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
		content: '';
		display: block;
		height: 25%;
		left: 0;
		margin: 1px 0 0 0;
		position: absolute;
		top: 25%;
		width: 100%;
	}
	
	th:first-child {
		border-left: 1px solid #777;	
		box-shadow: inset 1px 1px 0 #999;
	}
	
	th:last-child {
		box-shadow: inset -1px 1px 0 #999;
	}
	
	td {
		border-right: 1px solid #fff;
		border-left: 1px solid #e8e8e8;
		border-top: 1px solid #fff;
		border-bottom: 1px solid #e8e8e8;
		padding: 10px 15px;
		position: relative;
		transition: all 300ms;
	}
	
	td:first-child {
		box-shadow: inset 1px 0 0 #fff;
	}	
	
	td:last-child {
		border-right: 1px solid #e8e8e8;
		box-shadow: inset -1px 0 0 #fff;
	}	
	
	tr {
		background: url(https://jackrugile.com/images/misc/noise-diagonal.png);	
	}
	
	tr:nth-child(odd) td {
		background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png);	
	}
	
	tr:last-of-type td {
		box-shadow: inset 0 -1px 0 #fff; 
	}
	
	tr:last-of-type td:first-child {
		box-shadow: inset 1px -1px 0 #fff;
	}	
	
	tr:last-of-type td:last-child {
		box-shadow: inset -1px -1px 0 #fff;
	}	
	
	tbody:hover td {
		color: transparent;
		text-shadow: 0 0 3px #aaa;
	}
	
	tbody:hover tr:hover td {
		color: #444;
		text-shadow: 0 1px 0 #fff;
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
	        <li class="nav-secondary"><a style ="cursor: pointer;" href="/history"><i class="fas fa-history"></i> history</a></li>
	        <li class="nav-primary"><a style ="cursor: pointer;" href="/community?nickname=${loginVo.nickname}"><i class="far fa-comments"></i> 커뮤니티</a></li>	     
	        <li class="nav-secondary"><a href="#">People</a></li>
	        <li class="nav-secondary"><a href="${contextPath}/divide/detail">Skill</a></li>
	        <li class="nav-secondary"><a href="#">Portfolio</a></li>
	        <li class="nav-secondary"><a href="#">Jobs</a></li>
	      </ul>
	  </nav>				
	</div>
	
	<form>
		<table>
		<caption><h1 style = "font-family: serif; margin-left: -8%;" align = "center"> 커뮤니티 게시판</h1>
			<c:if test = "${sessionScope.loginVo.nickname != null}">	
				<input type = "button" value = "게시글 작성" onclick = "location.href = '/community?writing=writing'" style = "margin-left: 85%; width: 89px;"> 		
			</c:if>
		</caption>
			
			<thead>
				<tr align = "center">
					<th style = "width:5%;">제목</th>
					<th style = "width:15%;">제목</th>
					<th style = "width:25%;">내용</th>		
					<th style = "width:15%;">등록날짜</th>	
					<th style = "width:10%;">작성자</th>		
					<th style = "width:5%;">조회수</th>			
					<th style = "width:10%;">추천</th>			
				</tr>
			</thead>
			<tbody>
			<c:forEach var = "com" items = "${comList}">
				<tr align = "center">
					<td>${com.com_count}</td>
					<td>${com.com_title}</td>
					<td>${com.com_detail}</td>
					<td>${com.com_create_dt}</td>
					<td>${com.com_nickname}</td>
					<td>${com.com_cnt}</td>
				<c:if test = "${sessionScope.loginVo.nickname != null}">
					<c:set var = "iscommen" value = "N"/>
					<c:forEach var = "cntList" items = "${cntList }">
						<c:if test ="${!empty cntList }">
							<c:if test = "${cntList.recommen_number == com.com_count }">
								<c:set var = "iscommen" value = "Y"/>
							</c:if>							
						</c:if>
					</c:forEach>
					<c:if test = "${iscommen == 'Y' }">					
						<td name = "recount"><a onclick = "comLike(this,'${com.com_count}','${com.com_title}','${com.com_detail}','${sessionScope.loginVo.nickname}','${iscommen}')">
						<span>${com.com_like}</span>&nbsp;&nbsp;<i class="far fa-thumbs-up"></i></a></td>
					</c:if>
					<c:if test = "${iscommen == 'N' }">					
						 <td name = "recount"><a onclick = "comLike(this,'${com.com_count}','${com.com_title}','${com.com_detail}','${sessionScope.loginVo.nickname}','${iscommen}')">
						<span>${com.com_like}</span>&nbsp;&nbsp;<i class="fas fa-thumbs-up"></i></a></td> 
					</c:if>
				</c:if>
				<c:if test = "${sessionScope.loginVo.nickname == null}">
					<td name = "recount"><a onclick = "alert('로그인후 이용 가능합니다.')">
					<span>${com.com_like}</span>&nbsp;&nbsp;<i class="fas fa-thumbs-up"></i></a></td> 
				</c:if>
				</tr>														
			</c:forEach>
			</tbody>
		</table>
	</form>
	
<script>
	function logout(){
		
		var logout = confirm("로그아웃 하시겠습니까?");
		
		if(logout){
			location.href = "/logout";
		}
	}
		
	function comLike(target,count,title,detail,nickname, iscommen){
		var likeTarget = $(target).find('i')[0];
		var compar = likeTarget.className == 'fas fa-thumbs-up' ? 'Y' : 'N';
		var likespen = $(target).find('span');
		
		var param = { count : count	,
					  title : title ,
					  detail : detail,
					  nickname : nickname
					}
		// N 일때 좋아요 증가
		if(compar == 'Y'){
			alert('추천 완료하였습니다.');
				 $.ajax({
				    type : 'POST',
				    url : "/comLikePlus",
				    data : param ,
				    error : function(error) {
				        alert("Error!");
				    },
				    success : function(data) {
				    	likespen.text(Number(likespen.text()) + 1);
				        likeTarget.className = 'far fa-thumbs-up';
				    },
				    complete : function() {
				    }
				}); 
		}else{
			alert('추천 취소되었습니다.');
				 $.ajax({
				    type : 'POST',
				    url : "/comLikeMinus",
				    data : param ,
				    error : function(error) {
				        alert("Error!");
				    },
				    success : function(data) {
				    	likespen.text(Number(likespen.text()) - 1);
				        likeTarget.className = 'fas fa-thumbs-up';
				    },
				    complete : function() {
				    }
				});  
		}	
				
	}
	
</script>
	
	
</body>
</html>