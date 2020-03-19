<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGITORY :: 레시피 </title>
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
			margin: 70px auto 0px auto; 
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 0px 10px;
		}
		.board_title {
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 30px 0 30px 0;
		}
		.board_name {
			background: #E2D6C1;
			padding: 1px 40px 1px 40px;
			border-radius: 20%;
			font-size: 30px;
			font-weight: 600;
		}
		.board_sub_name{
			padding: 1px;
			font-size: 16px;
		}
		.category_list {
			width: 100%;
			display: flex;
			justify-content: center;
			z-index:50;
		}
		.category_select {
			display: flex;
			flex-direction: column;
			width: 10%;
			height: 140px;
		}
		.category_btn{
		  background-color:transparent;
		  display: flex;
		  flex-direction: column;
		  justify-content: flex-end;
		  align-items: center;
		  padding-bottom: 5px;
		  color: black;
		  width: 100%;
		  height: 120px;
		  font-size: 13px;
		  border: none;
		  outline: none;
		}
		.category_btn_dropdown {
		  background-color: transparent;
		  color: #B8D9C6;
		  width: 100%;
		  height: 20px;
		  font-size: 14px;
		  border: none;
		  outline: none;
		}
		.dropdown_content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  width: 140px;
		  z-index:51;	
		}

		.dropdown_content > a {
		  color: black;
		  text-align: center;
		  padding: 10px 5px;  
		  font-size: 12px;
		  text-decoration: none;
		  display: block;
		}

		.dropdown_content a:hover {
		background-color: #ddd;
		}

		.dropdown:hover .dropdown_content {
		  display: block;
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
		.category_western {
			display: none;
		}
		.category_dessert {
			display: none;
		}
		.FilterNSearch{
			width: 100%;
			display: flex;
			justify-content: space-between;
			align-items: flex-end;
			padding: 10px 10px 15px 10px;
			border-bottom: 3px solid rgba(73, 130, 104, 0.5);
		}
		.board_search_wrap{
		  display:flex;
		  flex-direction: row; 
		}
		.board_filter > li{
			float: left;
			padding: 2px 10px;
		}
		.board_write_btn {
			background-color: transparent;
			border-radius: 5px;
			padding: 5px 10px; 
			cursor: pointer;
			border: none;
		    outline: none;
		    color: #498268;
		    font-weight: 550;
		    font-size: 16px;
		}
		.free_board_list {
			width: 100%;
			height: 100%;
			padding: 20px 0;
	
			border-bottom: 3px solid rgba(73, 130, 104, 0.5);	
		}
		.free_board_list > table {
			border-collapse: collapse;
			width: 100%;
			margin: 0 auto;
		    font-size: 17px;
		    text-align: left;
		    border-spacing: 2px;
		    margin: 0 -80px 0 80px;
		}
		.free_board_list td {
			padding: 0px;
			border-left: transparent;
		}
		.free_board_list tr {
			height: 50px;
		}
	
		.page_table {
			padding: 40px 10px;
		}
		ul.pagination {
			display: inline-block;
		    list-style: none;
		}
		ul.pagination > li {
			padding: 0px 10px;
			font-size: 16px;
			float: left;
		}
		.new_color{
			color: tomato;
			padding: 3px 5px;
			margin-left: 7px;
			font-size: 12px;
		}
		.twincle_eff{
			animation-name: twinkle;
			animation-duration: 1.2s;
			animation-iteration-count: infinite;
		}
		@keyframes twinkle {
			0% {opacity: 0;}
			100% {opacity: 1;}
		}
		
		#check_color {
		color:tomato;
		
		}
	</style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="board_wrap">
			<div class="board_title">
				<div class="board_name">COMMNUITY</div>
				<div class="board_sub_name"> 같이 정보를 나눠요.</div>
			</div>
			<div class="category_list">
				<div class="category_select">
					<button class="category_btn"><img src="${path}/resources/img/c2.png" width="70px" height="70px"><span>카테고리</span></button>
						<div class="dropdown">
						  <button class="category_btn_dropdown">
						    <i class="fa fa-caret-down"></i>
						  </button>
						  <div class="dropdown_content">
						    <a href="#" id="asian">동양식 메인요리</a>
						    <a href="#" id="western">서양식 메인요리</a>
						    <a href="#" id="dessert">음료와 디저트</a>
						  </div>
						</div>
				</div>
				<ul class="category_common category_asian">
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>국/찌개</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>커리/덮밥</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>볶음밥</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>김밥/롤</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>면/국수</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>튀긴요리</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>죽류</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>나물/반찬</span></a></li>
				
				</ul>	
				<ul class="category_common category_western">
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>샐러드</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>토스트/햄버거</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>퀘사디아/부리또/타코</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>스테이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>파스타</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>오트밀/이유식</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>라이스류</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>기타</span></a></li>
				
				</ul>	
				<ul class="category_common category_dessert">
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>커피</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>쥬스</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>쉐이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>베이커리</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>케이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>쿠키</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>기타</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c1.png"><span>기타2</span></a></li>
				
				</ul>	
			</div>
		<div class="FilterNSearch">
			<ul class="board_filter">
				<li><a href="${path}/board/freelist?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></li>
				<li><a href="${path}/board/freelist?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></li>
				<li><a href="${path}/board/freelist?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></li>
				<li><a href="${path}/board/freelist?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></li>
			</ul>
			<div class="board_search_wrap">
				<form action="${path}/board/freelist" method="GET">
					<input type="text" placeholder="게시글 검색" name="keyword" class="board_search_input">
					<button type="submit" class="board_search_btn"><i class="fas fa-search"></i></button>
				</form>	
				<button type="button" class="board_write_btn"> 글쓰기 </button>
			</div>
			
		</div>
		<div class="free_board_list">
			<table>
			  <tr>
			    <th>글번호</th>
			    <th>제목</th>
			    <th>조회수</th>
			    <th>댓글수</th>
			    <th>좋아요</th>
			    <th>글쓴이</th>
			    <th>등록일자</th>
			  </tr>
			 
			<c:forEach items="${map.list}" var="list" >
				<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
			  <tr>
			    <td>${list.bno}</td>
			    <td>
			    <a href="#">${list.title}</a>
			    <c:if test="${today == regdate}"><span class="new_color twincle_eff">N</span></c:if>
			    </td>
			    <td>${list.viewcnt}</td>
			    <td>${list.replycnt}</td>
			    <td>${list.goodcnt}</td>
			    <td>${list.writer}</td>
			    <td>
			     <c:choose>
			    	<c:when test="${today == regdate}">
			    	 <fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
			    	</c:when>
			    	<c:otherwise>
			    		<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-ss"/>
			    	</c:otherwise>
			    </c:choose>
			    </td>
			    <!-- today와 글 쓴 날짜가 같으면 시간이 뜨게 해주고, 다르면 년월일 나오게 출력 -->
			   
			  </tr>
			 </c:forEach> 
			</table>
		</div>	
		<div class="page_table">
			<ul class="pagination">
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="${path}/board/freelist?curPage=${map.pager.blockBegin-10}&sort_option=&${map.sort_option}&keyword=${map.keyword}" class="page_left"><i class="fas fa-angle-left"></i></a></li>
				<li><a href="${path}/board/freelist?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">1</a></li>
				<li><span>...</span></li>
			</c:if>
			
			
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
			<c:choose>
				<c:when test="${num == map.pager.curPage}">
					<li><a href="${path}/board/freelist?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${path}/board/freelist?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
				</c:otherwise>			
			</c:choose>
			</c:forEach>
			
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<li><span>...</span></li>
				<li><a href="${path}/board/freelist?curPage=${map.pager.totPage}&sort_option=&${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a></li>
				<li><a href="${path}/board/freelist?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_right"><i class="fas fa-angle-right"></i></a></li>
			</c:if>
		</ul>	
		</div>
		</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var sort_option = '${map.sort_option}';
	
			if(sort_option == 'new') {
				$('#sort_new').css('color','tomato');
			} else if(sort_option == 'cnt') {
				$('#sort_cnt').css('color','tomato');
			}  else if(sort_option == 'reply') {
				$('#sort_reply').css('color','tomato');
			}  else if(sort_option == 'good') {
				$('#sort_good').css('color','tomato');
			}
			
			$('#western').click(function(){
				$('.category_dessert').css('display','none');
				$('.category_asian').css('display','none');
				$('.category_western').css('display','flex');
			});
				$('#asian').click(function(){
				$('.category_dessert').css('display','none');
				$('.category_asian').css('display','flex');
				$('.category_western').css('display','none');
			});
				$('#dessert').click(function(){
				$('.category_dessert').css('display','flex');
				$('.category_asian').css('display','none');
				$('.category_western').css('display','none');
			});	
				
		});
	</script>	
</html>		
