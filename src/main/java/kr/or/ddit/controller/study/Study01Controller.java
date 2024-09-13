package kr.or.ddit.controller.study;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.Study01;
import kr.or.ddit.vo.Study02;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/study")
public class Study01Controller {

	@GetMapping("/exam01")
	public String exam01() {
		return "study/exam01";
	}
	
	@PostMapping("/insert1.do")
	public String insert1(Study01 study01, Model model) {
		log.info("id : " + study01.getId());
		log.info("pw : " + study01.getPw());
		log.info("name : " + study01.getName());
		
		model.addAttribute("result", study01);
		return "study/result";
	}
	
	@PostMapping("/insert2.do")
	public String insert2(HttpServletRequest req, Study02 study02, Model model) throws Exception {
		log.info("id : " + study02.getId());
		
		// ROOT/resources/upload
		String savePath = req.getServletContext().getRealPath("/resources/upload");
		
		// 파일 복사를 위한 폴더 경로 만들기
		File saveFile = new File(savePath);
		if (!saveFile.exists()) {	// 폴더 구조를 생성
			saveFile.mkdirs();
		}
		List<String> urls = new ArrayList<String>();
		
		
		List<MultipartFile> files = study02.getFiles();
		for (MultipartFile file : files) {
			log.info("fileName : " + file.getOriginalFilename());
			log.info("fileSize: " + file.getSize());
			log.info("fileContentType : " + file.getContentType());
			log.info("---------------------------------");
			
			/* 
			 *** 파일 복사에 대한 정해진 규격이 있음 > 순서 ***
			
			1. 넘겨받은 파일 데이터의 파일명을 결정한다. (UUID_원본파일명)
			2. 저장할 서버 경로를 결정한다. ((HttpServletRequest)req.getServletContext().getRealPath() 활용)
				> 우리가 사용할 경로 정하기 (ROOT 즉, '/'부터 시작)
				/resources/upload
			3. 결정된 경로와 파일명을 이용해서 파일 복사를 진행한다.
			4. 데이터베이스에 파일 정보를 저장한다.
			 */
			
			// 1. 넘겨받은 파일 데이터의 파일명을 결정한다. (UUID_원본파일명)
			String fileName = UUID.randomUUID().toString();		// UUID를 만든다.
			fileName += "_" + file.getOriginalFilename();		// UUID_원본파일명
			
			// 2. 저장할 서버 경로를 결정한다. > 우리가 사용할 경로 정하기 (ROOT 즉, '/'부터 시작)
			// 위에서 결정된 서버 경로와 파일을 복사하기 위한 최종 경로를 만들어준다.
			String finalPath = savePath + "/" + fileName;
			
			// 3. 결정된 경로와 파일명을 이용해서 파일 복사를 진행한다.
			File newFile = new File(finalPath); 	// 파일 복사를 위한 파일 객체 생성
			file.transferTo(newFile);
			
			String url = "/resources/upload/" + fileName;
			urls.add(url);
		}
		study02.setUrls(urls);
		
		model.addAttribute("result", study02);
		return "study/result2";
	}
	
}
