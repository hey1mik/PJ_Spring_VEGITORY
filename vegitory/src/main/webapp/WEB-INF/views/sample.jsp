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
</body>
</html>