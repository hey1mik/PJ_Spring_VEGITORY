<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file="../include/include.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<script src="https://kit.fontawesome.com/3062584ccb.js" crossorigin="anonymous"></script>
	<title> VEGITORY :: 비밀번호 재설정 </title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		*{
			box-sizing: border-box;
		}
		body {
			background-color: #E2D6C1;
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
			background-color: white;
			border-top: 3px solid #498268;
			
		}
		section {
			padding: 30px 66px 30px 66px;
		}

	.serivce{
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center; 
		padding: 20px 0;
		border-bottom: 2px solid rgba(73, 130, 104, 0.5);
	}
	.service1{
		font-size: 20px;
		font-weight: 600;
	}
	.service2 {
		padding-bottom: 5px;
	}
	.service_btn {
		width: 150px;
		height: 50px;
		background-color:rgba(73, 130, 104, 0.97);
		color: white;
		border-radius: 2px;
		text-align: center;
		line-height: 50px;
		margin: 18px 0 10px 0;
		font-size: 15px;
		font-weight: 600;
	}
	.service_btn:hover{
		background-color:#3f6e58;
	}
	.notice{
		width: 100%;
		height: 225px;
		display: flex;
		flex-direction: column;
		align-items: center; 
		padding: 50px 0 25px 0; 
		border-bottom: 2px solid rgba(73, 130, 104, 0.5);
	}
	.notice1{
		font-size: 18px;
		font-weight: 600;
		padding-bottom: 3px; 
	}
	.label {
		font-size: 18px;
	}
	.notice_box{
		width: 90%;
		height: 130px;
		border: 1px solid transparent;
		background-color: #E2D6C1;
		border: 1px solid rgba(0,0,0,0.2);
		padding: 10px 0;
		margin-top: 10px; 
		box-sizing: border-box;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 14px;
	}
	.little_space {
		width: 100%;
		height: 20px;
	}
	.password_wrap {
		margin: 20px;
	}
	.password{
		font-size: 18px;
		font-weight: 600;
		padding: 10px 0; 
	}
	.warning {
		position: absolute;
		font-size: 11px;
		visibility: hidden;
	}
	.leave_btn {
		width: 100%;
		display: flex;
		justify-content: center;
		padding: 30px 0; 
		margin: 10px 0 0 0;
	}
	.btn {
		width: 90px;
		height: 40px;
		background-color: #E2D6C1;
		border: 1px solid rgba(0,0,0,0.2);
		color: black;
		text-align: center;
		line-height: 40px;
		border-radius: 2px;
		margin: 0 10px;
		border: 1px solid transparent;
	}
	#yes_btn:hover {
		background-color: #E2D6C1;
		border: none; 
		display: block;
		text-align: center;
		line-height: 40px;
		font-weight: 550; 
		cursor: no-drop;
	}

	</style>
</head>
<body>
	<div class="wrap">
	<header>
		<div class="header">
			<h1 class="vegitory_logo"><a href="${path}/" class="n_logo">
				<img src="${path}/resources/img/avocado-removebg-preview.png" width="60px" height="60px">CHANGE PASSWORD
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
		<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
			<div class="serivce">
				<span class="service1">본인확인을 위해 현재 비밀번호를 입력해주세요.</span>
				<div class="password_wrap">
				<div class="password_box">
				<label for="input_password">현재 비밀번호</label>
				<input type="password" class="passbox" id="nowpw" name="password">
				</div>
				<div class="warning"> *비밀번호를 확인해주세요 </div>
				</div>
				
			</div>
			<div class="notice">
				<span class="service1 service2">수정할 비밀번호를 입력해주세요.</span>
				<div class="password_wrap">
					<div class="password_box">
					<label for="input_password">수정할 비밀번호</label>
					<input type="password" class="passbox" name="pw" id="upw" name="password">
					<div class="warning"> *비밀번호를 확인해주세요 </div>
					</div>
					<div class="little_space"></div>	
					<div class="password_box">
					<label for="input_password">비밀번호 재확인</label>
					<input type="password" class="passbox" id="urpw" name="password">
					<div class="warning"> *비밀번호를 확인해주세요 </div>
					</div>
				</div>
			</div>	
		
			<div class="leave_btn">
				<a class="btn" id="yes_btn" href="#" disabled>확인</a>
				<a class="btn" id="no_btn" href="${path}/">취소</a>
			</div>	
	</form:form>

		</section>
	</div>
	<footer></footer>
	</div>
