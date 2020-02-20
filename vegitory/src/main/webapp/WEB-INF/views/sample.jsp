<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
	<!-- GET방식은 데이터 받는 칸이 없는데 DATA를 어떻게 전송을 하냐?! -->
	<!-- 바로 쿼리스트링을 이용하는것이다. -->
	<!-- 주소창: localhost:8081/metop/sample/view => ${path}/sample/view?user='배뚱'-->
		
	<form action="${path}/sample/view" method="POST">
		<!-- input, textarea, select, raido, check... 사용자가 check하거나 choice, 입력하는 값만 넘어감 -->
		<input type="text" name="user">
		<input type="password" name="pass">
		<button type="submit">POST</button>
	</form>
	<img src="${path}/resources/img/병아리콩.PNG" style="width: 1300px; height: 800px;">
	<br>
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기: <span id="ajax_txt"></span></span></div>	
</body>
<script type="text/javascript">

	$('#ajax_btn').on('click', function() {
		//type: GET or POST
		//URL: 서버단 목적지(RequestMapping으로 받는 요청)
		//contentType: 서버단으로 전송하는 데이터의 타입
		//data: 서버로 전송하는 실제 데이터
		//dataType: 서버단에서 View단으로 전송하는 데이터 타입(생략: String)
		//success: AJAX 성공햇을 때 작업(DATA: AJAX 서버단 Return값)
		//error: AJAX 실패했을 때 작업
		//Json = {key:value, key:value, key:value}
		$.ajax({
			type:'POST',
			url: '${path}/sample/ajax?name=뚱깐징어',
			//data: {name:'뚱깐징어'},
			success: function(data){
				$('#ajax_txt').text(data);
			},
			error: function() {
				alert(' System ERROR :( ');
			}
		});
	});


</script>
</html>