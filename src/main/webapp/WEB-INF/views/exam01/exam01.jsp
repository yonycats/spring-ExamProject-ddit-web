<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' integrity='sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN' crossorigin='anonymous'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>

<style type="text/css">
font {
	font-size: 1.3em;
	color: red;
	font-weight: bolder;
	margin-right: 15px;
}
</style>

</head>
<body>
	<h1>동기 방식을 이용한 요청 처리 연습해보기</h1>  
	<hr/>
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title"><font>*동기*</font>방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						<form action="/exam01/insert.do" method="post">
							<input type="text" name="memName" class="form-control" placeholder="이름을 입력해주세요."/><br/>
							<input type="text" name="MemId" class="form-control" placeholder="아이디를 입력해주세요."/><br/>
							<input type="text" name="MemPw" class="form-control" placeholder="비밀번호를 입력해주세요."/><br/>
							<button class="btn btn-primary">등록</button>
						</form>
					</div>
					<div class="card-footer">
						기본 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title"><font>*동기*</font>방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						<form action="/exam01/insert2.do" method="post">
							<input type="text" name="memName" class="form-control" placeholder="이름을 입력해주세요."/><br/>
							<input type="text" name="memId" class="form-control" placeholder="아이디를 입력해주세요."/><br/>
							<input type="text" name="memPw" class="form-control" placeholder="비밀번호를 입력해주세요."/><br/>
							<button class="btn btn-primary">등록</button>
						</form>
					</div>
					<div class="card-footer">
						컬렉션 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title"><font>*동기*</font>방식의 일반 데이터 전송</div>
					</div>
					<div class="card-body">
						<form action="/exam01/insert3.do" method="post">
							<input type="text" name="memName" class="form-control" placeholder="이름을 입력해주세요."/><br/>
							<input type="text" name="MemId" class="form-control" placeholder="아이디를 입력해주세요."/><br/>
							<input type="text" name="MemPw" class="form-control" placeholder="비밀번호를 입력해주세요."/><br/>
							<button class="btn btn-primary">등록</button>
						</form>
					</div>
					<div class="card-footer">
						객체 타입으로 데이터를 받아봅시다!
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="card-title"><font>*동기*</font>방식의 파일 데이터 전송</div> 
					</div>
					<div class="card-body">
						<form action="/exam01/insert3.do" method="post" enctype="multipart/form-data">
							<input type="text" name="memName" class="form-control" placeholder="이름을 입력해주세요."/><br/>
							<input type="text" name="MemId" class="form-control" placeholder="아이디를 입력해주세요."/><br/>
							<input type="text" name="MemPw" class="form-control" placeholder="비밀번호를 입력해주세요."/><br/>
							<input type="file" name="MemFile" class="form-control"/><br/>
							<button class="btn btn-primary">등록</button>
						</form>
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