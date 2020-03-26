<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file="../include/header.jsp" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>VEGITORY :: 상세 게시글 </title>
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
	.free_board_title {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 30px 0 30px 0;
	}
	.free_board_name {
		background-color: #E2D6C1;
		padding: 1px 40px 1px 40px;
		border-radius: 20%;
		font-size: 30px;
		font-weight: 600;
	}
	.free_board_sub_name{
		padding: 1px;
		font-size: 16px;
	}
	.category_list {
			width: 100%;
			display: flex;
			justify-content: center;
			z-index:50;
	}

	.category_common{
		width: 90%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.category_common li {
		float: left;
		text-align: center;
		width: 100%;
		height: 155.25px;
		font-size: 12px;
		border-radius: 200px;
		transition: 0.4s;
	}
	.category_common li:hover {
		transform: scale(1.2);
	}
	.category_common a{
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	.category_wrap {
		display: flex;
		justify-content: center;
		padding: 30px 0;
	}
	
	.free_view_contents {
		width: 100%;
		padding: 20px 0px 0 60px; 
	
	}

	.free_view_info {
		border-top: 3px solid rgba(73, 130, 104, 0.5);	
		width: 95%; 
		padding-top: 30px;
		padding-bottom: 10px;
	}

	.view_title {
		font-weight: bold; 
		font-size: 18px;
		padding-bottom: 5px;
	}

	.view_other_info {
		width: 100%;
		
	}
	.info_div {
		font-weight: 550;
	}

	.view_content {
		width: 95%;
		padding: 10px 0;
	}
	
	.orginal_view_content {
		width: 100%;
		height: 150px;
		margin-bottom: 10px;
		border-top: 1px solid rgba(0, 0, 0, 0.2);
		padding-top: 15px;
	}
	.view_content_input {
		border: 1px solid rgba(0,0,0,0.3);
		padding: 0px; 
		width: 100%;
		height: 150px;
		margin-bottom: 10px;
		display: none;
	}

	.view_content_buttons {
		display: flex;
		justify-content: space-between;
	}
	
	.free_board_comments {
		margin-top: 10px;
		padding: 20px 0; 
		width: 95%;
		border-top: 1px solid rgba(0, 0, 0, 0.2);
	}

	.comment_cnt {
		padding-bottom: 10px;
		font-weight: bold;
	}

	.one_comment {
		width: 95%;
		padding: 10px 0px 10px 5px;
	}
	.comment_id {
		font-weight: bold;
	}
	.borad_btn {
		border: none;
		background-color: transparent;
		cursor: pointer;
	}
	.input_comment {
		display: flex;
		width: 100%;
		padding: 10px 0;
	}

	#comment_content_input {
		width: 90%;
		height: 150px; 
	}
	.comment_submit_button {
		border: 1px solid rgba(0,0,0,0.3);
		border-left: none;
		width: 10%;
		cursor: pointer;
	}
	.comment_available {
		padding: 30px 0;
	}
	#span_login{
		padding: 0;
		border: none;
		background-color: transparent;
		color: rgba(73, 130, 104, 0.9);
		cursor: pointer;	
		font-weight: bold;
	}
	.commnet_err_msg {
		visibility: hidden;
		color: #a48443;
	}
	#refresh_btn {
		cursor: pointer;
		padding-left: 5px;
		color: rgba(0, 0, 0, 0.7);
	}

	</style>
	</head>
	<body>
		<%@ include file="../include/modal.jsp" %>
		<div class="board_wrap">
				<div class="free_board_title">
					<div class="free_board_name">COMMUNITY</div>
					<div class="free_board_sub_name"> '자유게시판' 입니다. </div>
				</div>
				<div class="category_list">
				<ul class="category_common category_asian">
					<li><a href="#"><img src="${path}/resources/img/c4.png"><span>비건뉴스</span></a></li>
					<li><a href="${path}/board/freelist"><img src="${path}/resources/img/c5.png"><span>자유게시판</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c6.png"><span> Q&A 게시판</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c7.png"><span>리뷰 게시판</span></a></li>
				</ul>	
			</div>
				<div class="free_view_contents">
					<div class="free_view_info">
						<div class="view_title">${view.title}</div>
						<div class="view_other_info">
							<span id="view_id"><span class="info_div">작성자</span> ${view.writer}</span>
							<span id="view_viewno"><span class="info_div">글번호</span> ${view.bno}</span>
							<span id="view_viewcnt"><span class="info_div">조회수</span> ${view.viewcnt}</span>
								<span id="view_viewcnt"><span class="info_div">댓글수</span> <span id="view_viewcnt2">${view.replycnt}</span></span>
							<span id="view_regdate"><span class="info_div">마지막 수정일</span>
							<c:choose>
						    	<c:when test="${today == view.regdate}">
						    	 <fmt:formatDate value="${view.updatedate}" pattern="HH:mm:ss"/>
						    	</c:when>
						    	<c:otherwise>
						    		<fmt:formatDate value="${view.updatedate}" pattern="yyyy-MM-dd"/>
						    	</c:otherwise>
						   		 </c:choose>
							</span>
							
						</div>
					</div>	
					<div class="view_content">
						<div class="orginal_view_content"> ${view.content} </div>
						<input type="text" class="view_content_input" name="content">
						<div class="view_content_buttons">
							<div class="listNanswer">
								<button id="list_view" class="borad_btn"> <i class="far fa-heart"></i> ${view.goodcnt} </button>
								<a href="${header.referer}" id="list_view"> 목록 </a>
								<button id="reply_view" class="borad_btn"> 답변 </button>
							</div>
							<div class="alterNdelete">
								<c:if test="${name == view.writer}">
								<button id="alter_view" class="borad_btn"> 수정 </button>
								<button id="delete_view" class="borad_btn"> 삭제 </button>
								</c:if>
							</div>
						</div> 
					</div>	
					
					
					<!-- 댓글 창 -->
					<div id="listReply"></div>
			</div>
		</div>		
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			
			listReply();
			
			$('#list_view').click(function(){
				$(this).html('<i class="fas fa-heart"></i> ${view.goodcnt+1}');
			});
			$('#delete_view').click(function(){
				$('.modal_wrap').css('display','flex');
			});
			$('#modal_yes_btn').click(function(){
				location.href='${path}/board/delete?bno=${view.bno}';
			});
			
			
		});
		
		// 댓글 목록 출력 함수 
		function listReply() {
			$.ajax({
				type:"get",
				async: false,
				url:"${path}/reply/freelist?bno=${view.bno}",
				success: function(result) {
				$("#listReply").html(result);
				}		
			});
			
			$('#view_viewcnt2').text($('.replyListCnt').val());
			
		}
		
		//게시글 댓글수 수정
	
		
		// $(function(){}); 이것은 $(document).ready(function(){}); 이거라서! 이 document는 view.jsp만 뜻하는거라
		//view.jsp가 ready인 경우만 포함함. commentlist.jsp의 ready여부는 포함하지 않음.
		//on은 준비가 되면 이 아니라, 그냥 commnet_submit_button이 클릭이 되면! 이라는 의미임.
		
		$(document).on('click','.comment_submit_button', function(){
			var reply = $('#comment_content_input').val();
			if(reply == '' || reply.length == 0){
				$('#comment_content_input').focus();
				$('.commnet_err_msg').css('visibility','visible');
				return false;
			}
			
			$('#reply_bno').val('${view.bno}');
			$('#reply_type').val('${view.type}');
			$('#reply_writer').val('${name}');
			

			
			$.ajax({
				url: '${path}/reply/insert',
				type: 'POST',
				data: $('.frm_reply').serialize(),
				success: function(data) {
					listReply();
				}
			});
			
		});
		
		$(document).on('keyup','#comment_content_input', function(){
			var reply = $.trim($('#comment_content_input').val());
			if(reply != ''){
				$('.commnet_err_msg').css('visibility','hidden');
			}
		});
		
		$(document).on('click','#refresh_btn', function(){
			$('#refresh_btn').css('color','white');
			listReply();
		});
	</script>	
	</html>