<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>마이 페이지</title>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

img {
	width: 420px;
	height: 250px;
	object-fit: cover;
}

</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>


	<div class="Mypage-main" align=center>
		<table id="Member">
			<tr>
				<td>
				<br>
				<br>
				<br>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="username" value="${t.username}" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="userid" name="userid" value="${userid}" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
						<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="password" name="password" value="${t.password}" readonly>
						<button class="btn btn-outline-secondary" type=button id="ChangePW">비밀번호 변경</button>
					</div>
					<div style="display: none" id="ChangePW1">
					<br>
						<table>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">현재 비밀번호:</span>
										<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
									   id="Oldpassword" name="Oldpassword">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">변경될 비밀번호:</span>
										<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
									   id="Newpassword" name="Newpassword">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">변경될 비밀번호:</span>
										<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
									   id="Newpassword1" name="Newpassword1">
									</div>
								</td>
							</tr>
							<tr>
								<td align=center>
<!-- 								<button type=button id="ChangeGo" onclick="javascript:ChangePW();">변경하기</button> -->
									<button class="btn btn-outline-secondary" type=button id="ChangeGo" >변경하기</button>
								</td>
						</table>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="birthday" value="${t.birthday}" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="phone" value="${t.phone}" readonly>
						<button class="btn btn-outline-secondary" type=button id="ChangePH">전화번호 변경</button>
					</div>
				<br>
					<div style="display: none" id="ChangePH1">
						<table>
							<tr>
								<td>현재 전화번호:&nbsp;<input type="text" id="Oldphone"
									name="Oldphone"></td>
							</tr>
							<tr>
								<td>변경할 전화번호:&nbsp;<input type="text" id="Newphone"
									name="Newphone"></td>
							</tr>
							<tr>
								<td>변경할 전화번호 확인:&nbsp;<input type="text" id="Newphone1"
									name="Newphone1"></td>
							</tr>
							<tr>
								<td><button type=button id="ChangeGop"
										onclick="javascript:ChangePH();">변경하기</button>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%-- <script src='${pageContext.request.contextPath}/resources/js/Mypage.js'></script> --%>
<script>

	$(document)

	.on('click', '#ChangePW', function() {
		$('#ChangePW1').dialog({
			title : '비밀번호 변경',
			modal : true,
			width : 500,
			open : function() {
			},
			close : function() {
			}
		})
	})
	
	.on('click', '#ChangePH', function() {
		$('#ChangePH1').dialog({
			title : '전화번호 변경',
			modal : true,
			width : 500,
			open : function() {
			},
			close : function() {
			}
		})
	})

	// 비밀번호 변경 유효성 검사
	.on('click','#ChangeGo',function() {
		let re='ok';		
		if ($('input[name=Oldpassword]').val() == "") {
			alert('현재 비밀번호를 입력해주세요'); 
			re='fail';
			
		}else if ($('input[name=Newpassword]').val() != $('input[name=Newpassword1]').val()) {
			alert('비밀번호가 서로 일치해야 합니다');
			re='fail';
			
		}else if ($('input[name=Newpassword]').val() == '') {
			alert('변경할 비밀번호를 입력해주세요');
			re='fail';
			
		}else if ($('input[name=Oldpassword]').val() == $('input[name=Newpassword]').val()) {
			alert('이전 비밀번호와 다르게 입력해주세요');
			re='fail';
			
		};
		console.log(re);
		if(re=='ok') {
			console.log("10");
			a();
		}
		return false;
	})

	// 전화번호 변경 유효성 검사
	.on('click', '#ChangeGop', function() {
		$.ajax({
			url : '/travel/ChangePH',
			data : {},
			dataType : 'json',
			method : 'post',
			success : function(txt) {
				for (let i = 0; i < txt.length; i++) {
					if ($('#userid').val() == txt[i]['id'] &&
						$('#Oldphone').val() == txt[i]['ph']) {
						flag = "true";
						break;
					} else {
						flag = "false";
					}
				}
			},
			complete : function() {
				if (flag == "true") {
					$.ajax({
						url : '/travel/ChangePH1',
						data : {
							id : $('#userid').val(),
							ph : $('#Oldphone').val(),
							ph1 : $('#Newphone').val()
						},
						dataType : 'text',
						method : 'post',
						success : function(txt) {
							if (txt == "ok!") {
								alert('전화번호 변경완료');
								document.location = '/travel/Mypage';
							} else {
							}
						}
					})
				} else {
					alert("현재 전화번호와 일치하지 않습니다");
					return false;
				}
			}
		})
	})

	function ChangePW() {
		if ($('input[name=Oldpassword]').val() == '') {
			alert('현재 비밀번호를 입력해주세요');
			return false;
		};
		if ($('input[name=Newpassword]').val() != $('input[name=Newpassword1]').val()) {
			alert('비밀번호가 서로 일치해야 합니다');
			return false;
		};
		if ($('input[name=Newpassword]').val() == '') {
			alert('현재 비밀번호를 입력해주세요');
			return false;
		};
		if ($('input[name=Oldpassword]').val() == $('input[name=Newpassword]').val()) {
			alert('이전 비밀번호와 다르게 입력해주세요');
			return false;
		};
	};

	function ChangePH() {
		if ($('input[name=Oldphone]').val() == '') {
			alert('현재 전화번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Newphone]').val() != $('input[name=Newphone1]').val()) {
			alert('전화번호가 서로 일치해야 합니다');
			return false;
		}
		if ($('input[name=Newphone]').val() == '') {
			alert('현재 전화번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Oldphone]').val() == $('input[name=Newphone]').val()) {
			alert('이전 전화번호와 다르게 입력해주세요');
			return false;
		}
	};
	function a(){
		$.ajax({
			url : '/travel/ChangePW',
			data : {},
			dataType : 'json',
			method : 'post',
			success : function(txt) {
				
				for(let i = 0; i < txt.length; i++) {
					if ($('#userid').val() == txt[i]['id'] && $('#Oldpassword').val() == txt[i]['pw']) {
						flag = "true";
						break;
					} else {
						flag = "false";
					}
				}
			},
			complete : function() {
				if(flag == "true") {
					$.ajax({
						url : '/travel/ChangePW1',
						data : {
							id : $('#userid').val(),
							pw : $('#Oldpassword').val(),
							pw1 : $('#Newpassword').val()},
						dataType : 'text',
						method : 'post',
						success : function(txt) {
							if (txt == "ok!") {
								alert('비밀번호 변경완료');
								document.location = '/travel/Mypage';
							} else {
								return false;
							}
						}
					})
				} else if(flag == "false") {
					alert("현재 비밀번호와 일치하지 않습니다");
					return false;
				}
			}
		})
	}

</script>
</html>
