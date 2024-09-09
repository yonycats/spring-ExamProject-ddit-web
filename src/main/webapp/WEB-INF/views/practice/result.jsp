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
	<h1>동기방식의 VO타입 데이터 전송</h1>
	<hr/>
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">동기방식의 VO타입 데이터 전송</div>
					</div>
					<div class="card-body">
						memId : ${map.memId }<br/>
						memPw : ${map.memPw }<br/>
						memName : ${map.memName }<br/>
						memEmail : ${map.memEmail }<br/>
						memTel : ${map.memTel }<br/>
					</div>
					<div class="card-footer">
						VO타입 데이터
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>