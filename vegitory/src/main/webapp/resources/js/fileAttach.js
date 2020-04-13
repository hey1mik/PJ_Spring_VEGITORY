
	function getFileInfo(fullName, path){
		var originalFileName;
		var imgSrc;
		var originalFileUrl;
		var uuidFileName;
		var basicFileName = fullName; // 삭제시 값을 전달하기 위한 파일
		
		//이미지 파일이면
		if(checkImageType(fullName)) {
			imgSrc = path+"/upload/displayFile?fileName="+fullName;
			uuidFileName = fullName.substr(14);
			var originalImg = fullName.substr(0,12) + fullName.substr(14);
			originalFileUrl = path+"/upload/displayFile?fileName=" + originalImg;
		} else {
			imgSrc = path+"/resources/img/file-icon.png"; //파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			//파일 다운로드 요청링크
			originalFileUrl = path+"/upload/displayFile?fileName=" + fullName;
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
		
		//14보다 크면 실행
		if(originalFileName.length > 14) {
			//앞에서부터 11글자 자름
			var shortName = originalFileName.substr(0,10);
			var formatVal = originalFileName.split(".");
			
			var arrNum = formatVal.length - 1;
			originalFileName = shortName + "..." + formatVal[arrNum];
		}
		return {originalFileName:originalFileName, imgSrc:imgSrc, originalFileUrl:originalFileUrl, fullName:fullName, basicFileName:basicFileName};
	}
	
	
	function printFiles(data, path) {
		//파일 정보처리
		var fileInfo = getFileInfo(data, path);
		var ImageTrue = checkImageType(data);
		console.log(fileInfo);
		console.log(ImageTrue);
		//Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
		var html = fileTemplate(fileInfo);
		html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";
		//Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedList").append(html);
		//이미지파일인 경우 aaaaaaaaaaa파일 템플릿에 lightbox 속성 추가
		if(fileInfo.fullName.substr(12,2) === "s_"){
			//마지막에 추가된 첨부파일 템플릿 선택자
			var that = $(".uploadedList li").last();
			// lightbox 속성 추가
			that.find(".mailbox-attachment-name").attr("data-lightbox","uploadImages");
			//파일 아이콘에서 이미지 아이콘으로 변경
			that.find(".fa-paperclip").attr("class","fa fa-camera");
		}
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)) { //이미지 파일이면 skip
			return;
		} else {
		var idx=fileName.indexOf("_"+1); //uuid를 제외한 파일이름
		return fileName.substr(idx);
		}
	}
	
	function getImageLink(fileName) {
		if(!checkImageType(fileName)) { //이미지 파일이 아니면 skip
			return;
		}
		var front = fileName.substr(0,12); // 연월일 경로
		var end = fileName.substr(14); // s_ 제거
		return front + end;
	}
	
	function checkImageType(fileName) {
		var pattern =/jpg|gif|png|jpeg/i; // 정규표현식(대소문자 무시)
		return fileName.match(pattern); // 규칙에 맞으면 true			
	}
	
	//첨부파일 리스트를 출력하는 함수
	function listAttach() {
		var listCnt = 0;
		$.ajax({
			type: "POST",
			url: "${path}/board/getAttach/${one.bno}",
			async: false,
			success: function(list) {
				// list: json
				// console.log(list);
				listCnt = list.length;
				$(list).each(function(i,e){
					printFiles(e);
				});
			}
		});
	}
	