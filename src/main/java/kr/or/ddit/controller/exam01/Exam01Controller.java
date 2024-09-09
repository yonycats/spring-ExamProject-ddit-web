package kr.or.ddit.controller.exam01;

import java.util.Map;

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
@RequestMapping(value="/exam01")
public class Exam01Controller {

	// *** 데이터 받기 연습 *** 
	// Map, VO, 파일
	
	// ----------------------- 동기방식의 요청 연습 페이지 ----------------------------
	@RequestMapping(value="/exam01.do", method = RequestMethod.GET)
	public String exam01() {
		return "exam01/exam01";
	}
	
	// *** 1. String으로 데이터 받기
	// @RequestParam : form의 name과 컨트롤러의 파라미터 변수명이 다를 때, 서로 매핑시켜주기
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String exam01Insert(
			String memName, @RequestParam(value = "MemId") String memId, @RequestParam(value = "MemPw") String memPw, 
			Model model
			) {
		log.info("memName : " + memName);
		log.info("memId : " + memId);
		log.info("memPw : " + memPw);
		
		model.addAttribute("memName", memName);
		model.addAttribute("memId", memId);
		model.addAttribute("memPw", memPw);
		
		return "exam01/result";
	}
	
	// *** 2. Map으로 데이터 받기
	// key = value의 형식으로 데이터가 들어옴
	// 1) Map에서 데이터를 뽑아서 개별 데이터로 하나씩 넘김 -> @requestParam을 붙이지 않으면 애초에 데이터가 받아지지 않음
	// 2) Map형식으로 데이터를 통째로 바로 넘겨서 ${param.memName }로 데이터를 출력하면 @requestParam을 붙이지 않아도 데이터가 나옴, 
	// 			왜? -> 그렇게 해도 데이터가 넘어감, 공식문서에도 설명되어 있지 않은 경우의 수일 뿐,
	//					 실제로 데이터를 넘길 때는 그렇게 넘기지 않는다. 정해진 약속, @RequestParam 붙여줄 것
	@RequestMapping(value = "/insert2.do", method = RequestMethod.POST)
	public String exam01Insert2(
			@RequestParam Map<String, String> param,
			Model model
			) {
		log.info("memName : " + param.get("memName"));
		log.info("memId : " + param.get("memId"));
		log.info("memPw : " + param.get("memPw"));
		
		// 데이터를 전달하는 방법
		// 1) 응용 - Map 객체 그대로 전달하는 방법
		model.addAttribute("param", param);
		
		// 2) 각각의 데이터를 개별로 추가하여 전달하는 방법
		model.addAttribute("memName", param.get("memName"));
		model.addAttribute("memId", param.get("memId"));
		model.addAttribute("memPw", param.get("memPw"));
		
		return "exam01/result";
	}

	// *** 3. VO로 받기
	@RequestMapping(value = "/insert3.do", method = RequestMethod.POST)
	public String exam01Insert3(MemberVO memberVO, Model model
			) {
		log.info("memName : " + memberVO.getMemId());
		log.info("memId : " + memberVO.getMemName());
		log.info("memPw : " + memberVO.getMemPw());
		
		// 데이터를 전달하는 방법
		// 1) VO 자바빈 객체로 전달하는 방법
		model.addAttribute("memberVO", memberVO);
		
		return "exam01/result";
	}
	
	// *** 4. 파일 데이터 받기
	@RequestMapping(value = "/insert4.do", method = RequestMethod.POST)
	public String exam01Insert4(MemberVO memberVO, Model model
			) {
		log.info("memName : " + memberVO.getMemId());
		log.info("memId : " + memberVO.getMemName());
		log.info("memPw : " + memberVO.getMemPw());
		
		MultipartFile file = memberVO.getMemFile();
		log.info("fileName : " + file.getOriginalFilename());
		log.info("fileSize : " + file.getSize());
		log.info("fileContentType : " + file.getContentType());
		
		// 데이터를 전달하는 방법
		model.addAttribute("memberVO", memberVO);
		
		return "exam01/result";
	}
	
}
