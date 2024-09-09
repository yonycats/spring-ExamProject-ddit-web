package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data 
public class MemberVO {
	private String memId;
	private String memPw;
	private String memName;
	private String memEmail;
	private String memTel;
	private List<String> fileList;
	@JsonIgnore
	private MultipartFile memFile;
	@JsonIgnore
	private List<MultipartFile> memFiles;
}
