<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 관리</title>
</head>
<style>

.input-group mb-3{
	border:1px solid #9d9d9d !important;
}

</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<h2 align=center>HUMAN TRAVEL 아이디/비밀번호 찾기</h2>
	<h4 align=center>HUMAN TRAVEL FIND ID AND PASSWORD</h4>
	<div class="rounded-3 py-5 px-4 px-md-5 mb-5 ">
		<div class="text-center mb-5">
			<table align=center id=outline name=outline>
				<tr>
					<td>
						<table id=idtable style="margin-right:100px;">
							<tr>
								<td>
									<div class="alert alert-dark" role="alert">
										아이디 찾기
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
										  	   id="name1" placeholder="자신의 성명 입력">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
										  	   id="mobile1" placeholder="- 없이 입력">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<button class="btn btn-outline-secondary" type=button id="btnfind_id">아이디 찾기</button>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table id=pwtable>
							<tr>
								<td>
									<div class="alert alert-dark" role="alert">
										비밀번호 찾기
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
										  	   id="name2" placeholder="자신의 성명 입력">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
										  	   id="userid" placeholder="영문으로 입력">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
										<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
										  	   id="mobile2" placeholder="- 없이 입력">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<button class="btn btn-outline-secondary" type=button id="btnfind_pw">비밀번호 찾기</button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 	</form> -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/find.js'></script>
</html>