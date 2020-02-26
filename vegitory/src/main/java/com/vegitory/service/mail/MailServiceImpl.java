package com.vegitory.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.vegitory.persistence.MemberDAO;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	//이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		//그냥 string을 써도 작업 자체는 되지만,
		// 왜 StringBuffer를 쓰냐? 효율성때문에 그렇다.
		// 아스키코드를 숫자로, 숫자는 아스키코드로 치환하는 작업을 하기에 SB가 더 편리함
		// String : immutable => 값을 바꿀 수가 없음. 값이 새로 들어가면 기존에 있던 메모리는 버려버리고 새로운 주소에 값 저장.
		// buffer = 임시저장소. buffer를 쓰는 이유는 속도차이때문에 사용함.
		// buffer영역에다 값을 넣어놨다가 수정이 끝나면 한번에 메모리에 담겠다는 뜻.

		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <=90) || (num >= 97 && num <=122)) {
				sb.append((char) num);
			} else {
				continue;
				}
		} while(sb.length() < size);
		
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20); // 길이 20의 난수 생성
		mDao.getKey(id, key);
		MimeMessage mail = mailSender.createMimeMessage();
		//Mimetype 메일: 동영상, 소리, 그림 등등을 다 받을 수 있는 타입의 메일
		String htmlTxt = "<h2> 안녕하세요 VEGITORY 입니다. </h2><br><br> "
						+"<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 VEGITORY 사이트 활동이 가능합니다."
						+"<a href='http://localhost:8081" + request.getContextPath() + "/member/keyauth?id=" + id + "&key=" +key+ "'> 인증하기 </a></p>"
						+"(VEGITORY에 가입한적이 없으시다면 무시하셔도 됩니다.)";
				try {
					mail.setSubject("[본인인증]  VEGITORY 님의 인증메일입니다.", "utf-8");
					mail.setText(htmlTxt, "utf-8", "html");
					mail.addRecipient(RecipientType.TO, new InternetAddress(email));
					mailSender.send(mail); // 메일 발송
				}catch(MessagingException e) {
					e.printStackTrace();
				}
			}

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id, key);
	}

}
