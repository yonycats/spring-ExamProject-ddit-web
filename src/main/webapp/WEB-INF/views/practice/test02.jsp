<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test01</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' integrity='sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN' crossorigin='anonymous'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>
</head>
<body>

	<!-- 문제 2) 파일 선택해서 ajax로 데이터를 받고 jsp에 전달 후 출력하기, 다중 파일 전달하기 --> 
	<!-- 
		비동기 문제 )
		아이디, 비밀번호, 이름 , 이메일, 전화번호, 여러개의 파일을 입력 후
		비동기 통신을 이용하여 서버로 전송해주세요.
		
		1) 전송 후, 컨트롤러에서 넘겨받은 모든 데이터를 출력해주세요. (컨트롤러 콘솔)
			이 때, 파일은 파일명, 사이즈, 컨텐츠 타입을 출력해주세요.
			
		2) 출력 후, 응답으로 'SUCCESS UPLOAD'를 응답으로 출력해주세요. (브라우저 콘솔)
	 -->
	<form action="/practice/insert.do" method="post">
		아이디 : <input type="text" id="memId" name="memId"><br>
		비밀번호 : <input type="text" id="memPw" name="memPw"><br> 
		이름 : <input type="text" id="memName" name="memName"><br>
		이메일 : <input type="text" id="memEmail" name="memEmail"><br>
		전화번호 : <input type="text" id="memTel" name="memTel"><br>
		파일 : <input type="file" id="memFile" multiple="multiple"><br>
	</form>
	<hr>
	
	<button type="button" id="btn">전송하기</button>
	<hr>
	
	<div class="row" id="contentRow">
	</div>

<script type="text/javascript">
$(function() {
	$('#btn').on('click', function() {
		let memId = $('#memId').val();
		let memPw = $('#memPw').val();
		let memName = $('#memName').val();
		let memEmail = $('#memEmail').val();
		let memTel = $('#memTel').val();
		let files = $('#memFile')[0].files;
		
		// 이렇게 부르면 전체 파일에 대한 file객체가 불러와지고
		console.log($('#memFile'));
		// 이렇게 인덱스를 지정해서 부르면 전체 파일에 대한 file객체 중 [0]번째 인덱스의,
		// files 속성을 불러오고 그 속성 안에는 선택한 파일들에 대한 file정보가 들어있다.
		console.log($('#memFile')[0]);
		
		let formData = new FormData();
		formData.append("memId", memId);
		formData.append("memPw", memPw);
		formData.append("memName", memName);
		formData.append("memEmail", memEmail);
		formData.append("memTel", memTel);
		// 다중 파일 선택해서 VO List에 for문으로 넣기
		for (let i = 0; i < files.length; i++) {
			// formData.append("memFiles[" + i + "]", files[i]);
			formData.append("memFiles", files[i]);
		}

		$.ajax({
			url : "/practice/insertAjax.do",
			type : "post",
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				console.log(res);
				
				let contentRow = $('#contentRow');
				let html = "";
				
				html += "<div class='col-md-3'>";
				html += "	<div class='card'>";
				html += "		<div class='card-header'>";
				html += "			<div class='card-title'>비동기에서 반환된 파일 데이터 출력</div>";
				html += "		</div>";
				html += "		<div class='card-body'>";
				html += "			<div>" + res.memId + "</div>";
				html += "			<div>" + res.memPw + "</div>";
				html += "			<div>" + res.memName + "</div>";
				html += "			<div>" + res.memEmail + "</div>";
				html += "			<div>" + res.memTel + "</div>";
				html += "		</div>";
				html += "		<div class='card-footer'>";
				for (let i = 0; i < res.fileList.length; i++) {
					html += "		<div>" + res.fileList[i] + "</div>";
				}
				html += "		</div>";
				html += "	</div>";
				html += "</div>";

				contentRow.append(html);
			}
		});
		
	});	
});
</script>

</body>
</html>