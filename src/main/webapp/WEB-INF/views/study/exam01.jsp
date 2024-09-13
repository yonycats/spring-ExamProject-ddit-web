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
	<div class="pt-3 pb-3 text-center">
		<h3>동기방식을 이용한 일반데이터 + 파일데이터 전송하기</h3>
		<hr/>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">
							일반데이터 전송하기<br/><br/>
							<p style="font-size:11px;">
								요구사항<br/> 
								1. 아이디, 비밀번호, 이름을 입력받고 Session에 저장 후 결과 페이지에서 데이터를 출력해주세요.
							</p>
						</div>
					</div>
					<div class="card-body">
						<form action="/study/insert1.do" method="post" id="addForm">
							<div class="input-group">
								<input type="text" class="form-control" name="id" id="" placeholder="input id..."/>
							</div>
							<div class="input-group pt-2">
								<input type="text" class="form-control" name="pw" id="" placeholder="input pw..."/>
							</div>
							<div class="input-group pt-2">
								<input type="text" class="form-control" name="name" id="" placeholder="input name..."/>
							</div>
							<div class="pt-2">
								<button type="submit" class="btn btn-primary" id="addBtn">등록</button>
							</div>
						</form>
					</div>
					<div class="card-footer">
						
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title">
							일반데이터 + 파일데이터 전송하기<br/><br/>
							<p style="font-size:11px;">
								요구사항<br/> 
								1. 아이디, 비밀번호, 이름, 여러개의 파일을 입력받고 Session에 저장 후 결과 페이지에서 데이터를 출력해주세요.<br/>
								2. 여러개의 파일은 업로드를 위한 서버 경로에 업로드 해주세요.(파일 복사)<br/>
								　** 업로드 경로 : /resources/upload/
							</p>
						</div>
					</div>
					<div class="card-body">
						<form action="/study/insert2.do" method="post" id="addForm" enctype="multipart/form-data">
							<div class="input-group">
								<input type="text" class="form-control" name="id" id="" placeholder="input id..."/>
							</div>
							<div class="input-group pt-2">
								<input type="text" class="form-control" name="pw" id="" placeholder="input pw..."/>
							</div>
							<div class="input-group pt-2">
								<input type="text" class="form-control" name="name" id="" placeholder="input name..."/>
							</div>
							<div class="input-group pt-2">
								<input type="file" class="form-control" name="files" id="" multiple/>
							</div>
							<div class="pt-2">
								<button type="submit" class="btn btn-primary" id="addBtn">등록</button>
							</div>
						</form>
					</div>
					<div class="card-footer">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>