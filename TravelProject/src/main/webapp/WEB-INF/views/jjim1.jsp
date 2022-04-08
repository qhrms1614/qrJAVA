<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
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
<title>${userid }의 숙박 찜목록</title>

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
#page{
 text-decoration:none !important;
}
li {
   float: left;
   list-style: none;
}
.pageInfo_wrap {
   width: 500px;
   float: middle;
   margin: 0 auto;
   text-align: center;
}
.footer{
  position : relative;
  transform : translateY(-100%);
}
#m1{
  height : 100%;
}
</style>


</head>
<body>

   <jsp:include page="header.jsp"></jsp:include>
   <br>
   <br>
<div id=map style='display: none;' title='관광지 지도'></div>
   <main style="float:center" id="m1">

      <section class="py-5 text-center container">
         <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
               <h1 class="fw-light">${userid } 님의 숙박 찜목록</h1>
               <p class="lead text-muted">내가 찜한 여행지 목록을 볼 수 있습니다.</p>
            </div>
         </div>
      </section>
      <c:forEach items="${t}" var="t">
         <div id="cod" class="album py-5 bg-light" style="float:left;margin-left: 25px;">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                  <div class="col">
                     <div class="card shadow-sm" style="width:420px">
                        <div id="tcod" name="tcod">${t.cod}</div>
                        <div class="card-body" style="width:420px; height:220px">
                           <p class="card-text" style="font-size: 20px;">${t.name}
                           <br>${t.adr}</p>
                           <div class="d-flex justify-content-between align-items-center">
                              <div class="btn-group">

                                 <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="jjimdel" name=${t.loc} num=${t.id}>찜취소</button>
                                     <button type="button"   class="btn btn-sm btn-outline-secondary" id="mapi" name="${t.adr}">지도</button>
                              </div>
                              <small class="text-muted">info</small>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </c:forEach>
   </main>
   <div class="pageInfo_wrap">
      <div class="pageInfo_area">
         <ul class="pageInfo">
            <c:if test="${paging.prev }">
               <li class="pageInfo_btn_previous"><a id="page" href="${paging.startPage-1}">이전</a></li>
            </c:if>
            <c:if test="${paging!=null }">
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="pageInfo_btn"><a id="page" href="${num }">${num }</a></li>
            </c:forEach>
            </c:if>
            <c:if test="${paging.next }">
               <li class="pageInfo_btn_next"><a id="page" href="${paging.endPage+1}">다음</a></li>
            </c:if>
         </ul>
      </div>
   </div>   
   <input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   <input type="hidden" name="amount" value="${paging.cri.amount }">
    <input type=hidden  id="userid"  name="userid"  value=${userid }>

<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nc7w5ren57&submodules=geocoder"></script>
<script src='${pageContext.request.contextPath}/resources/js/jjim1.js'></script>
</html>
