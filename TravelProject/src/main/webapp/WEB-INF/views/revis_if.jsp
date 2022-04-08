<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 탈퇴</title>
</head>
<body link="blue" vlink="darkgreen">

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	
<h2 align=center>HUMAN TRAVEL 회원정보 수정 탈퇴</h2><br>
	<h4 align=center>HUMAN TRAVEL REVSIED PERSONAL INFO AND DELETE ACCOUNT</h4><br><br>	
	<table id=detail align=center>	
	<tr>
		<td>아이디</td>
		<td><input type=text name=userid id=userid value="${userid}" readonly></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type=text name=passcode id=passcode placeholder="PASSWORD"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type=password name=passcode_ck id=passcode_ck placeholder="PASSWORD CHECK"></td>
	</tr>
	<tr>
		<td>고객명</td>
		<td><input type=text name=username id=username placeholder="NAME"></td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td><input type=text name=mobile id=mobile placeholder="- 없이 입력"></td>
	</tr>
	
	<tr>
		<td><input type=button id=btnCancle value="취소">	</td>
		<td><input type=button id=btnRevised value="수정 완료"></td>
		<td><input type=button id=btnDelete value="회원 탈퇴"></td>
	</tr>	
	</table>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/revise_if.js'></script>
</html>