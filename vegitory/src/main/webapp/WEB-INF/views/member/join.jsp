<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> VEGITORY :: 회원가입 </title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		*{
			box-sizing: border-box;
		}
		body {
			background-color: rgb(226, 214, 193);
		}
		.wrap{
			width: 820px;
			margin: 50px auto;
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
		#back{
			position: fixed;
			z-index: 1200;
			background-color: rgba(0,0,0,0.4);
			overlow: auto;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			display: none;
			align-items: center;
			justify-content: center;
		}
		.loading_img {
			animation: ani_loading 1.5s infinite linear;
			font-size: 70px;
			color: #498268;
		}
		
		@keyframes ani_loading {
			from {-webkit-transform: rotate(0deg);}
			to {-webkit-transform: rotate(359deg);}
		}
	</style>
</head>
<body>
	<div class="wrap">
	<header>
		<div class="header">
			<h1 class="vegitory_logo"><a href="${path}/" class="n_logo">
				<img id="avoimg" src="${path}/resources/img/avocado-removebg-preview.png" width="60px" height="60px"><span>SIGN UP</span>
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
			<!--<form id="frm_member" name="frm_member" action="${path}/member/join" method="POST">  -->
			<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
			<div class="row_group">
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="uid" name="id" class="join_info_box_input" placeholder="아이디" value=${user.id}>
						<span class="input_notice">3~15자의 영문/숫자를 조합하여 입력</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="upw" name="pw" class="join_info_box_input" placeholder="비밀번호">
						<span class="input_notice">8~16자의 영문/숫자를 조합하여 입력</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="urpw" name="rpw" class="join_info_box_input" placeholder="비밀번호 재확인">
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_row">
					<span class="ps_box int_id">
						<input type="text" id="uname" name="name" class="join_info_box_input" placeholder="이름" value=${user.name}>
						<span class="input_notice">한글 15자 영문 30자까지 가능합니다.</span>
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				

				<div id="wrap_email">
					<div class="email_box">
						<input type="text" id="uemail1" name="email" class="join_info_box_input2" placeholder="이메일" value=${user.email}>
					</div>
					<span> @ </span>
					<div class="email_box2">
						<input type="text" id="uemail2" name="m_url" class="join_info_box_input2" placeholder="Email 선택" value=${user.m_url}>
					</div>
					<div class="email_box3">
						<select id="selmail">
						<option value="" selected="selected">Email 선택</option>
						<option value="1">직접입력</option>
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
						<input type="text" id="uphone" name="phone" class="join_info_box_input" placeholder="휴대폰" value=${user.phone}>
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
						   name="postcode" class="addr_only join_info_box_input" placeholder="우편번호" readonly value="${user.postcode}">
					</span>
					<input type="button" id="btn_post" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class= area></div>
					<span class="ps_box int_ad">
					<input type="text" id="sample6_address" name="addr1" class="addr_only join_info_box_input" placeholder="주소" readonly value="${user.addr1}"><br>
					</span>
					<div class= area></div>
					<span class="ps_box int_detail_ad">
					<input type="text" id="sample6_detailAddress" name="addr2" class="join_info_box_input" placeholder="상세주소" value="${user.addr2}">
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					</span>
					<div class="warning"> *필수입력사항입니다. </div>
				</div>
				
				
				<div class="join_btn">
					<button type="button" id="btn_join">베지토리 회원가입</button>
				</div>
			</div>
		</form:form>	
		<!-- </form> -->
		</section>
	</div>
	<footer>
				<div id="address">
					<span>Copyright</span>
					<span>ⓒ</span>	
					<span><strong><a href="#">VEGI Corp.</a></strong></span>
					<span>All Rights Reserved.</span>	
				<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
			</div>
		</div>				
		</footer>
	</div>	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
	$(function(){
			
		$('#selmail').change(function(){ 
			$("#selmail option:selected").each(function() {
				if($(this).val()== '1'){ //직접입력일 경우
					$("#uemail2").val(''); //값 초기화 
					$("#uemail2").attr("placeholder","직접입력")
								 .attr("readonly",false);//활성화
				}else{ //직접입력이 아닐경우 
					$("#uemail2").val($(this).text()); //선택값 입력 
					$("#uemail2").attr("readonly",true); //비활성화 
				}
			});
		});

			//비밀번호가 유효한 값인지 체크해주는 Flag값
			var pwFlag = false;
		
			// 유효성체크 여부를 알려주는 배열
			var checkArr = new Array(7).fill(false);
			//printCheckArr(checkArr);
			
			alert('user: '+'${user}');
			if('${user}' !=''){
				// 회원정보수정 디자인 변경
				$('#btn_join').text('수정하기');
				$('h1 > a').css('display','flex')
							.css('align-items','flex-end')
							.css('justify-content','center')
							.css('font-size','50px')
							.css('font-weight','500')
							.css('color','#3f6e58')
							.css('padding','20px 0px');
				$('h1 span').text('Manage Account');
				$('.join_row:eq(1)').css('visibility','hidden')
									.css('height','0');
				$('.join_row:eq(2)').css('visibility','hidden')
									.css('height','0')
									.css('margin-top','-17px');
				
				$('.join_info_box_input:eq(0)').attr('readonly','true')
												.removeAttr('id');
				//여기서 말하는 아이디는 <input>태그의 속성인 id값을 말하는 것! id="id_input" 이런 것
		
				var name = '${user.name}';
				var phone = '${user.phone}';
				var email1 = '${user.email}';
				var email2 = '${user.m_url}';
				var postcode = '${user.postcode}';
				var addr1 = '${user.addr1}';
				var addr2= '${user.addr2}';
				ckName(name);
				ckPhone(phone);
				ckEmail1(email1);
				ckEmail2(email2);
				ckAddr(postcode, addr2);
				checkArr[0] = true;
				checkArr[1] = true;
				printCheckArr(checkArr);
				
			}
			
			function ckDesign(code, desc, line, msg) { // 유효성 체크 통과 한 애	
				if(code ==0 || code == 10) {
				$('.ps_box:eq('+line+')').css('border','1px solid #3f6e58');
				$('.warning:eq('+msg+')').css('visibility','visible')
									   .text(desc)
				                       .css('color','#3f6e58');
				        return false;
				
			} else { //유효성 체크 통과 못 한 애 
				$('.ps_box:eq('+line+')').css('border','1px solid #a48443');
				$('.warning:eq('+msg+')').css('visibility','visible')
									     .text(desc)
				                         .css('color','#a48443');
				       return true;                   
			}
		}

	

			//아이디 유효성 체크:
			$('#uid').keyup(function(){
				//사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
				var id = $(this).val().trim(); // 사용자가 입력한 값
				// validation.js의 checkId로 유효성체크를 실행 후
				// 결과를 result에 담음(code, desc) 
				var result = joinValidate.checkId(id);	
				console.log('유효성코드: '+result.code);
				
				if(result.code == 0) {
					checkArr[0] = 'true';
				} else {
					checkArr[0] = 'false';
				}
				printCheckArr(checkArr);

				// 유효성체크 결과로 테두리색과 err메시지를 출력하는
				// 함수 실행
				ckDesign(result.code, result.desc, 0,0);
				
			});

			//비밀번호 유효성 체크
			$('#upw').keyup(function(){
				//1. 사용자가 입력한 값 받기
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($('#urpw').val());
				//2. 유효성 체크하기
				var result = joinValidate.checkPw("",pw, rpw);
				//3. 체크결과에 따라 디자인
				if(result.code == 0) {
					pwFlag = true;
				} else {
					pwFlag = false;
				}
				ckDesign(result.code, result.desc, 1,1);
				if(result.code == 10) {
					checkArr[1] = true;
					$('.ps_box:eq(2)').css('border','1px solid #3f6e58');
					$('.warning:eq(2)').css('visibility','visible')
										   .text('사용가능한 비밀번호입니다.')
					                       .css('color','#3f6e58');
				} else if(result.code == 6) {
					checkArr[1] = false;
					$('.ps_box:eq(2)').css('border','1px solid #a48443');
					$('.warning:eq(2)').css('visibility','visible')
										     .text('입력하신 비밀번호가 일치하지 않습니다.')
					                         .css('color','#a48443');
				}
				 printCheckArr(checkArr);
			});	

			//비밀번호 재확인 유효성 체크
			$('#urpw').keyup(function(){
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($('#urpw').val());
				var result = joinValidate.checkRpw(pw, rpw, pwFlag);
				if(result.code == 10) {
					checkArr[1] = true;
					$('.ps_box:eq(1)').css('border','1px solid #3f6e58');
					$('.warning:eq(1)').css('visibility','visible')
										   .text('사용가능한 비밀번호입니다.')
					                       .css('color','#3f6e58');
				} else if(result.code == 6) {
					checkArr[1] = false;
					$('.ps_box:eq(1)').css('border','1px solid #a48443');
					$('.warning:eq(1)').css('visibility','visible')
										     .text('입력하신 비밀번호가 일치하지 않습니다.')
					                         .css('color','#a48443');
				} else {
					checkArr[1] = false;
				}
				  	printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 2,2);


			});

			// 이름 유효성 체크
			$('#uname').keyup(function(){
				var name = $.trim($(this).val());
				ckName(name);
			});
				function ckName(name){
					var result = joinValidate.checkName(name);
					ckDesign(result.code, result.desc, 3,3);
					
					if(result.code == 0) {
						checkArr[2] = true;
					} else {
						checkArr[2] = false;
					}
				}

			// 전화번호 유효성 체크
			$('#uphone').keyup(function(){
				var phone = $.trim($(this).val());
				ckPhone(phone);
			});
			
			function ckPhone(phone){
				var result = joinValidate.checkPhone(phone);
				ckDesign(result.code, result.desc, 4,5);
				if(result.code == 0) {
					checkArr[3] = true;
				} else {
					checkArr[3] = false;
				}
				
				if(result.code == 0) {
					$('.ps_box:eq(5)').css('border','1px solid #3f6e58');

				} else {
					$('.ps_box:eq(5)').css('border','1px solid #a48443');
				}
			}

			// 이메일 유효성 체크
			$('#uemail1').keyup(function(){
				var email1 = $.trim($(this).val());
				ckEmail1(email1);
			});
			
			function ckEmail1(email1){
				var result = joinValidate.checkEmail1(email1);

				if(result.code == 0) {
					checkArr[4] = true;
				} else {
					checkArr[4] = false;
				}

				if(result.code == 0) {
					$('.email_box').css('border','1px solid #3f6e58');
					$('.warning:eq(4)').css('visibility','visible')
										     .text(result.desc)
					                         .css('color','#3f6e58');

				} else {
					$('.email_box').css('border','1px solid #a48443');
					$('.warning:eq(4)').css('visibility','visible')
										     .text(result.desc)
					                         .css('color','#a48443');
				}
			}
			
			$('#uemail2').keyup(function(){
				var email2 = $.trim($(this).val());
				ckEmail2(email2);
			});
			$('#selmail').click(function(){
				var email2 = $.trim($(this).val());
				ckEmail2(email2);
			});
			
			
			
			function ckEmail2(email2){
				
				var result = joinValidate.checkEmail2(email2);	

				if(result.code == 0) {
					checkArr[5] = true;
				} else {
					checkArr[5] = false;
				}
				printCheckArr(checkArr);

				if(result.code == 0) {
					$('.email_box2').css('border','1px solid #3f6e58');
					$('.warning:eq(4)').css('visibility','visible')
										     .text(result.desc)
					                         .css('color','#3f6e58');
				} else {
					$('.email_box2').css('border','1px solid #a48443');
					$('.warning:eq(4)').css('visibility','visible')
										     .text(result.desc)
					                         .css('color','#a48443');
				}
			}
				

			$('.addr_only').click(function(){
				$('#btn_post').click();
				//사용자가 우편번호 또는 주소 input을 클릭했을때!
			});
			$('#sample6_detailAddress').click(function(){
				var addrPost = $('#sample6_postcode').val();

				//if(addrPost == '' || addrPost.length == 0) {
					//$('#btn_post').click();

				//}
			});

			//주소 유효성 체크
			$('#sample6_detailAddress').keyup(function(){
				var addrDetail = $.trim($(this).val());
				var addrPost = $('#sample6_postcode').val();
				//console.log('우편번호: '+addrPost+', 상세주소: '+addrDetail);
				ckAddr(addrDetail, addrPost)
			});
			
			function ckAddr(addrDetail, addrPost) {
				var result = joinValidate.checkAddr(addrDetail, addrPost);

				if(result.code==3){// 우편번호 & 주소 x
					ckDesign(result.code, result.desc, 5,6);
					ckDesign(result.code, result.desc, 6,6);
				} else if(result.code == 0) {
					ckDesign(result.code, result.desc, 5, 6);
					ckDesign(result.code, result.desc, 6, 6);
					ckDesign(result.code, result.desc, 7, 6)
				} else if(result.code==4) { // 상세주소 x
					ckDesign(result.code, result.desc, 7,6);
				} else if(result.code==5) {
					ckDesign(result.code, result.desc, 7,6);
				}

				if(result.code == 0) {
					checkArr[6] = true;
				} else {
					checkArr[6] = false;
				}
			}

			//회원가입 버튼 클릭!
			$('#btn_join').click(function(){
				var invalidAll = true;
				for(var i = 0; i < checkArr.length; i++) {
					if(!checkArr[i]) {
						invalidAll = false;
					$('.warning:eq('+i+')').css('visibility','visible')
										  .css('color','#a48443');	
					} 
				}
				if(invalidAll) {
			
					FunLoadingBarStart();
					$('#frm_member').submit(); // submit : form태그 안에 있는 데이터들을 서버단으로 전송
					// action: 목적지(MemberController '/join')
					// method: 방법(POST: 숨겨서)
				} else {
					alert('유효성 체크를 진행해주세요!')
				}
				//유효성체크가 전부 true이면
				//하나라도 false이면
			});
			// 버튼 활성화
			$('.join_info_box_input').keyup(function(){
				ckColorBtn();
			});
			$('.join_info_box_input2').keyup(function(){
				ckColorBtn();
			});
			$('#selmail').click(function(){
				ckColorBtn();
			});
			
			

			
			function ckColorBtn() {
				var checkAll = true;

				for(var i=0; i < checkArr.length; i++){
					if(!checkArr[i]) {
						checkAll = false;
					}
				}
				if(checkAll) {
					$('#btn_join').addClass('btn_primary');
					//$('#btn_join').prop('disabled',false);
					$('#btn_join').css('cursor','pointer');
				} else {
					$('#btn_join').removeClass('btn_primary');
					//$('#btn_join').prop('disabled',true);
					$('#btn_join').css('cursor','no-drop');
				}
			}


		});


	
			//개발시 사용: 유효성 체크 전체여부를 출력해주는 함수(true, false) 
			function printCheckArr(checkArr) {
				for(var i=0; i<checkArr.length; i++) {
					console.log(i + '번지: '+checkArr[i]);
				}
			}

		
	</script>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    //로딩바 출력
    function FunLoadingBarStart() {
    	var loadingBarImage = ''; //가운데 띄워줄 이미지
    	loadingBarImage += "<div id='back'>";
    	loadingBarImage += "<div id='loadingBar'>";
    	loadingBarImage += "<i class='fas fa-carrot loading_img'></i>"
    	loadingBarImage += "</div></div>";
    	$('body').append(loadingBarImage);
    	$('#back').css('display','flex');
    	$('#loadingImg').show();
    }
 
</script>
</html>