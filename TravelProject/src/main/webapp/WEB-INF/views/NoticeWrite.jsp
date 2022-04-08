<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nc7w5ren57&submodules=geocoder"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>게시판</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/album/">
<link href="${pageContext.request.contextPath}/resources/css/NoticeWrite.css" rel="stylesheet" >
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

li {
	float: left;
	list-style: none;
}

#map {
	border-collapse: collapse;
	border: 1px solid black;
	background-color: gray;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

#dlgType.title {
	color: blue;
}

.pageInfo {
	display: inline-block;
}

.pageInfo li {
	display: inline;
	text-align: center;
}

.pageInfo a {
	display: block;
	font-size: 22px;
	text-decoration: none;
	padding: 5px 15px;
	color: #96a0ad;
	line-height: 1.5;
}

.pageInfo a.active {
	background-color: green;
	color: white;
}

.pageInfo a:hover:not(.active) {
	background-color: #ddd;
}

.pageInfo a {
	border-radius: 5px;
}

.pageInfo a.active {
	border-radius: 5px;
}

#resultpage {
	display: block;
	text-align: center;
	margin: 0 auto;
	font-size: 22px;
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	

	<jsp:include page="header.jsp"></jsp:include>

	<form action="/travel/n_Write" method=post id="sbm_write">
		<div id="N_Body">
			<div id=Noticewrite>
				<div id=div_title>
					<input type=hidden name="post_code" value="${post.bno }">
					제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text name="title" id=title size=65 placeholder="제목을 입력해주십시오." value="${post.title }"><br>
				</div>
				<input type=hidden name="writer" id=writer size=20 value="${userid }" readonly>
				<div id=div_content>
					내용<br>
					<textarea name="content" id=content placeholder="내용은 2000자 이하로 작성해주십시오."
						rows=20 cols=83 style="resize: none;">${content }</textarea>
				</div>
				<div id="btn_group">
					<div id=div_button>
						<input type=button value="LIST" id="golist" class=" golist btn btn-outline-secondary">
					</div>
					<div id=div_submit>
						<input type=submit value="작성" id="complete" class=" write btn btn-outline-secondary">
					</div>
				</div>
			</div>
			<input type="hidden" name="pageNum" value="${page.pageNum }">
			<input type="hidden" name="keyword" value="${page.keyword }"> 			
			<input type="hidden" name="type" value="${page.type }">
		</div>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src='${pageContext.request.contextPath}/resources/js/NoticeWrite.js'></script>
</html>