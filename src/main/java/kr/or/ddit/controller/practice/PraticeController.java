package kr.or.ddit.controller.practice;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/practice")
public class PraticeController {

	// 문제 1) 데이터를 기본타입, Map, 객체(VO) 중 하나를 선택해서 받고 출력하기
	// - 동기 테스트 페이지
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String practice() {
		return "practice/test01";
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insertPractice(@RequestParam Map<String, String> map, Model model) {
		
		model.addAttribute("map", map);
		return "practice/result";
	}
	
	// 문제 2) 다중 파일 선택해서 ajax로 데이터를 받고 jsp에 전달 후 출력하기
	// - 비동기 테스트 페이지
	@RequestMapping(value = "/test02.do", method = RequestMethod.GET)
	public String practice2() {
		return "practice/test02";
	}
	
	@RequestMapping(value = "/insertAjax.do", method = RequestMethod.POST)
	public ResponseEntity<MemberVO> insertAjax(MemberVO memberVO) {
		
		log.info("name : " + memberVO.getMemName());
		List<String> fileList = new ArrayList<String>();
		
		List<MultipartFile> memFiles = memberVO.getMemFiles();
		for (MultipartFile multipartFile : memFiles) {
			log.info("fileName : " + multipartFile.getOriginalFilename());
			log.info("size : " + multipartFile.getSize());
			log.info("contentType : " + multipartFile.getContentType());
			log.info("---------------------------------------------");
			fileList.add(multipartFile.getOriginalFilename());
		}
		memberVO.setFileList(fileList);
		
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
	}
	
}
