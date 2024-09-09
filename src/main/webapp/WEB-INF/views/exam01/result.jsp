<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' integrity='sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN' crossorigin='anonymous'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>
</head>
<body>
	<h1>동기 방식을 이용한 요청 처리 연습해보기</h1>
	<hr/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">동기방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						<!-- 데이터 받기 / String으로 데이터를 넘겼을 때 -->
						memName : ${memName }<br/>
						memId : ${memId }<br/>
						memPw : ${memPw }<br/>
					</div>
					<div class="card-footer">
						기본 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">동기방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						<!-- 데이터 받기 / Map으로 데이터를 넘겼을 때 -->
						memName2 : ${memName }<br/>
						memId2 : ${memId }<br/>
						memPw2 : ${memPw }<br/>
						
						map.get("memName2") : ${param.memName }<br/>
						map.get("memId2") : ${param.memId }<br/>
						map.get("memPw2") : ${param.memPw }<br/>
					</div>
					<div class="card-footer">
						컬렉션 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
		</div>
		
		<div class="row pt-3">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">동기방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						memName : ${memberVO.memName }<br/>
						memId : ${memberVO.memId }<br/>
						memPw : ${memberVO.memPw }<br/>
					</div>
					<div class="card-footer">
						객체 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">동기방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						memName : ${memberVO.memName }<br/>
						memId : ${memberVO.memId }<br/>
						memPw : ${memberVO.memPw }<br/>
						memFile.fileName : ${memberVO.memFile.originalFilename }<br/>
						memFile.size : ${memberVO.memFile.size }<br/>
						memFile.contentType : ${memberVO.memFile.contentType }<br/>
					</div>
					<div class="card-footer">
						파일 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>