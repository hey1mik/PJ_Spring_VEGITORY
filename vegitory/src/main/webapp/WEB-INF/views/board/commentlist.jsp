<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="free_board_comments">
						<div class="comment_cnt"> <span>댓글: ${list.size()}</span> <span id="refresh_btn"><i class="fas fa-redo"></i></span> </div>
						<input type="hidden" class="replyListCnt" value="${list.size()}">
						<div class="comment_area">
							<c:forEach items="${list}" var="list" >
							<div class="one_comment">
								<div class="comment_info">
									
									<span class="comment_id">${list.writer}</span>
									<span class="comment_regdate"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></span>
									<c:if test="${list.writer == name}">
									<button id="alter_comment" class="borad_btn">수정</button>
									<button id="delete_comment" class="borad_btn" data_num="${list.rno}">삭제</button>
									
									<!-- 따로 만든 input 안에 hidden으로 rno 값을 넣어주는 방법:
									<input type="hidden" class="comment_rno" value="${list.rno}">
									 -->
									</c:if>
									<button id="reply_comment" class="borad_btn">답변</button>
								</div>
								<div class="comment_content">${list.content}</div>
							</div>
							</c:forEach>
							<c:if test="${list.size() == 0}">
								<div class="one_comment">
								<div class="comment_info">
									<span class="comment_id">관리자</span>
									<span class="comment_regdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</div>
								<span class="comment_content">현재 등록된 댓글이 없습니다.</span>
							</div>
							</c:if>
														<c:choose>
								<c:when test="${empty userid}">
								 	<div class="comment_available"> <button id="span_login">로그인</button>을 하셔야만 댓글을 등록할 수 있습니다.</div>
								</c:when>
								<c:otherwise>
								<form class="frm_reply"> <!-- 여기서 싸는 폼은 내용을 보따리처럼 싸주기 위함이라서 ACTION, METHOD안써도 됨 -->
								<input type="hidden" name="bno" id="reply_bno">
								<input type="hidden" name="type" id="reply_type">
								<input type="hidden" name="writer" id="reply_writer">
								<div class="input_comment">
									<textarea id="comment_content_input" name="content"></textarea>
									<button type="button" class="comment_submit_button"> 댓글등록 </button>
									<!-- button type안에는 button을 주세요! form안에 들어있으면 button은 어차피 submit이 기본임 -->
								</div>
								<div class="commnet_err_msg"> 댓글 내용을 입력해주세요! </div>
								</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>		
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#span_login').click(function(){
				$('.header_modal_wrap').css('display','flex');
				$('#login_id').focus();
			});
			
			$('#refresh_btn').click(function(){
				$(this).css('color','white');
			});
				});
		
		</script>
</html>