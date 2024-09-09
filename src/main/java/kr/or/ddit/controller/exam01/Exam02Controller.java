package kr.or.ddit.controller.exam01;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/exam02")
public class Exam02Controller {

	// *** 데이터 받기 연습 *** 
	// Map, VO, 파일
	
	// ----------------------- 비동기방식의 요청 연습 페이지 ----------------------------
	@RequestMapping(value="/exam02.do", method = RequestMethod.GET)
	public String exam01() {
		return "exam02/exam02";
	}
	
	/*
	 	비동기 요청시, 실행할 Target
	 	요구사항 : 비동기 통신을 이용하여 총 3개의 데이터를 전송받는다.
	 			전송박은 데이터는 컬렉션을 이용하여 받아주세요.
	 			받은 데이터는 콘솔에 모두 출력해주세요.
	 			받은 데이터들 중, 아이디의 값을 정상적으로 받아왔다면 'SUCCESS-아이디값' 으로 가공 후 응답으로 내보내주세요.
	 */
	
	/*
	 	******** 비동기 통신을 이용한 방법
	 	
	 	1) 비동기 통신을 이용한 방법 중, 
		 	첫번째 : @ResponseBody -> 헤더 설정 불가, 데이터만 태울 수 있음, 데이터 세팅 후 전달 외에는 용도가 없음
		 							붙이는 순간, 응답으로 내보내는 것은 페이지 문자열이 아닌 "데이터"라는 의미!
		 	두번째 : ResponseEntity -> 헤더 설정 가능, 상태코드 설정 가능(HttpStatus.CREATED) -> 이를 이용해 썸네일과 파일 다운로드가 가능
		 							썸네일과 파일 다운로드를 하는 것은 헤더 설정이 필요하기 때문! 헤더설정 정보를 기반으로 이미지와 파일을 세팅함.
	 */
	
	// 데이터를 리턴해주어야 한다. 즉 ResponseEntity 객체의 제네릭 타입으로 설정되어 있는 타입이 곧 응답 타입으로 내보낼 데이터 타입이다.
	// @PathVariable : (value = "/insert/{type}"에 설정한 쿼리스트링의 이름을 메소드 파라미터 int type과 연결시켜줌
	
	// @RequestBody : 요청 본문 (HTTP Body) 안에 있는 데이터를 꺼내서 컬렉션과 바인딩시켜주기 위해서 필요함
	
	// ************ Request Payload(body)에 세팅이 되는 데이터는 body 내부에 세팅된 정보
	// ************ Quert String Parameters(headers)에 쿼리스트링으로 세팅한 데이터는 헤더에 설정된 정보
	
	// *** 1. ajax로 넘긴 데이터 받기 (@RequestBody) (Map)
	@RequestMapping(value = "/insert/{type}", method = RequestMethod.POST)
	public ResponseEntity<String> examInsert(@PathVariable int type, @RequestBody Map<String, String> map) {
		log.info("type : " + type);
		log.info("name : " + map.get("memName"));
		log.info("id : " + map.get("memId"));
		log.info("pw : " + map.get("memPw"));
		
		return new ResponseEntity<String>("SUCCESS-" + map.get("memId"), HttpStatus.OK);
	}
	
	// *** 2. ajax로 넘긴 데이터 받기 (@RequestBody) (VO)
	@ResponseBody
	@RequestMapping(value = "/insert2/{type}", method = RequestMethod.POST)
	public ResponseEntity<String> examInsert2(@PathVariable int type, @RequestBody MemberVO memberVO) {
		log.info("type : " + type);
		log.info("name : " + memberVO.getMemName());
		log.info("id : " + memberVO.getMemId());
		log.info("pw : " + memberVO.getMemPw());
		
		return new ResponseEntity<String>("SUCCESS-" + memberVO.getMemId(), HttpStatus.OK);
	}
	
	// ResponseEntity는 헤더와 바디와 상태코드를 모두 세팅해서 보낼 수 있는 객체
	//		-> 안붙여도 데이터는 바로 넘어가지만 일부러 붙이는 이유는 직관성 때문
	
	// *** 3. ajax로 넘긴 파일 데이터 받기 File (VO)
	// 파일 데이터를 받을 때에는 @RequestBody를 붙이지 않고 그냥 VO로만 받는다. 
//	@ResponseBody
//	@RequestMapping(value = "/insert3/{type}", method = RequestMethod.POST)
//	public ResponseEntity<String> examInsert3(@PathVariable int type, MemberVO memberVO) {
//		log.info("type : " + type);
//		log.info("name : " + memberVO.getMemName());
//		log.info("id : " + memberVO.getMemId());
//		log.info("pw : " + memberVO.getMemPw());
//		log.info("file : " + memberVO.getMemFile().getOriginalFilename());
//		
//		return new ResponseEntity<String>("SUCCESS-" + memberVO.getMemId(), HttpStatus.OK);
//	}
	@ResponseBody
	@RequestMapping(value = "/insert3/{type}", method = RequestMethod.POST)
	public ResponseEntity<MemberVO> examInsert3(@PathVariable int type, MemberVO memberVO) {
		log.info("type : " + type);
		log.info("name : " + memberVO.getMemName());
		log.info("id : " + memberVO.getMemId());
		log.info("pw : " + memberVO.getMemPw());
		log.info("file : " + memberVO.getMemFile().getOriginalFilename());
		
		return new ResponseEntity<MemberVO>(memberVO, HttpStatus.OK);
	}
	
}
