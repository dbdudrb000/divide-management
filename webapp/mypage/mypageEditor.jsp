<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editor Page</title>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<!-- Detail Scripts -->
	<script src="${contextPath}/resources/js/divide_detail.js"></script>
	<%-- <link rel="stylesheet" href="${contextPath}/resources/css/divide/divide_detail.css"> --%>

	<!-- <link rel="stylesheet" href="/resources/css/divide/divideMain.css">	
	<link rel="stylesheet" href="/resources/css/divide/divideUserUpdate.css">	 -->
	
	<!-- font Awesome -->
	 <link rel="stylesheet" href="/resources/css/fontawesome/all.css"> 

	<!-- 코드미러 -->
	<link rel="stylesheet" href="${contextPath}/resources/js/CodeMirror-master/lib/codemirror.css">
	<link rel="stylesheet" href="${contextPath}/resources/js/CodeMirror-master/theme/seti.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.35.0/codemirror.js"></script>
	<script src="https://codemirror.net/mode/javascript/javascript.js"></script>
	<script src="//cdn.jsdelivr.net/codemirror/3.21.0/mode/xml/xml.js" type="text/javascript"></script>
	<script src="//cdn.jsdelivr.net/codemirror/3.21.0/mode/htmlmixed/htmlmixed.js" type="text/javascript"></script>
	<script src="//cdn.jsdelivr.net/codemirror/3.21.0/mode/css/css.js" type="text/javascript"></script>

	<!-- Editor css -->
	<link rel="stylesheet" href="/resources/css/divide/divide_Editor.css">
	<style>
		 .divideBoby{
/* 				background-image: url('/resources/images/Positive.jpg'); */
/* 				background-size: cover; */
		}
		
		.skill_menu{
 			background-color: antiquewhite;
 			text-align: center;
 		}
 		
		/* ㅇㅇ */
		
		button,
button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  background-color: plum;
  border-radius: 5px;
  color: initial;
  display: block;
  font-weight: bold;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}

/* BUTTON 1 */
.btn-1::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}

.btn-1:hover:after {
  height: 100%;
}

	</style>

