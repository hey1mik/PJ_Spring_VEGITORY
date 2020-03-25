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
						<div class="comment_cnt"> 댓글: ${list.size()} </div>
						<div class="comment_area">
							<c:forEach items="${list}" var="list" >
							<div class="one_comment">
								<div class="comment_info">
									<span class="comment_id">${list.writer}</span>
									<span class="comment_regdate"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></span>
									<button id="alter_comment" class="borad_btn">수정</button>
									<button id="delete_comment" class="borad_btn">삭제</button>
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
								<div class="input_comment">
									<input type="text" class="comment_content_input" name="comment">
									<button type="submit" class="comment_submit_button"> 댓글등록 </button>
								</div>
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
				});
		</script>
</html>