<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
   	<br>
   	<br>

	<h2 align=center>HUMAN TRAVEL 회원가입</h2><br>
	<h4 align=center>HUMAN TRAVEL REGISTRATION</h4><br><br>
	<div class="Register-main" align=center>
	<form method="POST" action="/travel/Signon_check" id=frmsign>
		<div style="height:670px;">
			<table style="text-align:center;" id=tableout>
				<tr>
					<td>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
							<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							  	   id="userid" name="userid" placeholder="영문으로 입력">
							<button class="btn btn-outline-secondary" type=button id="check_id" name="check_id">중복 확인</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
							<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							  	   id="password" name="password" placeholder="영문과 숫자, 특수문자 섞어서 입력">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
								<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
								  	   id="password1" name="password1" placeholder="위와 동일하게 입력">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">고객명</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
								  	   id="username" name="username" placeholder="자신의 성명 입력">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
								<input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
								  	   id="birthday" name="birthday">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
								  	   id="phone" name="phone" placeholder="- 없이 입력">
						</div>
					</td>
				</tr>

				<tr>
					<td colspan=2>
				</tr>
				<tr>
					<td style="align:center;">
						<input type=submit id=btnSubmit class="btn btn-outline-secondary" value="회원가입">
						<input type=button id=btnCancle class="btn btn-outline-secondary" value="취소">
					</td>
				</tr>
			</table>
		</div>
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/register.js'></script>
</html>