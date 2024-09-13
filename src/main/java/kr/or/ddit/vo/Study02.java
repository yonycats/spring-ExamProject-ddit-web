package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Study02 {
	private String id;
	private String pw;
	private String name;
	
	private List<MultipartFile> files;	// 여러개의 파일 데이터를 받기 위한 필드
	
	// url 경로를 담아둘 필드 ("/resources/upload" + fileName;) 
	// 파일마다 복사된 해당 경로와 파일 이름을 저장한다. 
	// 파일을 다운받을 때, 삭제할 때, jsp에서 파일을 띄울 때 등 사용
	private List<String> urls;
}
