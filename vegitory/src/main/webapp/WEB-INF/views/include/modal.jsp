<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
	.leave_btn {
		width: 100%;
		display: flex;
		justify-content: center;
		padding: 10px 0; 
		margin-bottom: 10px;
	}
	.modal_btn {
		width: 90px;
		height: 40px;
		background-color: #498268;
		color: white;
		text-align: center;
		line-height: 40px;
		border-radius: 2px;
		margin: 10px 10px;
		border: 1px solid transparent;
	}
	#modal_yes_btn:hover{
		background-color: #498268;
		color: white;
	}
	.no_btn {
		background-color: #E2D6C1;
		color: black; 
		border: 1px solid rgba(0,0,0,0.2);
	}
	.modal_wrap{
		display: none;
		position: fixed;
		z-index: 1000;
		top: 0;
		background-color: rgba(0,0,0,0.4);
		overflow: auto;
		width: 100%;
		height: 100%;
		justify-content: center;
		align-items: center;
		
		
	}	
	.login_modal_content {
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
	.check_leave1 > h2 {
		font-size: 23px;
		font-weight: 600; 
		margin-top: 10px;
	}
	.check_leave2 {
		margin-bottom: 10px;
	}
	
	</style>
</head>
<body>
	<div class="modal_wrap">
	<div class="login_modal_content">
		<div class="vegitory_logo"><img src="${path}/resources/img/avocado-removebg-preview.png" width="55px" height="55px"></div>
		<div class="check_leave1"><h2></h2></div>
		<div class="check_leave2"></div>
		<div class="check_leave3"></div>
		<div class="leave_btn">
				<a class="modal_btn no_btn" id=modal_yes_btn href="#">확인</a>
				<a class="modal_btn no_btn" id=modal_no_btn href="#">취소</a>
		</div>	
	</div>	
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var id='${id}';
		var email='${email}';
		var key = '${key}';
		
		var join_main_txt = id+'님 회원가입을 축하드립니다.';
		var join_sub_txt = email+'으로 인증메일을 보냈습니다.';
		var join_sub2_txt = '인증하셔야만 사이트 활동이 가능합니다.';
		var auth_main_txt = id+'님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다.';
		var auth_sub2_txt = '베지토리에 가입해주셔서 감사합니다.';
		var drop_main_text = '${userid}님 정말 탈퇴하시겠습니까?';
		var dropResult_main_text = id+'님 탈퇴되셨습니다.';
		var dropResult_sub_text = '그동안 베지토리를 이용해주셔서 감사합니다.';
		var dropBoard_main_txt = '정말 삭제하시겠습니까?';
		var dropBoardNo_main_txt = '댓글이 있는 게시글은 삭제할 수 없습니다.';
		
		
		if(key == 'join') {
			$('.check_leave1').text(join_main_txt);
			$('.check_leave2').text(join_sub_txt);
			$('.check_leave3').text(join_sub2_txt);
			$('.modal_wrap').css('display','flex');
			$('#modal_yes_btn').css('display','none');//확인버튼 제거
			$('#modal_no_btn').text('확인');
		} else if(key == 'auth') {
			$('.check_leave1').text(auth_main_txt);
			$('.check_leave2').text(auth_sub_txt);
			$('.check_leave3').text(auth_sub2_txt);
			$('.modal_wrap').css('display','flex');
			$('#modal_yes_btn').css('display','none');//확인버튼 제거
			$('#modal_no_btn').text('확인');
		} else if(key == 'drop') {
			$('.check_leave1').text(drop_main_text);
		} else if(key == 'dropResult') {
			$('.check_leave1').text(dropResult_main_text);
			$('.check_leave2').text(dropResult_sub_text);
			$('.modal_wrap').css('display','flex');
			$('#modal_yes_btn').css('display','none');//확인버튼 제거
			$('#modal_no_btn').text('확인');
		} else if(key == 'dropBoard') {
			if('${view.replycnt}' == 0) { //댓글이 없는 경우
				$('.check_leave1').text(dropBoard_main_txt);
			} else { // 댓글이 있는 경우
					$('.check_leave2').text(dropBoardNo_main_txt);
					$('#modal_yes_btn').css('display','none');//확인버튼 제거
					$('#modal_no_btn').text('확인');
			 	}	
			}
		});
	
	$(document).on('click','#modal_yes_btn',function(){
			$('.modal_wrap').attr('style','display:none');
		});
	$(document).on('click','#modal_no_btn',function(){
		$('.modal_wrap').attr('style','display:none');
	});
</script>
</html>