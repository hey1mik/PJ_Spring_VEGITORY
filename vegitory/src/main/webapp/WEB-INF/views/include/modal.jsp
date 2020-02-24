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
		z-index: 1000;
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
				<a class="btn no_btn" id=modal_no_btn href="#">취소</a>
		</div>	
	</div>	
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