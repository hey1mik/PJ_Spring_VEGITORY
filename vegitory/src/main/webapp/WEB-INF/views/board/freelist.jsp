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
			padding: 10px 10px 7px 10px;
			border-bottom: 3px solid rgba(73, 130, 104, 0.5);
		}
		.SearchNWrite{
			display: flex;
			flex-direction: row;
			align-items: center;
		}
		.board_search_wrap{
		  display:flex;
		  flex-direction: row; 
		  justify-content: space-around;
		  height: 25px;
		  width: 280x;
		  border-bottom: 1px solid rgba(0,0,0,0.3);
		}
		.board_search_input {
		 font-size: 14px;
		 width: 250px;
		 height: 20px;
		 border: none;
		 }
		.board_search_btn{
		  border: none;
		  background-color: transparent;
		  height: 20px;
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
			padding: 10px 0;
			padding-left: 80px;
			border-bottom: 3px solid rgba(73, 130, 104, 0.5);	
		}
		.free_search_result {
			display: none;
			width: 100%;
			text-align: center;
			margin-bottom:20px;
			float:left;
		}
		.free_search_result > a {
			color: tomato;
		}
		.free_board_list > table {
			border-collapse: collapse;
			width: 100%;
			margin: 0 auto;
		    font-size: 16px;
		    text-align: left;
		    border-spacing: 2px;
		    margin: 0 auto;
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
		
		#color {
		 background-color: rgba(73, 130, 104, 0.3);
		}
	</style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="board_wrap">
			<div class="board_title">
				<div class="board_name">COMMUNITY</div>
				<div class="board_sub_name"> '자유게시판' 입니다. </div>
			</div>
			<div class="category_list">
				<ul class="category_common category_asian">
					<li><a href="#"><img src="${path}/resources/img/c4.png"><span>비건뉴스</span></a></li>
					<li><a href="${path}/board/freelist"><img src="${path}/resources/img/c5.png"><span>자유게시판</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c6.png"><span> Q&A 게시판</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c7.png"><span>리뷰 게시판</span></a></li>
				</ul>	
			</div>
		<div class="FilterNSearch">
			<ul class="board_filter">
				<li><a href="${path}/board/freelist?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></li>
				<li><a href="${path}/board/freelist?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></li>
				<li><a href="${path}/board/freelist?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></li>
				<li><a href="${path}/board/freelist?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></li>
			</ul>
			<div class="SearchNWrite">
			<div class="board_search_wrap">
				<form action="${path}/board/freelist" method="GET">
					<input type="text" placeholder="게시글 검색" name="keyword" class="board_search_input">
					<button type="submit" class="board_search_btn"><i class="fas fa-search"></i></button>
				</form>	
				
			</div>
			<a href="${path}/board/write" class="board_write_btn"> 글쓰기 </a>
			</div>
		</div>
		<div class="free_board_list">
			<div class="free_search_result">
				"${map.keyword}" 검색결과  ${map.count}건 검색되었습니다.
				<a href="${path}/board/freelist" class="board_clear_btn"> 초기화 </a>
			</div>
			
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
			    <c:if test="${list.re_level !=0}">
			     <c:forEach begin="1" end="${list.re_level}">
			     	<span>&nbsp</span>
			     </c:forEach>
			     RE:
			    </c:if>
			    <a href="${path}/board/view?bno=${list.bno}" class="free_board_title">${list.title}</a>
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
			

			var blank = '';
			var i = 0;
			
			for (i = 0; i<= re_level; i++){
				blank = blank + '&nbsp';
			}
			
			
			var sort_option = '${map.sort_option}';
			var free_search_result = '${map.keyword}';
			var count = '${map.count}';
			var title = new Array(count).fill('');
			var newtitle = new Array(count).fill('');
			
			if(free_search_result != '') {
				$('.board_search_input').attr('placeholder','false');
				$('.board_search_input').val('${map.keyword}');
				$('.free_search_result').css('display','block');
				
				for(var i=0;i<count;i++){
					title[i] = $('.free_board_title:eq('+i+')').text();
					newtitle[i] = title[i].replace("${map.keyword}","<span id=color>${map.keyword}</span>");
					$('.free_board_title:eq('+i+')').html(newtitle[i]);
				}
			
			
				
			}
	
			if(sort_option == 'new') {
				$('#sort_new').css('color','tomato');
			} else if(sort_option == 'cnt') {
				$('#sort_cnt').css('color','tomato');
			}  else if(sort_option == 'reply') {
				$('#sort_reply').css('color','tomato');
			}  else if(sort_option == 'good') {
				$('#sort_good').css('color','tomato');
			}
			
				
		});
	</script>	
</html>		