</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${path}/resources/js/validation.js"></script>
		<script type="text/javascript">
			$('#yes_btn').click(function(){
				
			});
			
			//$(document) 표시는 나 혼자 동작하겠다는 의미이다.
			// 나 혼자 동작하고, 누군가와 값을 교환하지 않겠다.
			
				
			//$에 선택자만 온다! -> 전역변수를 공유해서 쓰겠다는 의미이다.
			//그러니까 document가 없는 제이쿼리가 전역함수(joinValidate와 같은)를 쓰고싶으면 큰 document 안에 넣어줘야한다.
			
			//$(document)안에 또 $(document) 있으면 오류남, 주의!
			// 또한 $(document).ready(fucntion(){}); 이랑, $(function(){}); 이랑 똑같은 거임 뒤에거는 약식.
			
			
		
			
		
		$(document).ready(function(){
			var pwFlag = false;
			var checkArr = new Array(2).fill(false);
			
			$('#nowpw').keyup(function(){
				var nowpw = $(this).val();
				var result = joinValidate.checkNowpw(nowpw);
				//나올 수 있는 code: 1,2,6,100
				console.log("code: "+result.code);
				ckDesign(result.code, result.desc, 0);
				
				if(result.code == 100) {
					checkArr[0] = true;
				} else {
					checkArr[0] = false;
				}
				
			});
			
			
			$('#upw').keyup(function(){
				var nowpw = $.trim($('#nowpw').val());
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($('#urpw').val());
				
				var test = joinValidate.checkNowpw(nowpw);
				if(test.code == 1) {
					$('.warning:eq(1)').css('visibility','visible')
				     				   .text('본인확인을 위해 현재 비밀번호 입력을 먼저 진행해주세요!')
                   					   .css('color','#a48443');
				} else {
					var result = joinValidate.checkPw(nowpw, pw, rpw);
					if(result.code == 0 || result.code == 10 || result.code == 6) {
						pwFlag = true;
					} else {
						pwFlag = false;
					}
					ckDesign(result.code, result.desc, 1);
					
					if(result.code == 10) {
						checkArr[1] = true;
					} else if(result.code == 6) {
						checkArr[1] = false;
					} else {
						checkArr[1] = false;
					}
				}	
			});
			
			
			$('#urpw').keyup(function(){
				var pw = $.trim($('#upw').val());
				var rpw = $.trim($('#urpw').val());
				var result = joinValidate.checkRpw(pw, rpw, pwFlag);
				ckDesign(result.code, result.desc, 2);
			
				if(result.code == 10) {
					checkArr[1] = true;
				
				} else if(result.code == 6) {
					checkArr[1] = false;
				} else {
					checkArr[1] = false;
				}
			
			});
			
			
			$('.passbox').keyup(function(){
				printCheckArr(checkArr);
				ckColorBtn();
			})
			
			function ckColorBtn() {
				var checkAll = true;
		
				for(var i=0; i < checkArr.length; i++){
					if(!checkArr[i]) {
						checkAll = false;
					}
				}
				if(checkAll) {
					$('#yes_btn').prop('disabled','false');
					$('#yes_btn').css('cursor','pointer')
								 .css('background-color','#3f6e58')
								 .css('color','white');
				} else {
		
					$('#yes_btn').prop('disabled','true');
					$('#yes_btn').css('cursor','no-drop');
				}
			}
			$('#yes_btn').click(function(){
				var invalidAll = true;
				for(var i = 0; i < checkArr.length; i++) {
					if(!checkArr[i]) {
						invalidAll = false;
						$('.warning:eq('+i+')').css('visibility','visible')
											   .text('유효성 체크를 진행해주세요!')
											   .css('color','#a48443')
					}
				}
				if(invalidAll) {
					$('#frm_member').submit();
				} else {
					alert('유효성체크를 진행해주세요!');
				}
			});
			
		
			
		});
		
			
			
	function ckDesign(code, desc, msg) { // 유효성 체크 통과 한 애
		if(code ==0 || code == 10 || code == 100) {
		$('.warning:eq('+msg+')').css('visibility','visible')
							   .text(desc)
		                       .css('color','#3f6e58');
		        return false;
		
		} else { //유효성 체크 통과 못 한 애
			$('.warning:eq('+msg+')').css('visibility','visible')
								     .text(desc)
			                         .css('color','#a48443');
			       return true;                   
			}
	}
			
			
	function printCheckArr(checkArr) {
		for(var i=0; i<checkArr.length; i++) {
			console.log(i + '번지: '+checkArr[i]);
		}
	}
	
	
			
		</script>
</html>