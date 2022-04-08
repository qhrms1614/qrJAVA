<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/album/">
<link rel="shortcut icon" href="#">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<style>

	.text-white {
		text-decoration-line : none;
	}

</style>
<body>

	<header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="/travel/main" class="nav-link px-2 text-white">메인 홈</a></li>
          <li><a href="/travel/Notice" class="nav-link px-2 text-white">게시판</a></li>
          <li><a href="/travel/tour" class="nav-link px-2 text-white">관광지</a></li>
          <li><a href="/travel/stay" class="nav-link px-2 text-white">숙박</a></li>
          <c:if test="${userid!=null}">
          	<li><a href="/travel/jjim" class="nav-link px-2 text-white">관광지 찜목록</a></li>
          <li><a href="/travel/jjim1" class="nav-link px-2 text-white">숙박 찜목록</a></li>
          </c:if>
        </ul>
        <div class="text-end">
        <c:if test="${userid==null}">
          <button type="button" class="btn btn-outline-secondary" onclick="location.href='/travel/Login';">로그인</button>
          <button type="button" class="btn btn-outline-danger" onclick="location.href='/travel/register';">회원가입</button>
		</c:if>
		<c:if test="${userid!=null}">
			<div class="btn-group">
				<button style="color:white;" type="button" class="btn btn-Secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
			    ${userid}님
				</button>
				<ul class="dropdown-menu">
				<li>
					<a class="dropdown-item" href="/travel/Mypage">마이페이지</a>
				</li>
			    <li>
			    	<a class="dropdown-item"   id=logout  href="/travel/logout">로그아웃</a>
			    </li>
			    <li>
			    	<a class="dropdown-item" style="color:red;" id=DeleteInfo  href="/travel/DeleteInfo">회원탈퇴</a>
			    </li>
				</ul>
			</div>
		</c:if>
        </div>
      </div>
    </div>
  </header>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#logout',function(){
	alert('로그아웃 되었습니다');
})
</script>
</html>