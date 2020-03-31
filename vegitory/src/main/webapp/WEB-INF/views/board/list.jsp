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
			align-items: center;
			padding: 10px 10px 15px 10px;
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
		}
		.board_list {
			display: block;
			width: 100%;
			height: 100%;
			padding: 20px 0;
			border-bottom: 3px solid rgba(73, 130, 104, 0.5);
		}
		.board_list > li {
			float:left;
			width: 50%;
			padding: 30px 20px;
		}
		.flip-card {
		  position: relative;
		  background-color: transparent;
		  width: 650px;
		  height: 400px;
		  overflow:hidden;
		  transition: .5s ease;
		}
		
		 .flip-card-front, .flip-card-back {
		  position: absolute;
		  width: 100%;
		  height: 100%;
		}
		 .flip-card-back {
		  transition: .5s ease;
		  opacity: 0;
		  background-color: rgba(0,0,0,0.5);
		  color: white;
		  font-size: 15px;
		  text-align: center;
		  transition: 0.5s;
		
		}
		
		.flip-card:hover .flip-card-back {
		 opacity: 1;
		 left: 0px;
		}

	
		.page_table {
			padding: 20px 10px;
		}
		ul.pagination {
			display: inline-block;
		    list-style: none;
		}
		ul.pagination > li {
			padding: 0px 10px;
			float: left;
		}
	</style>
</head>
<body>
	<div class="board_wrap">
			<div class="board_title">
				<div class="board_name">RECIPES</div>
				<div class="board_sub_name"> 쉽고 간단해요!</div>
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
					<li><a href="#"><img src="${path}/resources/img/c15.png"><span>국/찌개</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c18.png"><span>커리/덮밥</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c17.png"><span>볶음밥</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c20.png"><span>김밥/롤</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c19.png"><span>면/국수</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c23.png"><span>튀긴요리</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c17.png"><span>죽류</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c5.png"><span>나물/반찬</span></a></li>
				
				</ul>	
				<ul class="category_common category_western">
					<li><a href="#"><img src="${path}/resources/img/c4.png"><span>샐러드</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c2.png"><span>토스트/햄버거</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c16.png"><span>퀘사디아/부리또/타코</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c3.png"><span>스테이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c19.png"><span>파스타</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c17.png"><span>오트밀/이유식</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c18.png"><span>라이스류</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c11.png"><span>기타</span></a></li>
				
				</ul>	
				<ul class="category_common category_dessert">
					<li><a href="#"><img src="${path}/resources/img/c9.png"><span>커피</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c24.png"><span>쥬스</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c22.png"><span>쉐이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c12.png"><span>베이커리</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c8.png"><span>케이크</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c10.png"><span>쿠키</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c21.png"><span>기타</span></a></li>
					<li><a href="#"><img src="${path}/resources/img/c13.png"><span>기타2</span></a></li>
				
				</ul>	
			</div>
		<div class="FilterNSearch">
			<ul class="board_filter">
				<li><a href="#">최신순</a></li>
				<li><a href="#">추천순</a></li>
				<li><a href="#">조회순</a></li>
				<li><a href="#">댓글순</a></li>
			</ul>
			<div class="SearchNWrite">
			<div class="board_search_wrap">
				<form action="${path}/board/freelist" method="GET">
					<input type="text" placeholder="레시피 검색" name="keyword" class="board_search_input">
					<button type="submit" class="board_search_btn"><i class="fas fa-search"></i></button>
				</form>	
				
			</div>
			<a href="${path}/board/write" class="board_write_btn"> 글쓰기 </a>
			</div>
		</div>
		<ul class="board_list">
		<c:forEach items="${map.list}" var="list" >
			<li><a href="#">
			<div class="flip-card">
			    <div class="flip-card-front">
			      <img src="${path}/resources/img/${list.img}" alt="Avatar" style="width:650px;height:400px;">
			    </div>
			    <div class="flip-card-back">
			      <h1>${list.title} </h1>
					<div>카테고리1: 동양식 메인요리</div><div>카테고리2: 커리/덮밥</div><div>글번호 : ${list.bno}</div><div>좋아요 : ${list.goodcnt} </div>
					<div>조회: ${list.viewcnt} </div><div>댓글: ${list.replycnt}</div><div>by ${list.writer}</div>
					<div>
						 <c:choose>
					    	<c:when test="${today == regdate}">
					    	 <fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
					    	</c:when>
					    	<c:otherwise>
					    		<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-ss"/>
					    	</c:otherwise>
				    	</c:choose>
					</div>
			  </div>
			</div>
			</a></li>
		</c:forEach>		
		</ul>
		
		<div class="page_table">
			<ul class="pagination">
			<c:if test="${map.pager.curBlock > 1}">
				<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">first page</a></li>
				<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-5}&sort_option=&${map.sort_option}&keyword=${map.keyword}" class="page_left"><i class="fas fa-angle-left"></i></a></li>
				<li><span>...</span></li>
			</c:if>
			
			
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
			<c:choose>
				<c:when test="${num == map.pager.curPage}">
					<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
				</c:otherwise>			
			</c:choose>
			</c:forEach>
			
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<li><span>...</span></li>
				<li><a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_right"><i class="fas fa-angle-right"></i></a></li>
				<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=&${map.sort_option}&keyword=${map.keyword}" class="">last page</a></li>
			</c:if>
		</ul>	
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
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