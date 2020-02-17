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
		font-family: 'Nanum Myeongjo', serif;
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
	}
	.grocery_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 20px auto; 
	}
	.community_wrap {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 20px auto; 
	}

	.title {
		position:relative;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.dashline {
		    position: absolute;
			top: 24px;
			width: 1280px;
			height: 1px;
			background: #A9A9A9;
			z-index: 2;
			
	}

	.title_main{
		background: #E2D6C1;
		padding: 0px 40px 1px 40px;
		word-break: break-all;
		font-size: 30px;
		font-family: 'Libre Baskerville', serif;
		z-index: 3;
		font-weight: 600;
	}

	.title_sub{
		padding:1px;
		font-size: 18px;
	}
	.community_list{
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 40px 0px 30px 0px;
	}
	.recipe_unit{
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 40px 0px 30px 0px;
	}
	#recipe_name{
		font-size: 18px;
	}
	.table_unit{
		padding: 0px 40px 10px 40px;
	}
	.grocery_table{
		margin: 40px 0px 30px 0px;
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
	}
	.news{
		background-image: url('${path}/resources/img/뉴스.jpg');
		background-size: cover;
	}
	.madeit{
		background-image: url('${path}/resources/img/imadeit.jpg');
		background-size: cover;
	}

	
	</style>	
</head>
<body>
<div class="content_wrap">	
<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width imgs with number and caption text -->
  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드1.PNG" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드3.PNG" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="${path}/resources/img/슬라이드2.PNG" style="width:100%">
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
	  		<span id="recipe_name">볶음채소 파스타</span>
	  	</div>
</div>

<div class="grocery_wrap">
	<div class="title"> 
		<div class="title_main">GROCERY</div>  
		<div class="dashline"></div>
		<div class="title_sub">맛있는 재료, 즐거운 비건 라이프</div> 
	</div>
	<table class="grocery_table">
	<tr>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>	
	</tr>
	<tr>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>
		<td>
			<div class="table_unit">
				<img src="${path}/resources/img/grocery1.jpg" width="400px" height="400px">
				<div>타이 그린 커리 소스</div>
				<div>5900won</div>
				<div>#커리 #그린커리 #태국음식 #그린페이스트</div>
			</div>
		</td>
	</tr>
	</table>
</div>

<div class="community_wrap">
	<div class="title"> 
		<div class="title_main">COMMUNITY</div> 
		<div class="dashline"></div>
		<div class="title_sub">같이 정보를 나눠요</div> 
	</div>
	<div class="community_list">
			<div class="community_unit news modal_button"><img src="${path}/resources/img/VEGANNEWS2.png"></div>
			<div class="community_unit madeit modal_button"><img src="${path}/resources/img/MADEIT2.png"></div>
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

</script>	
</html>