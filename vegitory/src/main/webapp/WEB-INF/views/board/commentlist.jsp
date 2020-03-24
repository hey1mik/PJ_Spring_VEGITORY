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
	<div class="free_board_comments">
						<div class="comment_cnt"> 댓글: ${list.size()} </div>
						<div class="comment_area">
							<c:forEach items="${list}" var="list" >
							<div class="one_comment">
								<div class="comment_info">
									<span class="comment_id">${list.writer}</span>
									<span class="comment_regdate">${list.regdate}</span>
									<button id="alter_comment" class="borad_btn">수정</button>
									<button id="delete_comment" class="borad_btn">삭제</button>
									<button id="reply_comment" class="borad_btn">답변</button>
								</div>
								<div class="comment_content">${list.content}</div>
							</div>
							</c:forEach>
							<div class="input_comment">
								<input type="text" class="comment_content_input" name="comment">
								<button type="submit" class="comment_submit_button"> 댓글등록 </button>
							</div>
						</div>
					</div>		
</body>
</html>