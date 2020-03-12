<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>        
<%@ include file="../include/include.jsp" %>
<%@ include file="../include/modal.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGITORY :: 회원탈퇴</title>
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
			z-index: 1;
			
		}
		section {
			padding: 30px 66px 30px 66px;
			z-index: 1;
		}

	.serivce{
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center; 
		padding: 20px 0;
		border-bottom: 2px dashed rgba(73, 130, 104, 0.7);
		z-index: 1;
	}
	#service1{
		font-size: 20px;
		font-weight: 600;
		z-index: 1;
	}
	#service2{
		font-size: 15px;
		font-weight: 550;
		color: rgba(0,0,0,0.5);
		text-align: center;
		z-index: 1;
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
		height: 200px;
		display: flex;
		flex-direction: column;
		align-items: center; 
		padding: 20px 0 25px 0; 
		border-bottom: 2px dashed rgba(73, 130, 104, 0.7);
	}
	.notice1{
		font-size: 18px;
		font-weight: 600;
		padding-bottom: 3px; 
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
	.ck_password{
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center; 
		padding: 20px 0 0 0;
	}
	.password{
		font-size: 18px;
		font-weight: 600;
		padding: 10px 0; 
	}
	#warning{
		font-size: 12px;
		visibility: hidden;
	}
	.leave_btn {
		width: 100%;
		display: flex;
		justify-content: center;
		padding: 10px 0; 
		margin-bottom: 10px;
	}
	.btn {
		width: 90px;
		height: 40px;
		background-color: #498268;
		color: white; 
		text-align: center;
		line-height: 40px;
		border-radius: 2px;
		margin: 0 10px;
		border: 1px solid rgba(0,0,0,0.2);
	}
	.no_btn {
		background-color: #E2D6C1;
		color: black;
	}
	#yes_btn {
		cursor: no-drop;
		color: black;
		background-color: #E2D6C1;
	}


	</style>
</head>
<body>
<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
	<div class="wrap">
	<header>
		<div class="header">
			<h1 class="vegitory_logo"><a href="${path}/" class="n_logo">
				<img src="${path}/resources/img/avocado-removebg-preview.png" width="60px" height="60px">LEAVE VEGI-TORY
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
			<div class="serivce">
				<span id="service1">VEGI-TORY는 항상 고객님께 보다 나은 서비스를 제공하고자 합니다.</span>
				<span id="service2">서비스 이용에 불만족스러운 점이나 미흡한 점이 있었다면 
									 고객센터에 문의해주세요.<br>최선을 다해 검토하겠습니다.</span>
				<a class="service_btn" href="#"> 고객센터 바로가기</a>
			</div>
			<div class="notice">
				<span class="notice1">회원 탈퇴 신청에 앞서 주의</span>
				<div class="notice_box">
					- 잔여 포인트 포기에 동의하셔야 하며, 탈퇴 완료 시 포인트가 삭제됩니다.<br>
					- 작성하신 Q&A 혹은 후기는 회원탈퇴 후에는 편집 및 삭제처리가 불가능합니다.<br>
					 삭제를 원하시는 경우, 먼저 해당 게시물을 삭제하신 수 탈퇴절차를 진행해주시기 바랍니다.<br>
					- 한번 회원 탈퇴를 하시면 이전 VEGITORY 등급은 복구가 불가능합니다. 
				</div>
			</div>
			<div class="ck_password">
					<span class="password">탈퇴 전 본인확인을 위해 비밀번호를 다시 입력합니다.</span>
					<div class="password_box">
					<label for="input_password">비밀번호 입력</label>
					<input type="password" id="input_password" name="pw">
					<div id="warning"> *확인되었습니다</div>
					</div>
			</div>	
			<div class="leave_btn">
				<a class="btn" id=yes_btn href="#" disabled>탈퇴</a>
				<a class="btn no_btn" href="#">취소</a>
			</div>	
		</section>
	</div>
	<footer></footer>
	</div>
</form:form>	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
	
	$(document).ready(function(){
		var pwFlag = false;
		
		$('#input_password').keyup(function(){
			var nowpw = $(this).val();
			var result = joinValidate.checkNowpw(nowpw);
			//나올 수 있는 code: 1,2,6,100
			console.log("code: "+result.code);
			pwFlag = ckDesign(result.code, result.desc);	
			ckColorBtn();
		});

	
	function ckDesign(code, desc) { // 유효성 체크 통과 한 애
		
		if(code == 100) {
			$('#warning').css('visibility','visible')
			 .text(desc)
			 .css('color','#3f6e58');
		        return true;
		} else { //유효성 체크 통과 못 한 애
			
			$('#warning').css('visibility','visible')
			 .text(desc)
			 .css('color','#a48443');
			      return false;                   
			}
		
	}
	
	function ckColorBtn() {
		if(pwFlag==true) {
			$('#yes_btn').prop('disabled','false')
						 .css('cursor','pointer')
						 .css('background-color','rgba(73, 130, 104, 0.97)')
						 .css('color','white');
			
		} else {
			$('#yes_btn').prop('disabled','true')
			 			 .css('background-color','#E2D6C1')
			 			 .css('color','black')
						 .css('cursor','no-drop');
		}
	}
		
		$('#yes_btn').click(function(){
			if(pwFlag==false) {
				$('#warning').prop('disabled','true')
							 .css('visibility','visible')
							 .text('유효성 체크를 진행해주세요!')
							 .css('color','#a48443');
				alert('유효성 체크를 진행해주세요!');
				} else {
					$('.modal_wrap').css('display','flex');
				}
			});
		$('#modal_yes_btn').click(function(){
			location.href='${path}/member/dropAction';
		});
	
	});	
</script>
</html>