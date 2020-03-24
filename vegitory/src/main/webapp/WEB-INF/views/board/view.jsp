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
		border-top: 1px solid rgba(0,0,0,0.3);
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
		padding: 20px 0; 
		width: 95%;
	}

	.comment_cnt {
		padding-bottom: 10px;
		font-weight: bold;
	}

	.one_comment {
		width: 95%;
		padding: 10px 0px;
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

	.comment_content_input {
		width: 90%;
		height: 150px; 
	}
	.comment_submit_button {
		border: 1px solid rgba(0,0,0,0.3);
		border-left: none;
		width: 10%;
		cursor: pointer;
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
							<span id="view_regdate"><span class="info_div">작성일자</span>
							<c:choose>
						    	<c:when test="${today == regdate}">
						    	 <fmt:formatDate value="${view.updatedate}" pattern="HH:mm:ss"/>
						    	</c:when>
						    	<c:otherwise>
						    		<fmt:formatDate value="${view.updatedate}" pattern="yyyy-MM-ss"/>
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
				<div class="free_board_comments">
					<div class="comment_cnt"> 댓글: ${view.replycnt} </div>
					<div class="comment_area">
						<div class="one_comment">
							<div class="comment_info">
								<span class="comment_id">혜롤리</span>
								<span class="comment_regdate">2020-03-23</span>
								<button id="alter_comment" class="borad_btn">수정</button>
								<button id="delete_comment" class="borad_btn">삭제</button>
								<button id="reply_comment" class="borad_btn">답변</button>
							</div>
							<div class="comment_content">와 정말 유용한 정보네요. 좋은 글 감사드립니다.</div>
						</div>
						<div class="input_comment">
							<input type="text" class="comment_content_input" name="comment">
							<button type="submit" class="comment_submit_button"> 댓글등록 </button>
						</div>
					</div>
				</div>	
			</div>
		</div>		
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
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
	</script>	
	</html>