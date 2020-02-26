<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> VEGITORY :: MAIN </title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
	* {	
		box-sizing:border-box;
		font-family: 'Noto Serif KR', serif;
		z-index: 5;
	}
	.content_margin {
	margin-top:100px;
	}
	.content_wrap{
	width: 1400px;
	overflow: hidden;
	margin: 0 auto; 
	display: flex;
	flex-direction: column;
	align-items: center;
	
	
	}
	/* Slideshow container */
	.slideshow-container {
	  max-width: 1400px;
	  position: relative;
	  margin: 0 0 30px 0;
	  z-index: 5;
	}

	/* Hide the imgs by default */
	.mySlides {
	  display: none;
	}

	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  margin-top: -22px;
	  padding: 16px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	}

	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}

	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	}

	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}

	/* The dots/bullets/indicators */
	.dot {
	  cursor: pointer;
	  height: 10px;
	  width: 10px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
	}

	.active, .dot:hover {
	  background-color: #717171;
	}

	/* Fading animation */
	.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
	}

	@-webkit-keyframes fade {
	  from {opacity: .4}
	  to {opacity: 1}
	}

	@keyframes fade {
	  from {opacity: .4}
	  to {opacity: 1}
	}

	.recipe_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 20px auto; 
		z-index: 2;
	}
	.grocery_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 20px auto; 
		z-index: 2;

	}
	.grocery_list {
		width: auto;
		height: auto;
		padding-top: 50px;
		background-color: white;
	}
	.community_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 20px auto; 
		z-index: 2;

	}

	.title {
		position:relative;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-bottom: 30px;
		z-index:1;
	}
	.dashline {
		    position: absolute;
			top: 24px;
			width: 1280px;
			height: 1px;
			background: transparent;
	}

	.title_main{
		background: #E2D6C1;
		padding: 0px 40px 1px 40px;
		border-radius: 20%;
		font-size: 30px;
		font-family: 'Libre Baskerville', serif;
		font-weight: 600;
		z-index:1;
	}

	.title_sub{
		padding:1px;
		font-size: 16px;
		z-index:1;	
	}
	.community_list{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.recipe_unit{
		display: flex;
		flex-direction: column;
		align-items: center;	
	}
	#recipe_name{
		display: flex;
		align-items: center;
		padding: 10px;
		font-size: 16px;
	}
	.pdt_sort {
		width: 190px;
		height: 300px;
		text-align: center;
		line-height: 250px;
		font-size: 20px;
		font-style: italic;
	}
	.pdt_sort > span {
		background: #E2D6C1;
		border-radius: 20%;
		padding: 1px 20px;
	}
	.grocery_group{
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	.table_unit {
		box-sizing: border-box;
		width: 220px;
		height: 300px;
		text-align: center;
	}
	.community_list{
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	.community_unit{
		width: 500px;
		height: 300px;
		box-sizing: border-box;
		overflow: hidden;
		text-align: center;
		line-height: 300px;		
		margin: 0 30px;
		font-size: 20px;
		font-weight: 600;
		cursor: pointer;
		position: relative;
	}
	
	.community_unit:hover .unique_img2{
		transform: scale(1.3);
	}

	.unique_img2 {
		display: block;
		width: 500px;
		height: 300px;
		transition: transform .5s;
	}

	.cover_img2{
		position: absolute;
		top: 0;
		left: 0; 
	}
	

	.community_unit:hover .unique_img{
		transform: scale(1.3);
	}
	.unique_img {
		display: block;
		width: 500px;
		height: 300px;
		transition: transform .5s;
	}
	.cover_img{
		position: absolute;
		top: 0;
		left: 0;
	}
	
	</style>	
</head>
<body>
	<%@ include file="include/modal.jsp"%>
<div class="content_margin">
<div class="content_wrap">	
<div class="title">
<div class="title_main">VEGI-TORY</div> 
<div class="dashline"></div>
<div class="title_sub"> 베지토리와 함께하는 산뜻한 식단 </div> 
</div>
<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width imgs with number and caption text -->
  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드1.PNG" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="${path}/resources/img/병아리콩.PNG" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드3.PNG" style="width:100%">
  </div>
  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드4.PNG" style="width:100%">
  </div>
   <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드5.PNG" style="width:100%">
  </div>
   <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드6.PNG" style="width:100%">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

  <div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span>
  <span class="dot" onclick="currentSlide(5)"></span>
  <span class="dot" onclick="currentSlide(6)"></span>
</div>

</div>
<br>

<!-- The dots/circles -->


<div class="recipe_wrap">
	<div class="title"> 
		<div class="title_main">TODAY'S RECIPE</div> 
		<div class="dashline"></div>
		<div class="title_sub">쉽고 간단해요!</div> 
	</div>
	  	<div class="recipe_unit">
	  		<div><img src="${path}/resources/img/레시피1.jpg" width="800px" height="550px"></div>
	  		<span id="recipe_name"> <img src="https://img.icons8.com/emoji/50/000000/woman-cook.png" width="30px" height="30px">&nbsp; 볶음채소 파스타</span>
	  	</div>
</div>

<div class="grocery_wrap">
	<div class="title"> 
		<div class="title_main">GROCERY</div>  
		<div class="dashline"></div>
		<div class="title_sub">맛있는 재료, 즐거운 비건 라이프</div> 
	</div>
	
	<div class="grocery_list">
	
	<div class="grocery_group"> 
		<div class="pdt_sort"><span> BEST </span></div>
		<c:forEach items="${BestPdt}" var="pdt" >
			<div class="table_unit">
				<img src="${path}/resources/img/${pdt.p_img}" width="200px" height="200px">
				<div>${pdt.pname}</div>
				<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"></fmt:formatNumber>원</div>
				<div>${pdt.pmemo}</div>
			</div>
		</c:forEach>
		<div class="pdt_sort"></div>
	</div>
	<br>
	
	<div class="grocery_group"> 
		<div class="pdt_sort"> <span> NEW </span></div>
		<c:forEach items="${NewPdt}" var="pdt" >
			<div class="table_unit">
				<img src="${path}/resources/img/${pdt.p_img}" width="200px" height="200px">
				<div>${pdt.pname}</div>
				<div><fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"></fmt:formatNumber>원</div>
				<div>${pdt.pmemo}</div>
			</div>
		</c:forEach>
		<div class="pdt_sort"></div>
	</div>
	</div>
</div>

<div class="community_wrap">
	<div class="title"> 
		<div class="title_main">COMMUNITY</div> 
		<div class="dashline"></div>
		<div class="title_sub">같이 정보를 나눠요</div> 
	</div>
	<div class="community_list">
			<div class="community_unit news modal_button">
				<img class="unique_img" src="${path}/resources/img/뉴스.jpg">
				<img class="cover_img" src="${path}/resources/img/VEGANNEWS2.png">
			</div>
			<div class="community_unit madeit modal_button">
				<img class="unique_img2" src="${path}/resources/img/imadeit.jpg">
				<img class="cover_img2" src="${path}/resources/img/MADEIT2.png">
			</div>
	</div>
</div>	
</div>
</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail img controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}


$(document).on('click','#modal_no_btn',function(){
	$('.modal_wrap').attr('style','display:none');
});
</script>	
</html>