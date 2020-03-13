<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<script src="https://kit.fontawesome.com/3062584ccb.js" crossorigin="anonymous"></script>
	<title>VEGITORY :: 마이페이지</title>
	<link rel="stylesheet" type="text/css" href=${path}/resources/css/common.css>
	<style type="text/css">
		*{
			box-sizing: border-box;
		}
		.wrap{
			width: 1220px;
			height: 970px;
			margin: 50px auto;
		}
		body {
			background-color: #E2D6C1;
		}
		h1 > a {
			display: flex;
			align-items: flex-end;
			font-size: 50px;
			font-weight: 500;
			color: #3f6e58;
			text-decoration: none;
		}
		.section_wrap {
			width: 100%;
			height: 100%;
			background-color: white;
			border-top: 5px solid #216353;
			
		}
		section {
			display: flex;
			justify-content: flex-start;
			height: 100%;
		}
		.side_section{
			padding-top: 10px;
			width: 20%;
			height: 100%;
			background-color:  #7a4d1d;
			
		}
		.side_section li{
		padding: 12px 0px 12px 0px;
		color: white; 
		font-size: 15px;
		font-weight: 400;
		text-align: center;
		transition: transform .5s;
		}
		
		.side_section li:hover {
		background-color: #694219;
		transform: scale(1.2);
		}
		

		.content_section{
			width: 80%;
			height: 100%;
			display: flex;
			flex-direction: column;
			align-items: center;
			
		}
		.profile_area{
			padding: 20px 0;
		}
		.information_area li {
			text-align: center;
			font-size: 16px;
		}
	
		#footer {
			padding: 15px 0;
		}
		#footer > ul {
			margin-top: 0 auto 9px;
			text-align: center;
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover {
			color: #498268;
			text-decoration: underline;
		}
		#footer ul li:first-child { /*첫번째 자식만!*/
			border-left: 0px!important; /*느낌표 important쓰면 우선순위가 높아짐. 자주쓰지 않은 것을 추천*/
		}

		#addr_logo {
			width: 63px;
			height: 11px;
		}
		#address{
			margin: 15px auto;
			text-align: center;
		}
		#address * {
			font: 9px verdana;
		}
		#address a {
			font-weight: bold;
		}
		#address a:hover{
			color: #498268;
		}
	</style>	
</head>
<body>
	<div class="wrap">
	<header>
		<div class="header">
			<h1 class="vegitory_logo"><a href="${path}/">
				<img src="${path}/resources/img/avocado-removebg-preview.png" width="60px" height="60px">
				MY PAGE
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
			<div class="side_section">
				<ul>
					<li><a href="#">개인정보조회</a></li>
					<li><a href="#">주문처리현황</a></li>
					<li><a href="#">위시리스트</a></li>
					<li><a href="${path}/member/update">개인정보수정</a></li>
					<li><a href="${path}/member/pwupdate">비밀번호변경</a></li>
					<li><a href="#">내가 쓴 게시글/댓글 조회</a></li>
					<li><a href="${path}/member/drop">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="content_section">
				<div class="profile_area">
					<div class="profile_pic"><img src="${path}/resources/img/31.jpg" width="600px" height="400px"></div>						
				</div>
				<div class="information_area">
					<ul>
						<li>아이디 : ${userid} </li>
						<li>이름 : ${user.name} </li>
						<li>이메일 : ${user.email}@${user.m_url} </li>
						<li>전화번호 : ${user.phone} </li>
						<li>주소 : ${user.addr1} ${user.addr2} </li>
					</ul>
				</div>
			</div>	
		</section>
	</div>
	<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></li></strong>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>

				<div id="address">
					<span>Copyright</span>
					<span>ⓒ</span>	
					<span><strong><a href="#">VEGI Corp.</a></strong></span>
					<span>All Rights Reserved.</span>	
				</div>		
			</div>	
		</footer>	
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</html>