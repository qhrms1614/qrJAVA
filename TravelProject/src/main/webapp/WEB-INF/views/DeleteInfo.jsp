<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="Mypage-main" align=center style="height:500px">
		<h2 align=center style="padding-top:50px;">HUMAN TRAVEL 회원탈퇴</h2><br>
   <h4 align=center>HUMAN TRAVEL Withdrawal</h4><br><br>
		<table id="Member">
			
			<tr>
				<td>
				<br>
				<br>
				<br>
					
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
						<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="userid" name="userid" value="${userid}" readonly>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
						<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
							   id="password" name="password"  >
						
					</div>
					<button id=btnGo class="btn btn-outline-danger">회원탈퇴</button>
			
				
				<br>
					
				</td>
			</tr>
		</table>
	</div>
				<div align=center style="padding:50px; height:400px; ">
					<h3 style="align:center;">▶유의 사항</h3>
<!-- 					<textarea style="height:300px; width:500px; text-align:left" readonly> -->
					<span>-회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며,회원탈퇴 진행시 해당 아이디는 영구적으로 삭제되어 재가입이 불가합니다.</span><br>
					<span>-개인정보 처리방침 제5초(개인정보의 보유 및 이용기간에)에 따른 특별한 경우,한시적으로 개인정보를 보존합니다.</span>					
<!-- 					</textarea> -->
				</div>
	
				
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>

$(document)
.on('click','#btnGo',function(){
if($('#password').val()==''){
	alert('비밀번호를 입력해주세요');
	return false;
}
if(!confirm("회원탈퇴를 하시겠습니까?")){
	return false;
}else{
	$.ajax({
	    url :"/travel/DeleteInfo1",
	    data : {
	       userid : $('#userid').val(),       
	       password : $('#password').val()
	    },
	    method : "GET",
	    datatype : "text",
	    success : function(txt) {
	    	console.log(txt);
			if(txt=="ok"){
				alert("회원탈퇴 완료");
				sessionStorage.clear();
				document.location="/travel/main";	
			}else{
				alert("정보가 일치하지않습니다.");
			}
	       
	    }

	 });
}


})
</script>
</html>