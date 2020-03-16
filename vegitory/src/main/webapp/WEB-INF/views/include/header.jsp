<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> VEGITORY :: 산뜻한 식단 </title>
<link rel="stylesheet" type="text/css" href=${path}/resources/css/common.css>
	<style type="text/css">
		*{
			font-family: 'Nanum Gothic', sans-serif;
			z-index: 999;
		}
		div.header_wrap {
			position: fixed;
			top: 0;
			width: 100%;
			background-color: #E2D6C1;
			box-shadow: 0 0 10px 10px rgba(20,23,28,0.03), 0 3px 1px 0 rgba(20,23,28,0.03);
			z-index: 999;
		}
		div.header_content {
			width: 1400px;
			margin: 0 auto;
			height: 70px;
			box-sizing: border-box;
			background-color: #E2D6C1;
			display:flex;/*가로여백 맞추기*/
			align-items: center;
			justify-content: space-around;
			z-index: 999;
		}

		.header_content_logo > a {
			display: flex;
			align-items: center;
			z-index: 999;

		}
		.header_content_search {
			height: 45px;
			z-index: 999;
		}
		.header_content_search_group {
			width: 100%;
			display: flex;
			align-items: center;
			justify-content: space-between;
			background-color: white;
			border-radius: 2px;
			z-index: 999;
		}
	
		.header_content_nav { 

			display: flex;
			align-items: center;
			justify-content: space-between;
			width:267px;
			z-index: 999;

		}
		.header_content_nav > div {
			font-size: 20pt;
			z-index: 999;
		}
		.header_content_member{
			/*width: 160px;*/
			display: flex;
			align-items: center;
			justify-content: space-between;
			flex-direction: row;
			z-index: 999; /*default(생략가능)*/
		}
		.header_content_member > div {
			padding: 10px 0px 10px 3px;
			z-index: 999;
		}
		.header_content_dropdown_group {
			position: relative;
			z-index: 999;
		}
		.header_content_dropdown_group > a {
			display: inline-block;
			padding: 14px 15px 12px 10px;
			font-weight: 400;
			border-radius: 2px;
			height: 45px;
			color: #506763;
			line-height: 19px;
			font-size: 14px;
			z-index: 999;

		}
		.header_content_dropdown_group > a:hover {
			background-color: transparent;
			border-color: #506763;
			z-index: 999;
			
		}
		.header_content_member_cart > a {
			display: inline-block;
			width: 45px;
			height: 45px;
			border-radius: 2px;
			color: #506763;
			border: 1px solid transparent;
			text-align: center;
			padding-top: 16px;
			line-height: 19px; 
			z-index: 999;
		}
		.header_content_dropdown_wrap:hover .header_dropdown{
			display:block;
			z-index: 999;
		}

		.header_content_dropdown_wrap:hover > a,
		.header_content_member_cart:hover > a {
			background-color: rgba(20,23,28,.05);
			border-color: rgba(20,23,28,.05);
			z-index: 999;
		}
		.header_content_logo_img {
			width: 180px;
			height: 65px;
			padding-left: 20px;
			margin-right: 10px;
			font-size:20pt;
			color: #3f6e58;
			line-height: 65px;
			text-align: center;
			z-index: 999;
		}
		.header_logo_img {
			margin-right: -15px; 
			z-index: 999;
		}
		.header_content_search_btn {
			color:white;
			float: right;
			width: 40px;
			height: 40px;
			border-color: transparent;
			background-color: transparent;
			cursor: pointer;
			color:#3f6e58;
			outline:none;
			border-top-right-radius:2px;
			border-bottom-right-radius: 2px;
			z-index: 999;
		}

		.header_content_search_input {
			background-color: transparent;
			border-color: transparent;
			border-radius: 2px;
			padding: 10px 12px;
			font-size: 13px;
			width: 300px;
			height: 40px;
			color: #686f7a;
			outline:none; /*input태그 focus시 파란테두리*/
			z-index: 999;
		}
		.header_content_search_btn:hover {
			background-color: #3f6e58;
			color:white;
			z-index: 999;
		}
		.header_dropdown_menu {
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			box-shadow: 0 4px 16px rgba(20,23,28,.25);
			background-color:white;
			padding: 10px 0;
			position: relative;
			z-index: 999;
			
		}
		.header_dropdown_menu a {
			width: 150px;
			display: inline-block;
			font-size: 13px;
			color: #505763;
			text-align:center;
			padding: 5px 15px; 
			font-weight: 400;
			position: relative;
			z-index: 999;
		}
		.header_dropdown_menu a:hover {
			color: #007791;
			background-color: #f2f3f5;
			position: relative;
			z-index: 999;
		}
		.header_dropdown {
			position: absolute;
			top:45px;
			left:0; 
			display: none;
			z-index: 999;

		}
		.arrow {
			position:absolute;
			top:-5px;
			left:5px; 
			width: 12px;
			height: 12px;
			background-color: red;
			border-color: transparent transparent #fff transparent;
			background-color: white;
			transform: rotate(45deg);
			z-index:999;	
		}
		
		/*로그인 & 가입하기 버튼 */
		
		button.btn {
			display: inline-block;
			font-weight: 600;
			text-align: center;
			font-size: 15px;
			border-radius: 5px;
			padding: 10px 10px;
			width: 100%;
			height: 100%;
			cursor: pointer;
			border: 1px solid transparent;	
		}
		
		button.btn_basic {
			border: 1px solid #686f7a;
			background-color: white;
			color: #686f7a;
		}
		button.btn_basic:hover {
			color: #2f3138;
			border-color: #2f3138;
		}
		button.btn_primary {
			background-color: #498268;
			color: white;
		}
			
		button.btn_primary:hover {
			background-color: #3f6e58;
			border-color: transparent;
		}
					
		/*모달 로그인 창*/
		.header_modal_wrap {
			position: fixed;
			top: 0;
			z-index: 1000;
			background-color: rgba(0,0,0,0.3);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			display: none;
		}
		.modal_content {
			position: relative;
			width: 430px;
			height: 365px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
						0 4px 20 px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			padding: 15px; 
			box-sizing: border-box;
			overflow: hidden;
			color: rgba(0,0,0,0.6);
		}
		.welcome {
			width: 100%;
			text-align: center;
			padding: 10px;
			margin-bottom: 20px; 
			color: #a48443;
			font-size: 17px;

		}
		.login_close {
			position: absolute;
			top: 10px;
			right: 10px;
		}
		.login_close > button {
			color: rgb(142, 142, 142, 0.8);
			border: none;
			background:white;
			font-size:25px;
			cursor: pointer;
			outline: none;
		}
		
		.login_section {
			display: flex;
			justify-content: space-around;
			align-items: center;
			margin-bottom: 12px;
		}

		.id_option {
		
			display: flex;
			align-items: center;
			font-size: 12px;
			width: 375px;
			padding: 0 10px 20px 14px;
			
			
		}
		.signup{
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			border-top: 1px solid rgba(0,0,0,0.2);
			margin: 0px 12px 0 12px;
		}
		.warning_notice{

			font-size: 11.5px;
			padding: 5px 0 3px 0px;
			color:  #a48443;
			visibility: hidden;
		}
		.signup_notice{

			font-size: 11.5px;
			padding: 0 0 15px 0px;
		}
		.signup_btn > button {
			font-size: 13px;
			color: #a48443;
			text-decoration: underline;
			background-color: transparent;
			border:none;
		}
		.div_input {
			width: 270px;
			margin-right: -20px;
		}

		.div_input input {
			font-size: 14px;
			color: #2F3138;
			outline: none;
			height: 35px;
			background-color: #EEE;
			border: 1px solid #EEE;
			width: 100%;
			height: 40px;
			border-radius: 3px;
		}
		.div_id {
			position: relative;
			display: flex;
			justify-content: space-between;
			align-items: center;
			background-color: #EEE;
			border: 1px solid #EEE;
			border-radius: 3px;
			padding: 2px; 
			color: #636e72;
		}
		.div_id > i {
			padding: 0 12px; 
		}
		
		.area {
			height: 6px;
		}
		.login_btn > button{

			color: white;
			border: 1px solid #3f6e58;
			background-color: #3f6e58;
			height: 98px;
			width: 98px;
			display: flex;
			align-items: center;
			justify-content: center;
			cursor: pointer;
			font-size: 15px;
		}
	
		.save_id {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.save_id > input:checked +label {
		}
		.forgot_id {
			padding-left: 40px;
		}
		.pw_eye {
			position: absolute;
			color: #AAA;
			font-size: 15px;
			top:0px;
			right: 7px;
			cursor: pointer;
			height: 35px;
			line-height: 35px;
			width: 35px;
			text-align: center;
			padding-top: 15px;
		}
		.top_btn {
			position: fixed;
			display: flex;
			justify-content: center;
			align-items: center;
			right:5px;
			bottom:5px;
			width: 50px;
			height: 50px;
			font-size: 30px;
			border-radius: 50%;
			background-color: transparent;
			color: #498268;
			cursor: pointer;
		}
		
	</style>
</head>
<body>
	<div class="header_modal_wrap">
		<div class="modal_content">
			<div class="login_close"><button><i class="fas fa-times"></i></button></div>
			<div class="welcome"><span id="login">LOGIN</span> </div>
			<form name="" action="" onsubmit="return false;">
			<!-- onsubmit이 하는 역할: html5 유효성체크는 하면서 submit은 안하게 하기. ajax쓰려면 페이지 전환을 하면 안되니까 -->
				<div class="login_section">
					<div class="div_input">
						<div class="div_id">
							<i class="far fa-user"></i>
							<input type="text" placeholder="아이디" required class="login_input" id="login_id">
						</div>
						<div class="area"></div>
						<div class="div_id">
							<i class="fas fa-unlock"></i>
							<input type="password" placeholder="비밀번호" required minlength="6" maxlength="18" class="login_input" id="login_pw">
							<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
						</div>	
					</div>
					<div class="login_btn"> 
						<button type="submit" id="btn-login">로그인</button>
						<!-- button타입을 submit으로 하면 enter키로 login동작하는 것이 가능해짐 -->
					</div>	
				</div>
		</form>

		<div class="id_option">
			<div class="save_id">
				<input type="checkbox" id="saveid">
				<label for="saveid" class="label1"> 아이디 저장하기</label>
			</div>
			<div class="forgot_id">
				<a href="#" id="forgotid">아이디</a>
				<span>/</span>
				<a href="#" id="forgotpw">비밀번호</a> 
				<span>찾기</span>
			</div>	
		</div>
		
		<div class="signup">
			<div class="warning_notice">
				로그인 중 문제가 발생하였습니다. 아이디 및 비밀번호를 확인해주세요.
			</div>
			<div class="signup_notice">
				VEGITORY에 로그인 하시려면 회원가입을 하셔야 합니다.<br>
				VEGITORY 회원이 되시면 기본 포인트 적립, 리뷰 포인트 적립, 이벤트 참여,
				특별 사은품 증정 등 여러가지 혜택을 받으실 수 있습니다. 
			</div>
			<div class="signup_btn"> 
				<button type="button">회원가입</button>
			</div>	
		</div>
		
		</div>
	</div>





	<header>
		<div class="header_wrap">
			<div class="top_btn"><i class="fas fa-arrow-up"></i></div>
			<!-- wrap : 모니터 사이즈 상관없게 하려고 백그라운드로 깔아두는 것. wrap충돌 때문에 앞에 header를 붙여주는 것 -->
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#">
					<img class="header_logo_img" src="${path}/resources/img/avocado-removebg-preview.png" width="40px" height="40px">	
					<span class="header_content_logo_img">VEGI-TORY</span>
					</a>
				</div>
				<div class="header_content_search">
					<form name="" action="" method="GET">
						<div class="header_content_search_group">
						<input type="text" placeholder="상품/레시피 재료 검색" name="keyword" class="header_content_search_input">
						<button type="button" class="header_content_search_btn"><i class="fas fa-search"></i></button>
						</div>
					</form>
				</div>

				<div class="header_content_nav">

					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
						<a href="#" class="magicline">식료품</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
									<ul class="header_dropdown_menu">
										<li><a href="#">콩고기</a></li>
										<li><a href="#">베이커리</a></li>
										<li><a href="#">소스</a></li>
										<li><a href="#">액체류</a></li>
										<li><a href="#">조미료</a></li>
									</ul>	
							</div>
						</div>
					</div>

					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">레시피</a>
								<div class="header_dropdown">
									<div class="arrow"></div>
										<ul class="header_dropdown_menu">
											<li><a href="#">동양식 메인요리</a></li>
											<li><a href="#">서양식 메인요리</a></li>
											<li><a href="#">베이커리/디저트</a></li>
											<li><a href="#">음료</a></li>
										</ul>	
									</div>
								</div>	
							</div>

					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">커뮤니티</a>
								<div class="header_dropdown">
									<div class="arrow"></div>
										<ul class="header_dropdown_menu">
											<li><a href="#">비건뉴스</a></li>
											<li><a href="#">자유게시판</a></li>
											<li><a href="#">QnA게시판</a></li>
											<li><a href="#">Review게시판</a></li>
										</ul>	
								</div>
							</div>
						</div>	
				</div>	

					<div class="header_content_member">
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>
					<div>
						<div class="header_content_dropdown_wrap">
							<div class="header_content_dropdown_group">
								<a href="${path}/member/mypage">마이페이지</a>
								<div class="header_dropdown">
									<div class="arrow"></div>
										<ul class="header_dropdown_menu">
											<c:if test="${not empty userid}">
											<li><a href="${path}/member/mypage">마이페이지</a></li>
											</c:if>
											<li><a href="#">위시리스트</a></li>
											<li><a href="#">최근주문정보</a></li>	
											<li><a href="#">고객센터</a></li>
										</ul>	
								</div>
							</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty userid}">
						<div><button type="button" class="btn btn_basic login_open">로그인</button></div>
						<div><button type="button" id="header_btn_join" class="btn btn_primary">회원가입</button></div>
					</c:when>
					<c:otherwise>
						<div><span>${name} </span><span style="color:#498268">ON &nbsp;&nbsp;</span></div>
						<div><button type="button" class="btn btn_basic" id="header_btn_logout">로그아웃</button></div>
					</c:otherwise>
				</c:choose>
					<!--<c:if test="${empty sessionScope.userid}"></c:if> if문이 딱 하나밖에 없을 때 쓰는 방법-->
		
					
					
				</div>
				</div>
		</div>
	</header>
