<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> VEGITORY :: 회원가입 </title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
	<style type="text/css">
		*{
			box-sizing: border-box;
		}
		.wrap{
			width: 820px;
			margin: 0 auto;
		}
		h1 > a {
			display: flex;
			align-items: flex-end;
			justify-content: center;
			font-size: 50px;
			font-weight: 500;
			color: #3f6e58;
			padding: 20px 0; 
		}
		.section_wrap {
			width: 100%;
			height: 920px;
			background-color: white;
			border-top: 3px solid #498268;
			
		}
		section {
			padding: 50px 66px 60px 66px;
		}
		.join_row {
			margin: 10px;
		}
		.last_row {
			margin-bottom: 5px;
		}
		.ps_box {
			display: flex;
			justify-content: space-between;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background : #fff;
			vertical-align: top;
			line-height: 30px;
		}
		.join_info_box_input{
			display: block;
			position: relative;
			width: 415px;
			margin-right: 25px;
			height: 29px;
			line-height: 29px;
			border: none;
			font-size: 15px;
			z-index: 10;
		}
		.input_notice {
			font-size: 12px;
			color: rgba(0,0,0,0.6);  
		}
		.email_box {
			position: relative;
			width: 210px;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px;
			vertical-align: top; 
		}
		.email_box2 {
			
			position: relative;
			width: 210px;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			vertical-align: top; 
		}
		.email_box3 {
			position: relative;
			width: 210px;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px;
			vertical-align: top; 
		}
		#uemail1 {
			border: none; 
		}
		#uemail2 {
			border: none; 
		}
		input, select {
			width: 150px;
			height: 30px;
			box-sizing: border-box;
		}
		#wrap_email {
			display: flex;
			justify-content: space-around;
			align-items: center;
			padding: 5px;
			box-sizing: border-box;
			overflow: auto;
		}
		#wrap_eamil > # {
			float: left;
			margin-right: 10px;
		}
		#email_id {
			position: relative;
			border: none;
			width: 100%;
			font-size: 15px;
		}
		#selmail {
			border: none;
			outline: none;
			width: 100%;
			color: rgba(0,0,0,0.6);
			font-size: 15px;
		}
		.checkbox {
			position: relative;
			width: 100%;
			display: flex;
			justify-content: flex-start;
			font-size: 12px;
			color: rgba(0,0,0,0.6);
		}
		#cbox {
			width: 15px;
			height: 15px;
			margin-left: 10px;
		}
		.btn_primary {
			background-color: #498268;
			color: white;
		}
		#btn_join {
			border: none; 
			display: block;
			margin: auto;
			width: 250px;
			height: 56px;
			text-align: center;
			line-height: 56px;
			font-weight: 550; 
			margin-top: 30px;
			cursor: no-drop;
		}
		.join_btn > a:hover {
			background-color:#3f6e58; 
		}
		.zipcode {
			width: 100%;
			display: flex;
			justify-content: flex-start;
		}
		#btn_post {
			width: 200px;
			height: 51px;
			background-color: #498268;
			font-size: 12px;
			color: white;
			font-weight: 500;
			text-align: center;
			line-height: 51px;
			border:none;
			cursor: pointer;
		}
		#btn_post:hover {
			background-color:#3f6e58;
		}
		.area {
			height: 6px;
		}
		.warning {
			font-size: 12px;
			color: red;
			visibility: hidden;
		}
		.warning2 {
			font-size: 12px;
			color: red;
			margin-left: 8px;
			visibility: hidden;
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
			<h1 class="vegitory_logo"><a href="#" class="n_logo">
				<img src="../../img/avocado-removebg-preview.png" width="60px" height="60px">SIGN UP
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
			<form name="frm_join" action="" method="POST">
			<div class="row_group">
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="uid" name="uid" class="join_info_box_input" placeholder="아이디">
						<span class="input_notice">3~15자의 영문/숫자를 조합하여 입력</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="upw" name="upw" class="join_info_box_input" placeholder="비밀번호">
						<span class="input_notice">8~16자의 영문/숫자를 조합하여 입력</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="urpw" name="urpw" class="join_info_box_input" placeholder="비밀번호 재확인">
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="uname" name="uname" class="join_info_box_input" placeholder="이름">
						<span class="input_notice">한글 15자 영문 30자까지 가능합니다.</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				

				<div id="wrap_email">
					<div class="email_box">
						<input type="text" id="uemail1" name="uemail" class="join_info_box_input2" placeholder="이메일">
					</div>
					<span> @ </span>
					<div class="email_box2">
						<input type="text" id="uemail2" class="join_info_box_input2" placeholder="Email 선택">
					</div>
					<div class="email_box3">
						<select id="selmail">
						<option value="" selected="selected">Email 선택</option>
						<option value="directVal">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select>
					</div>
				</div>
				<div class="checkbox">
				<input type="checkbox" id="cbox">
					<label for="cbox">
						이벤트 및 혜택정보 이메일 수신동의 (선택)
					</label>
				</div>
				<div class="warning warning2">*필수입력사항입니다. </div>
				
				<div class="join_row last_row">
					<span class="ps_box int_id">
						<input type="text" id="uphone" name="uphone" class="join_info_box_input" placeholder="휴대폰">
						<span class="input_notice">-빼고 입력, 예) 01012345678 </span>
					</span>
					
				</div>
				<div class="checkbox">
				<input type="checkbox" id="cbox">
					<label for="cbox">
						이벤트 및 혜택정보 카카오톡/SMS 수신동의 (선택)	
					</label>	
				</div>
				<div class="warning warning2">*필수입력사항입니다. </div>
				<div class="join_row">
					<div class="zipcode"> 
					<span class="ps_box int_zipcode">
					<input type="text" id="sample6_postcode"
						   name="id" class="addr_only join_info_box_input" placeholder="우편번호" readonly value="12345">
					</span>
					<input type="button" id="btn_post" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class= area></div>
					<span class="ps_box int_ad">
					<input type="text" id="sample6_address" name="id" class="addr_only join_info_box_input" placeholder="주소" readonly><br>
					</span>
					<div class= area></div>
					<span class="ps_box int_detail_ad">
					<input type="text" id="sample6_detailAddress" name="id" class="join_info_box_input" placeholder="상세주소">
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_btn">
					<button type="button" id="btn_join">베지토리 회원가입</button>
				</div>
			</div>
		</form>	
		</section>
	</div>
	<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
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
</html>