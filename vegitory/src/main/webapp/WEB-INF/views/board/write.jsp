<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file="../include/header.jsp" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>VEGITORY :: 새 글 작성 </title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
	.posting_board_title {
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 30px 0 30px 0;
	}
	.posting_board_name {
		background-color: #E2D6C1;
		padding: 1px 40px 1px 40px;
		border-radius: 20%;
		font-size: 30px;
		font-weight: 600;
	}
	.posting_board_sub_name{
		padding: 1px;
		font-size: 16px;
	}
	
	.posting_contents {
		display: flex;
		flex-direction: column;
		justify-content: center;
		width: 90%;
		padding: 10px 0px 0 60px; 
	
	}

	.posting_info {
		display: flex;
		width: 100%; 
		padding-bottom: 10px;
	}

	.posting_title {
		width: 90%;
		font-size: 14px;
	}

	#sel_type {
		width: 10%;
		margin-right: 5px;
	}
	.posting {
		width: 99.83%;
		height: 600px;
	}

	.fileDrop {
		text-align: center;
		line-height: 190px;
		margin-top: 10px;
		color: rgba(0,0,0, 0.5);
		font-weight: bold;
		width: 100%;
		height: 190px;
		border: 1px solid rgba(0,0,0, 0.3);
	}

	.posting_buttons {
		display: flex;
		justify-content: center;
		padding-top: 10px;
		
	}
	.post_btn {
		font-size: 15px;
		cursor: pointer;
		padding: 10px; 
		color:rgba(0,0,0, 0.7);
		border: none;
		background-color: transparent;
	}
	.insert_btn {
		color: #3f6e58;
	}
	.posting_warning {
		visibility: hidden;
		text-align: center;
	}
	#board_search_content {
		visibility: hidden;
	}

	</style>
	</head>
	<body>
		<div class="board_wrap">
				<div class="posting_board_title">
					<div class="posting_board_name">POST</div>
					<div class="posting_board_sub_name"> 새 글을 작성합니다. </div>
				</div>
				
				<div class="posting_contents">
				<form:form  id="frm_posting">
					<div class="posting_info">
						<select id="sel_type" name="type" required>
							<option id="free" value="free" selected>자유게시판</option>
							<option id="news" value="news">비건뉴스</option>
							<option id="qna" value="qna">QnA 게시판</option>
							<option id="review" value="review">리뷰게시판</option>
						</select>
						<input class="posting_title" name="title" placeholder="제목을 입력하세요" value="${one.title}"></input>
						<input type="hidden" id="posting_writer" name="writer" value="${name}"></input>
					</div>	
					<div class="posting_postarea">
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea id="board_post_content" name="view_content" class="posting">${one.view_content}</textarea>
						<div class="form-group">
							<div class="fileDrop"> 
								<i class="fas fa-paperclip"></i>첨부하고 싶은 파일을 드래그 하세요 
							</div>
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
						</div>
					</div>	
					</form:form>
					<div class="posting_buttons">
					<button type="button" class="cancel_btn post_btn">취소</button>
					<button type="button" class="insert_btn post_btn">등록</button>
				</div>	
				<div class="posting_warning"> 값을 입력해주세요 </div>
			</div>
		</div>		
	</body>
		<script id="fileTemplate" type="text/x-handlebars-template">
			<li style="padding:15px;float:left">
				<div class="mailbox-attachment-icon has-img">
					<img src="{{imgSrc}}" alt="Attachment" class="s_img">
					<div class="mailbox-attachment-info">
					<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
						<i class="fas fa-paperclip"></i> {{originalFileName}}
					</a>
				 	<span class="btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				 		<i class="fas fa-times" style="cursor:pointer"></i>
				 	</span>
				</div>
				</div>
				
			</li>
		</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${path}/resources/js/fileAttach.js"></script>
	<script type="text/javascript">
	var flag = '${flag}';
	console.log('flag: ' + flag);
	
	var fileTemplate = Handlebars.compile($('#fileTemplate').html());
	
	$(function(){
		// write ==> 게시글 등록과 게시글 수정
		// 버튼을 등록에서 수정으로 바꿔야해서 써야함.
		if(flag == 'update'){
			$('.posting_board_sub_name').text('게시글을 수정합니다.');
			$('.insert_btn').text('수정');
		//selectbox 값으로 selected
		$('#sel_type').val('${one.type}').attr('selected','selected');
		} else if(flag == 'answer') {
			$('.posting_board_sub_name').text('답글을 작성합니다.');
			$('.insert_btn').text('등록');
			$('#sel_type').val('${one.type}')
						  .attr('selected','selected')
						  .attr('onFocus','this.initialSelect = this.selectedIndex')
						  .attr('onChange','this.selectedIndex = this.initialSelect');
			$('.posting_title').val('${one.title}')
							   .attr('readonly','readonly');
		}
		
		//1. 웹브라우저에 drag & drop시 파일이 열리는 문제
		// 기본효과를 막음!
		$('.fileDrop').on('dragenter dragover', function(e){
			e.preventDefault();
		});
		//2. 사용자가 파일을 drop했을 때
		$('.fileDrop').on('drop',function(e){
			e.preventDefault();
			
			// 드래그 한번에 파일 첨부는 딱 하나만 하게 만들 것임.
			var files = e.originalEvent.dataTransfer.files; // 드래그에 전달된 파일들. 
			var file = files[0]; // 그 중 하나만 꺼내옴
			
			var formData = new FormData(); // 폼 객체 생성
			formData.append('file',file); // 폼에 파일 1개 추가!
			
			//서버에 파일 업로드
			$.ajax({
				url: '${path}/upload/uploadAjax',
				data: formData,
				datatype: "text", // 서버에서 ajax로 받는 데이터 정보. 어떤종류의 파일인지 알려줌.
				processData: false, // ajax는 기본적으로 쿼리스트링으로 데이터를 보내는데, 이걸 쓰면 데이터를 쿼리스트링으로 안만듦.
				contentType: false, // 서버단으로 전송하는 데이터타입 multipart로 만듦.
				//'텍스트 말고도 다방면의 미디어를 받겠다.' form태그는 기본적으로 txt밖에 못보내는데, 이것을 사용하면 다른 것도 받을 수 있음.
				type: 'POST',
				success: function(data) {
					console.log(data);
					//data: 업로드한 파일 정보와 http 상태코드
					printFiles(data, '${path}');
				}
			});	
		});	
		
		$('.uploadedList').on('click','.delBtn',function(event){
			var bno = '${one.bno}';
			var that = $(this);

			if(bno == '') { // 게시글 등록
				$.ajax({
					url: '${path}/upload/deleteFile',
					type: 'POST',
					//data : 'deleted' , 'http 상태코드 200'
					data: {fileName: $(this).attr('data-src')},
					success: function(data) {
						if(data == 'deleted') {
							that.parents('li').remove();
						}
					}, error: function() {
						alert('System ERROR!!');
					}
					
				});
				
				
			} else {
				 //게시글 수정
			}
		});
		
	});
	
	
	$(document).on('click','.cancel_btn',function(){
			var referer = '${header.referer}';
			console.log(referer);
			
			var index = referer.indexOf('/board/freelist');
			console.log('index: '+referer.indexOf('/board/freelist'));
	
			if(index == '-1'){
				location.href = '${path}/board/freelist';
			} else {
				location.href = '${header.referer}';
			}
	
	});
	
	
	//게시글 등록버튼 클릭
	$(document).on('click','.insert_btn',function(){
			var title = $('.posting_title').val();
			if(title.length == 0 || title == ''){
				$('.posting_warning').css('visibility','visible')
                					 .css('color','#a48443')
                					 .text('제목을 입력해주세요');
				return false;
			} else {
				//스마트 에디터의 값을 #board_content에 입력
				oEditors.getById["board_post_content"].exec("UPDATE_CONTENTS_FIELD", []);// 클래스도 아니고 아이디로 해야됨
				
				var view_content = $('#board_post_content').val();
				console.log('view_content: ' + view_content);
				
				var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp","");
				 console.log('search_content: ' + search_content);
				$('#frm_posting').append('<textarea id="board_search_content" name="search_content"></textarea>');
				$('#board_search_content').val(search_content);
				
				// 첨부파일 목록[배열]도 추가
				var str = '';
				//uploadedList 내부의 .file 태그 각각 반복
				$(".uploadedList .file").each(function(i){ //each : 앞의 선택자 갯수만큼 반복하라는 뜻.
					console.log(i);
					str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
				});
				
				//if(deleteFileList.length > 0) {
					//$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
				//}
				// 폼에 hidden 태그들을 붙임
				alert(str);
				$("#frm_posting").append(str);
				//서버로 전송
				$('#frm_posting').submit();
			}
	});
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "board_post_content", //textarea의 아이디값과 반.드.시. 일치해야함!
	 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	
	</script>		
	</html>