</body>
	<script type="text/javascript">
	
	$(function(){
		var msg = '${message}';
		
		if(msg == 'nologin'){
			$('.header_modal_wrap').css('display','flex');
			$('#login_id').focus();
			$('.warning_notice').css('visibility','visible')
								.text('로그인이 필요한 기능입니다.');
		}
	});
		//jQuery 문법
		//$('선택자').옵션();
		//$('.test').css('color','green');
		//$ = jQuery
		//('.test') = 선택자 class가 test
		//.css() = 옵션(글자색을 녹색);
		
		//jQuery 이벤트 문법 (클릭, 포커스, 블러 등)
		//$(document).on('이벤트', '선택자', function(){ 이벤트 발생시 동작할 내용들 });
		//$(document).on('click','.test',function(){
		//	$(this).css('color','blue');
		// });
		//$(document).on() = 문서 전체에서~
		//('click') = 클릭 이벤트가 발생하면
		//('.test') = 클래스가 test인
		//function() {} = 익명함수(이름이 없는 함수)
		//$(this) = 나 자신(여기서는 .test)
		//해석 : 문서전체에서 class가 test인 태그가 클릭되면 
		// 나의 (.test) 글자색을 'blue'로 변경해라!

		//로그인 버튼 클릭시 modal창 open
		$(document).on('click','.login_open', function(){
			$('.header_modal_wrap').css('display','flex');
			$('#login_id').focus();
		});

		//로그인 input(id,pw)에 focus되면 테두리색 변경
		$(document).on('focus','.div_id', function(){
			$(this).css('border','1.5px solid #3f6e58');
		});
		$(document).on('blur','.div_id', function(){
			$(this).css('border','1.5px solid #EEE');
		});

		//modal창의 x버튼을 클릭하면 modal창 close
		$(document).on('click','.login_close', function(){
			$('.header_modal_wrap').css('display','none');
			//$('.frm_login')[0].reset();
			$('.login_input').val('');
			$(this).prev().attr('type','password');
				$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
					   .css('color','#aaa');
			$('.warning_notice').css('visibility','hidden');	
		});

		//값을 가져오는 방법
			//<span class="aaa">동토리</span>
			//<input type="text" class="dobby">동비</span>
			//
			//input태그 값 가져오는 방법
			//$('.dobby').val();
			//input태그 값 넣는 방법
			//$('.dobby').val('메롱');
			//
			//input 태그 이외의 값 가져오는 방법
			//$('.aaa').text();
			//input 태그 이외의 값 넣는 방법
			//$('.aaa').text('뭐시여??');

			// 태그의 옵션(attribute)을 가져오고 싶을 때
			//$('.dobby').attr('type');
			//$('.dobby').attr('class');

		// LOGIN Modal창 암호 보이기 or 숨기기
		// 나보다 형 prev()
		// 나보다 동생 next()
		$(document).on('click','.pw_eye', function(){
			var code = $(this).prev().attr('type');
			if(code== 'password') {
				$(this).prev().attr('type','text');
				$(this).html('<i class="fas fa-eye"></i>')
					   .css('color','#666');
			} else {
				$(this).prev().attr('type','password');
				$(this).html('<i class="fas fa-eye-slash"></i>')
					   .css('color','#aaa'); //이것처럼 계속해서 .html, .css 등등 옵션주는걸 체이닝 기법이라고 한다.
			}
		});	
		
		//LOGIN버튼 클릭시 AJAX 동작
		$(document).on('click','#btn-login', function() {
			var id = $('#login_id').val();
			var pw = $('#login_pw').val();
			
			//login기능에서는 유효성체크를 null만 해주면 됨.
			if(id != '' && pw != '' && id.length !=0 && pw.length !=0) { //1.값이 있는지 없는지 체크
				$.ajax({
					url: '${path}/login/in',
					type: 'POST',
					data: 'id='+id+'&pw='+pw,
					success: function(data) {
						console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+data);
						
						if(data == 0 || data == 3){
							$('.warning_notice').css('visibility','visible')
							.text('로그인 중 문제가 발생했습니다. 아이디 및 비밀번호를 확인하거나 계정을 생성하십시오.');
						}else if(data == 1) {
							console.log('로그인 성공');
							location.reload();
						}else if(data == 2) {
							$('.warning_notice').css('visibility','visible')
							.text('이메일 인증 후 로그인 할 수 있습니다.');
						} 
					},
					error: function() {
						alert(' System Error :( ');
					}
				});
					} 			
		});
	
		
		$(document).on('click','#header_btn_join',function(){
				location.href="${path}/member/constract";
		});
		/* Header 가입하기 버튼 클릭시 동의 페이지로 이동*/
		$(document).on('click','.signup_btn > button',function(){
				location.href="${path}/member/constract";
		});
		
		$(document).on('click','.top_btn', function(){
			$('html, body').animate({scrollTop : 0}, 600);
		});
		
		/*로그아웃 기능*/
		$(document).on('click','#header_btn_logout', function(){
			$.ajax({
				url: '${path}/login/out',
				type:'POST',
				success: function(){
					console.log(' Logout Success :) ');
					location.reload();
				},
				error: function() {
					alert(' System Error:( ');
				}
				
			});
		});
	</script>
</html>