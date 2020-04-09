package com.vegitory.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		//byte[] 뒤에 []는 배열. byte길이의 배열이라고 보면 된다.
		//uuid 발급. 중복된 이름을 방지하기 위해서. random값을 만들어줌. 
		//asdfkjd_abc.text dslkfjdslk_abc.text 이렇게 같은 abc.text여도 중복되지않음.
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		
		//업로드할 디렉토리 생성 calcPath는 캘린더임.(원래는 calPath라고 써야함.) 디렉토리안에 오늘날짜의 폴더를 하나 더 만들어줌. 
		//당일 올라온 첨부파일은 당일 폴더에 다 들어감. 파일이 너무 많이 들어오니까 정리하는 개념.
		//uploadPath는(D드라이브에 업로드된 파일), savedPath는(날짜별로 분류된 파일).
		//둘이 합쳐야(uploadPath+savedPath) 어디에 어떤 이름으로 저장할건지가 정해짐. 
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath
					+ savedPath, savedName);
		
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		//target : 어디에 어떤 이름으로
		//fileData : 이 데이터를 넣어주세요
		// 스프링 프레임워크에서 쓰는애
		FileCopyUtils.copy(fileData, target);
		
		//파일의 확장자 검사
		//a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(
				originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;
		
		//이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // 오늘치 달력을 달라는 뜻.
		String yearPath = File.separator + cal.get(Calendar.YEAR); // 역슬러쉬로 나누라는 뜻(윈도우 기본 슬러쉬). yearPath에는 \2020이 들어감.
		//monthPath는 yearpath에다가 역슬러시를 박고, 4월이면 04이런식으로 포매팅해서 넣으라는 뜻. 근데 1을 붙이는 이유는 1월이아니라 0월부터 시작해서.
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//datePath는 monthpath에다가 역슬러시를 박고, 8일이면 08이런식으로 포매팅.
		//최종으로 datepath에는 \2020\04\08 가 들어가있음.
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		
		return datePath;
	}
	
	//String... 처음보는것... 이것이 뭐지?!
	//String... 동일한 타입의 매개변수를 여러개 받을 때 쓰는 것임.
	//List 배열로 넣어서 갖다줌.
	//동적으로 매개변수 갯수가 달라질 때 사용한다!
	private static void makeDir(String uploadPath, String... paths) {
		//디렉토리가 존재하면 skip
		// paths.length-1 이 의미하는 것. paths배열의 마지막 값을 꺼내달라는 뜻.
		// 오늘 첨부파일을 100개넣는다고 폴더를 100개 넣을 필요는 없자나?
		// 그래서 이미 오늘폴더가 있으면 만들지 말라고 써주는 것임.
		// makeDir의 Dir은 Directory임.
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		//paths안에 든것. yearPath, monthPath, datePath. 
		//paths를 돌면서 어떤 작업을 해서 path안에 넣는 작업이 향상된 for문
		// 이 for문을 다 돌고나면 c:drive/developer/upload 폴더에
		// 2020 폴더, 그 안에 04폴더, 그 안에 08폴더 세개가 만들어짐.
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
				//mkdir 은 2020/04/08을 만들때 앞애 2020폴더나 04폴더가 없으면 에러를 띄움
				//그래서 앞에부터 FOR문 돌려서 차근차근 폴더를 만들어주는 것
				//한방에 만들고싶으면 dirPath.mkdirs 해주면 됨
				
			}
		}
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
			String iconName = uploadPath + path + File.separator + fileName;
			//uploadPath를 제외한 나머지 이름들은 경로 구분이 역슬러쉬로 되어있는데
			// servlet-context에서 설정해놓은 uploadPath는 우리가 이미 하드하게 설정해놨기대문에
			// C:/developer/upload 이런식으로 일반 슬러시되어있음. 아래는 역슬러쉬를 슬러쉬로 변환해주는 과정.
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		   // iconName = C:/developer/upload/2020/04/08/djfklds_abc.txt
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼. sourceImg가 원본이미지라고 생각하면됨.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		//Scalr가 썸네일 만들어주는애임. 세로길이는 100으로 고정이지만 가로길이는 비율에 따라 달라질 수 있음.
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일 이미지의 이름을 만들어서 로컬에 저장.
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}
	
}