</head>
<body class = "divideBoby">

	<main class="codepen">
			<a onclick = "arrow('htmlArrow')" id = "htmlArrow" style = "display:none;"><i class="fas fa-arrow-alt-circle-right"></i></a>
		<section id="html" style = "display:block;">
			<h2>HTML  <a onclick = "arrow('htmlArrow')"><i class="fas fa-arrow-alt-circle-left"></i></a></h2>
			<div class="code">
				<textarea id='editor'>${editorList.cs_html}</textarea>
				<input type="hidden" name="cs_func_id" value = "${editorList.cs_func_id}"/>
			</div>
		</section>
			<a onclick = "arrow('cssArrow')" id = "cssArrow" style = "display:none;"><i class="fas fa-arrow-alt-circle-right"></i></a> 
		<section id="css" style = "display:block;">
			<h2>CSS   <a onclick = "arrow('cssArrow')"><i class="fas fa-arrow-alt-circle-left"></i></a> </h2>
			<div class="code">					  
				<textarea id='editor2' >${editorList.cs_css}</textarea>
			</div>
		</section>
			<a onclick = "arrow('jsArrow')" id = "jsArrow" style = "display:none;"><i class="fas fa-arrow-alt-circle-right"></i></a> 
		<section id="js" style = "display:block;">
			<h2>JS  <a onclick = "arrow('jsArrow')"><i class="fas fa-arrow-alt-circle-left"></i></a></h2>
			<div class="code">
				<textarea id='editor3'>${editorList.cs_js}</textarea>
			</div>
		</section>	
  					
	</main>
	<spen align = "center" style = "display: inline-flex; margin-left:45%;">
	 	<button class="btn-1" onclick = "history.back()">뒤로가기</button>
	 	<button class="btn-1" onclick = "upsertCode()">코드수정하기</button>
	</spen>
	

	<div id="div_iframe">
		<iframe id="viewer_iframe" name="CodePen" allowfullscreen="true" sandbox="allow-forms allow-modals allow-pointer-lock allow-popups allow-presentation allow-same-origin allow-scripts allow-top-navigation-by-user-activation" allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; microphone; midi; payment; vr" allowtransparency="true" allowpaymentrequest="true">
		</iframe>
	</div>
	
	
	
	<script>
	$(document).ready(function() {
		console.log('Are U Ready?');
		//최초 실행
		init();
		//이벤트 부착
		attachEventListener();
		
		//셋팅
		setting();
	});
		
		
	function attachEventListener(){
		console.log('I AM READY ');
		
		editor.on("change", function (cm_editor, info){
			console.log('I AM Editor ABOUT HTML');
			var jsx = editor.getValue();
	        $("#viewer_iframe").contents().find("#chalfunction").remove();
			var s = $("#viewer_iframe").contents()[0].createElement('script');
			s.setAttribute("id", "chalfunction");
			
			var jax = editor2.getValue();
			var as = document.createElement('style');
			as.setAttribute("id", "style");
			as.textContent = jax;
				
			//JS Editor 값을 셋팅
			s.text = editor3.getValue();
			jsx += s.outerHTML;
			jsx += as.outerHTML; 
			console.log(jsx);
// 			$("#viewer_iframe").contents()[0].open();
			if($("#viewer_iframe").contents()[0].body){
			   $("#viewer_iframe").contents()[0].body.innerHTML = '';
			}else{
				jsx = '<body>' + jsx + '</body>';
			}
	        $("#viewer_iframe").contents()[0].write(jsx);
	        $("#viewer_iframe").contents()[0].close();
	    });
		
		editor2.on("change", function (cm_editor, info){
			console.clear();
			console.log('I AM Editor ABOUT CSS');
			CodeMirror.signal(editor, "change");
	    }); 
		
		
		editor3.on("change", function (cm_editor, info){
			console.clear();
			console.log('I AM Editor ABOUT JAVASCRIPT');
			CodeMirror.signal(editor, "change");
		    
	    });
		
	}
	
	var editor;
	var editor2;
	var editor3;
	function init(){
		//에디터 그리기
		editor = CodeMirror.fromTextArea(document.getElementById('editor'), {
		    mode: "text/html",
		    lineNumbers: true,
		    theme: "seti",
		});
		 editor2 = CodeMirror.fromTextArea(document.getElementById('editor2'), {
		    mode: "text/css",
		    lineNumbers: true,
		    theme: "seti",
		});
		editor3 = CodeMirror.fromTextArea(document.getElementById('editor3'), {
		    mode: "text/javascript",
		    lineNumbers: true,
		    theme: "seti",
		});
	 		
		editor.save();
		editor2.save();
		editor3.save(); 
	}
	
	function setting(){
		if('${editorList.cs_func_id}'){
			CodeMirror.signal(editor, "change");
			CodeMirror.signal(editor2, "change");
		}
	}
	
	function upsertCode(){
		var data = {
                cs_html   : editor.getValue()
               ,cs_css    : editor2.getValue()
               ,cs_js     : editor3.getValue()
               ,cs_func_id: $("[name=cs_func_id]").val()
           } 

		$.ajax({
		   type : 'POST',
		   url : '/divide/upsertDivideMirror',
		   data : data,
		   error : function(error) {
		       alert("Error!");
		   },
		   success : function(data) {
		       alert("수정완료하였습니다.");
		       location.href = "/mypage";
		   },
		   complete : function() {
		       //alert("complete!"); 
		   }
		});
	}
	// 에디터 열고닫고 하는기능
	function arrow(Arrow){
									
		if(Arrow == "htmlArrow"){
			
			if(document.getElementById('html').style.display == "block"){
				document.getElementById('html').style.display = "none";				
				document.getElementById('htmlArrow').style.display = "block";	
				
			}else if(document.getElementById('html').style.display == "none"){
				
				document.getElementById('html').style.display = "block";
				document.getElementById('htmlArrow').style.display = "none";
			}
			
		}else if(Arrow == "cssArrow"){
			
			if(document.getElementById('css').style.display == "block"){
				document.getElementById('css').style.display = "none";				
				document.getElementById('cssArrow').style.display = "block";	
				
			}else if(document.getElementById('css').style.display == "none"){
				
				document.getElementById('css').style.display = "block";
				document.getElementById('cssArrow').style.display = "none";
			}
					
		}else{
			
			if(document.getElementById('js').style.display == "block"){
				document.getElementById('js').style.display = "none";				
				document.getElementById('jsArrow').style.display = "block";	
				
			}else if(document.getElementById('js').style.display == "none"){
				
				document.getElementById('js').style.display = "block";
				document.getElementById('jsArrow').style.display = "none";
			}							
		} 
	}	

	</script>



</body>
</html>