<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test01</title>
</head>
<body>
	<!-- 문제 1) 데이터를 기본타입, Map, 객체(VO) 중 하나를 선택해서 받고 출력하기 -->
	<!-- 
		총 5가지의 데이터를 기본타입, Map, 객체(VO) 상관없이 하나를 선택해서, 
		결과 페이지로 전송 후, 콘솔로 총 5가지의 데이터를 출력해주세요.
		그리고 리턴되서 이동할 결과페이지(/practice/result/jsp)로 이동하여
		결과를 출력해주세요!
	 -->
	<form action="/practice/insert.do" method="post">
		아이디 : <input type="text" name="memId"><br>
		비밀번호 : <input type="text" name="memPw"><br>
		이름 : <input type="text" name="memName"><br>
		이메일 : <input type="text" name="memEmail"><br>
		전화번호 : <input type="text" name="memTel"><br>
		<input type="submit" value="전송">
	</form>

</body>
</html>