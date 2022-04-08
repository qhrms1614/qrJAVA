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
<title>${userid }의 관광지 찜목록</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/album/">



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
               <h1 class="fw-light">${userid } 님의 관광지 찜목록</h1>
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
                                       <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="mapi"
                                    name="${t.adr}">지도</button>
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
<!--    <footer class="text-muted py-5"> -->
<!--       <div class="container"> -->
<!--          <p class="float-end mb-1"> -->
<!--             <a href="#">Back to top</a> -->
<!--          </p> -->
<!--          <p class="mb-1">Album example is &copy; Bootstrap, but please -->
<!--             download and customize it for yourself!</p> -->
<!--          <p class="mb-0"> -->
<!--             New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a -->
<!--                href="../getting-started/introduction/">getting started guide</a>. -->
<!--          </p> -->
<!--       </div> -->
<!--    </footer> -->
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
 <script>
 xy = []
   console.log($("#resultpage").val());
   function ap() {
      $('#map').dialog({
         width : 1000,
         height : 1000,
         modal : true,
         position : {
            my : "top",
            at : "top",
            of : window
         },
         open : function() {
            alert("검색을 시작합니다");
            var map = new naver.maps.Map('map', {
               position : new naver.maps.LatLng(xy[0]["y"], xy[0]["x"]),
               center : new naver.maps.LatLng(xy[0]["y"], xy[0]["x"]),
               zoom : 17
            })
            var marker = new naver.maps.Marker({
               map : map,
               position : new naver.maps.LatLng(xy[0]["y"], xy[0]["x"]),
            });
         },
         close : function() {
            $('#map').empty;
            xy = [];
         }
      });
   }
   function ar(adr) {
      pin = [];
      naver.maps.Service.geocode({
         query : adr
      }, function(status, response) {
         if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
         }
         let marker;
         var result = response.v2, // 검색 결과의 컨테이너
         items = result.addresses; // 검색 결과의 배열
         // 리턴 받은 좌표 값을 변수에 저장
         //            console.log('item x:'+items[0].x);
         //            console.log('item y:'+items[0].y);
         let xx = parseFloat(items[0].x);
         let yy = parseFloat(items[0].y);
         aa = {
            x : xx,
            y : yy
         };
         xy.push(aa);
      });
   }
 $(document)
 .ready(function(){
    console.log($('#userid').val());
    if($('input[name=userid]').val()=="" ){
         alert('로그인 후 이용해주십시오.');
         document.location="/travel/Login";
         return false;
   }
 })
   .on("click","#jjimdel",function(){
      
      console.log($(this).attr('num'));
      console.log($(this).attr('name'));
      let id=$(this).attr('num');
      let loc=$(this).attr('name');
      let userid=$('#userid').val();
       $.ajax({
             url:"/travel/deleteJjim",
             data:{
                userid:userid,
                id:id,
                  loc:loc},
             method:"GET",
             datatype:"json",
             success:function(data){
                alert('찜 목록이 삭제되었습니다.');
                document.location="/travel/jjim";
             }
          });
   })
   .on('click','#page',function(){
   $('input[name=pageNum]').val($(this).attr("href"));
         document.location = "/travel/in/travle?st=" + $('#con').val()+"&page="+$('input[name=pageNum]').val();
   return false;
}).on('click', '#mapi', function() {
   let adr = $(this).attr('name');
   console.log(adr);
   if (adr != "") {
      ar(adr);
   } else {
      alert("주소가 없습니다");
      return false;
   }
   setTimeout(ap, 200);

})
   </script>
</html>