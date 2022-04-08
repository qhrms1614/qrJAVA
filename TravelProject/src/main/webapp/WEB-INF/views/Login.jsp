<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>

.link-primary {
	text-decoration-line : none;
}

</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>
   <br>
   <br>

	<h1 align=center>HUMAN TRAVEL 로그인</h1><br>
		<p align=center>HUMAN TRAVEL LOGIN</p>
	<br>
	<div class="Login-main" align=center style="height:670px;">
		<table id="Login">
			<tr>
				<td>
					<form method="POST" action="/travel/login_check" id=frmlogin onsubmit="check()">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
									   id="userid" name="userid" placeholder="ID">
							</div>
							
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
								<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
									   id="password" name="password" id="password" placeholder="PASSWORD">
							</div>
							<br>
							<div id="div_Ltext" align=center>
								<button type="submit" id="btnSubmit" class="btn btn-outline-secondary">로그인</button>
							</div>
							<br>
							<div id="div_sign" align=center>
							<a href="/travel/register" class="link-primary">회원가입</a>&nbsp;&nbsp;
							<a href="/travel/find" class="link-primary">아이디/비밀번호 찾기</a>
							</div>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/Login.js'></script>
</html>