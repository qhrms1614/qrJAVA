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
<link href="${pageContext.request.contextPath}/resources/css/NoticeList.css" rel="stylesheet" >
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

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
/* 	background-color: green; */
	color:#ff6a00;
	border-radius: 5px;
}

.pageInfo a:hover:not(.active) {
	background-color: #ddd;
}

.pageInfo a {
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
.th_first {
	border-collapse: collapse;
	border: 1px solid gray;
}

.th_second {
	border: 1px solid gray;
}

.th_third {
	border: 1px solid gray;
}

.td_first {
	border: 1px solid gray;
}

.td_second {
	border: 1px solid gray;
}

.td_third {
	border: 1px solid gray;
}

.Search_A {
	width:400px;
	height: 47px; 
}

</style>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="N_Body" align=center>
		<h2>자유게시판</h2><br>
		<div id="div_table">
			<table id="tbl_List">
				<thead>
					<c:if test="${userid!=null }">
						<tr>
							<th id="N_Write" colspan=3>
								<input type=button value="글쓰기" id="Write" class=" write btn btn-outline-secondary">
							</th>
						</tr>
					</c:if>
					<c:if test="${userid eq null }">
						<tr>
							<th id="N_info" colspan=3>
								※회원전용 게시판입니다.<br>
								 로그인 후 이용해주시기 바랍니다.
							</th>
						</tr>
					</c:if>
					<tr>
						<th class="th_first">제목</th>
						<th class="th_second">작성자</th>
						<th class="th_third">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice }">
						<tr>
						<td class="td_first" id="${notice.bno }">${notice.title }
						</td>
						<td class="td_second">${notice.writer }</td>
						<td class="td_third">${notice.created }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="search_wrap">
	        <div class="search_area">
	        	<select name="type">
	                <option value="" <c:out value="${paging.ncri.type == null?'selected':'' }"/>>--</option>
	                <option value="T" <c:out value="${paging.ncri.type eq 'T'?'selected':'' }"/>>제목</option>
	                <option value="C" <c:out value="${paging.ncri.type eq 'C'?'selected':'' }"/>>내용</option>
	                <option value="W" <c:out value="${paging.ncri.type eq 'W'?'selected':'' }"/>>작성자</option>
	            </select> 
	            <input type="text" class="Search_A" name="n_keyword" value="${paging.ncri.keyword }">
	            <button id=btn_serach type="button" class=" search btn btn-outline-secondary">검색</button>
	        </div>
	    </div>
	    <br>
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul class="pageInfo">
					<c:if test="${paging.prev }">
						<li class="pageInfo_btn_previous"><a id="page" href="${paging.startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
						<li class="pageInfo_btn"><a id="page" class="pageInfo_btn ${paging.ncri.pageNum==num ? 'active':'' }" href="${num }">${num }</a></li>
					</c:forEach>
					<c:if test="${paging.next }">
						<li class="pageInfo_btn_next"><a id="page" href="${paging.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<input type="hidden" name="pageNum" value="${paging.ncri.pageNum }">
		<input type="hidden" name="amount" value="${paging.ncri.amount }">
		<input type="hidden" name="keyword" value="${paging.ncri.keyword }">
		<input type="hidden" name="type" value="${paging.ncri.type }">
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/NoticeList.js'></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</html>