<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>     
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
		border-bottom: 2px dashed rgba(73, 130, 104, 0.7);
	}
	#service1{
		font-size: 20px;
		font-weight: 600;
	}
	#service2{
		font-size: 15px;
		font-weight: 550;
		color: rgba(0,0,0,0.5);
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
		padding: 20px 0;
	}
	.password{
		font-size: 18px;
		font-weight: 600;
		padding: 10px 0; 
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
		border: 1px solid transparent;
	}
	.no_btn {
		background-color: #E2D6C1;
		color: black; 
		border: 1px solid rgba(0,0,0,0.2);
	}
	#yes_btn:hover {
		background-color: #3f6e58;
	}
	.modal_wrap{
		display: none;
		position: fixed;
		z-index: 1;
		top: 0;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		justify-content: center;
		align-items: center;
		
		
	}	
	.modal_content {
		position: relative;
		width: 550px;
		height: 330px;
		background-color: white;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20 px 0 rgba(0,0,0,0.19);
		border-radius: 2px;
		box-sizing: border-box;
		overflow: hidden;
		color: rgba(0,0,0,0.6);
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.check_leave {
		padding: 20px;
		font-size: 20px;
		font-weight: 600; 
	}

	</style>
</head>
<body>
<div class="modal_wrap">
	<div class="modal_content">
		<div class="check_leave">정말 탈퇴하시겠습니까?</div>
		<div class="leave_btn">
				<a class="btn" id="modal_yes_btn" href="#">탈퇴</a>
				<a class="btn no_btn" id="modal_no_btn" href="#">취소</a>
		</div>	
	</div>	
</div>
	<div class="wrap">
	<header>
		<div class="header">
			<h1 class="vegitory_logo"><a href="#" class="n_logo">
				<img src="${path}/resources/img/avocado-removebg-preview.png" width="60px" height="60px">LEAVE VEGI-TORY
			</a></h1>
		</div>
	</header>
	<div class="section_wrap">
		<section>
			<div class="serivce">
				<span id="service1">VEGI-TORY는 항상 고객님께 보다 나은 서비스를 제공하고자 합니다.</span>
				<span id="service2">서비스 이용에 불만족스러운 점이나 미흡한 점이 있었다면 
									 고객센터에 문의해주세요. 최선을 다해 검토하겠습니다.</span>
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
				<input type="password" id="input_password" name="password">
				</div>
			</div>	
			<div class="leave_btn">
				<a class="btn" id=yes_btn href="#">탈퇴</a>
				<a class="btn no_btn" href="#">취소</a>
			</div>	

		</section>
	</div>
	<footer></footer>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click','#yes_btn',function(){
			$('.modal_wrap').attr('style','display:flex');
		});
	$(document).on('click','#modal_no_btn',function(){
			$('.modal_wrap').attr('style','display:none');
		});
</script>
</html>