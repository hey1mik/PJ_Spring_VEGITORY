<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file="../include/header.jsp" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>VEGITORY :: 새 글 작성 </title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">	
	
	*{
		z-index: 1;
		font-family: 'Noto Serif KR', serif;
	}
		
	body{
		background-color: white;
	}
	.board_wrap{
		width: 1400px;
		overflow: hidden;
		margin: 70px auto; 
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 0px 10px;
	}
	.posting_board_title {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 30px 0 30px 0;
	}
	.posting_board_name {
		background-color: #E2D6C1;
		padding: 1px 40px 1px 40px;
		border-radius: 20%;
		font-size: 30px;
		font-weight: 600;
	}
	.posting_board_sub_name{
		padding: 1px;
		font-size: 16px;
	}
	
	.posting_contents {
		display: flex;
		flex-direction: column;
		justify-content: center;
		width: 90%;
		padding: 10px 0px 0 60px; 
	
	}

	.posting_info {
		display: flex;
		border-top: 3px solid rgba(73, 130, 104, 0.5);	
		width: 100%; 
		padding-top: 20px;
		padding-bottom: 10px;
	}

	.posting_title {
		width: 90%;
		font-size: 14px;
	}

	#sel_type {
		width: 10%;
		margin-right: 5px;
	}
	.posting {
		width: 99.83%;
		height: 600px;
	}

	.attachment {
		text-align: center;
		line-height: 190px;
		margin-top: 10px;
		color: rgba(0,0,0, 0.5);
		font-weight: bold;
		width: 100%;
		height: 190px;
		border: 1px solid rgba(0,0,0, 0.3);
	}

	.posting_buttons {
		display: flex;
		justify-content: center;
		padding-top: 10px;
		
	}
	.post_btn {
		font-size: 15px;
		cursor: pointer;
		padding: 10px; 
		color:rgba(0,0,0, 0.7);
		border: none;
		background-color: transparent;
	}
	.insert_btn {
		color: #3f6e58;
	}

	</style>
	</head>
	<body>
		<div class="board_wrap">
				<div class="posting_board_title">
					<div class="posting_board_name">POST</div>
					<div class="posting_board_sub_name"> 새 글을 작성합니다. </div>
				</div>
				
				<div class="posting_contents">
				<form:form  id="frm_posting" modelAttribute="boardDTO" autocomplete="on">
					<div class="posting_info">
						<select id="sel_type" name="type">
							<option value="free" selected="selected">자유게시판</option>
							<option value="news">비건뉴스</option>
							<option value="qna">QnA 게시판</option>
							<option value="review">리뷰게시판</option>
						</select>
						<input class="posting_title" name="title" placeholder="제목을 입력하세요"></input>
						<input type="hidden" id="posting_writer" name="writer" value="${name}"></input>
					</div>	
					<div class="posting_postarea">
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea id="board_post_content" name="content" class="posting"></textarea>
						<div class="attachment"> 첨부하고 싶은 파일을 드래그 하세요 </div>
					</div>	
				<div class="posting_buttons">
					<button type="button" class="cancel_btn post_btn">취소</button>
					<button type="button" class="insert_btn post_btn">등록</button>
				</div>	
					</form:form>
			</div>
		
		</div>		
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).on('click','.cancel_btn',function(){
			var referer = '${header.referer}';
			console.log(referer);
			
			var index = referer.indexOf('/board/freelist');
			console.log('index: '+referer.indexOf('/board/freelist'));
	
			if(index == '-1'){
				location.href = '${path}/board/freelist';
			} else {
				location.href = '${header.referer}';
			}
	
	});
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "board_post_content", //textarea의 아이디값과 반.드.시. 일치해야함!
	 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	</script>		
	</html>