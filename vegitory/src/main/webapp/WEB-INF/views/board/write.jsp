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
	.posting_warning {
		visibility: hidden;
		text-align: center;
	}
	#board_search_content {
		visibility: hidden;
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
				<form:form  id="frm_posting">
					<div class="posting_info">
						<select id="sel_type" name="type" required>
							<option id="free" value="free" selected>자유게시판</option>
							<option id="news" value="news">비건뉴스</option>
							<option id="qna" value="qna">QnA 게시판</option>
							<option id="review" value="review">리뷰게시판</option>
						</select>
						<input class="posting_title" name="title" placeholder="제목을 입력하세요" value="${one.title}"></input>
						<input type="hidden" id="posting_writer" name="writer" value="${name}"></input>
					</div>	
					<div class="posting_postarea">
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea id="board_post_content" name="view_content" class="posting">${one.view_content}</textarea>
						<div class="attachment"> 첨부하고 싶은 파일을 드래그 하세요 </div>
					</div>	
				<div class="posting_buttons">
					<button type="button" class="cancel_btn post_btn">취소</button>
					<button type="button" class="insert_btn post_btn">등록</button>
				</div>	
				<div class="posting_warning"> 값을 입력해주세요 </div>
					</form:form>
			</div>
		
		</div>		
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	var flag = '${flag}';
	console.log('flag: ' + flag);
	
	$(function(){
		// write ==> 게시글 등록과 게시글 수정
		// 버튼을 등록에서 수정으로 바꿔야해서 써야함.
		if(flag == 'update'){
			$('.posting_board_sub_name').text('게시글을 수정합니다.');
			$('.insert_btn').text('수정');
		//selectbox 값으로 selected
		$('#sel_type').val('${one.type}').attr('selected','selected');
		} else if(flag == 'answer') {
			$('.posting_board_sub_name').text('답글을 작성합니다.');
			$('.insert_btn').text('등록');
			$('#sel_type').val('${one.type}')
						  .attr('selected','selected')
						  .attr('onFocus','this.initialSelect = this.selectedIndex')
						  .attr('onChange','this.selectedIndex = this.initialSelect');
			$('.posting_title').val('${one.title}')
							   .attr('readonly','readonly');
		}
		
	});
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
	$(document).on('click','.insert_btn',function(){
			var title = $('.posting_title').val();
			if(title.length == 0 || title == ''){
				$('.posting_warning').css('visibility','visible')
                					 .css('color','#a48443')
                					 .text('제목을 입력해주세요');
				return false;
			} else {
				//스마트 에디터의 값을 #board_content에 입력
				oEditors.getById["board_post_content"].exec("UPDATE_CONTENTS_FIELD", []);// 클래스도 아니고 아이디로 해야됨
				
				var view_content = $('#board_post_content').val();
				console.log('view_content: ' + view_content);
				
				var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp","");
				 console.log('search_content: ' + search_content);
				$('#frm_posting').append('<textarea id="board_search_content" name="search_content"></textarea>');
				$('#board_search_content').val(search_content);
				
				$('#frm_posting').submit();
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