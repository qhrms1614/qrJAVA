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
<title>관광지</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/album/">

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<!-- Bootstrap core CSS -->
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nc7w5ren57"></script>
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

#btn {
   
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
   background-color: white;
   text-align: center;
   margin-left: auto;
   margin-right: auto;
   position: fixed;
   height: 300px;
   overflow: auto;
   padding: 1em;
   box-sizing: border-box;
}

#dlgType.title {
   color: blue;
}

.pageInfo {
   display: inline-block;
   position: Relative;
   margon-bottom: 10px;
   
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
/*    background-color: green; */
   color:#ff6a00;
   border-radius: 5px;
}
.pageInfo a:hover:not(.active) {
   background-color: #ddd;
}

.pageInfo a {
   border-radius: 5px;
}
.card-body {
   border-collapse: collapse;
   border: 0.5px solid gray;
}

.room_01 #article {
/*    background-image: */
/*       url(https://willerexpress.com/ko/area/cherry-blossom/img/bg-banner.jpg); */
   background-image:
      url(https://t1.daumcdn.net/cfile/tistory/9929FC4B5CECF3B214);
      
}

.Banners #article {
   position: relative;
   height: 350px;
   width: 100%;
}

.Banners #article {
   background-repeat: no-repeat;
   background-position: 50% 50%;
   background-size: cover;
}

.Banners #article:before {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   content: "";
   display: block;
   z-index: 1;
   background: #3a3a3a;
   opacity: 0.4;
   margin: :0 auto;
}

section, .section {
   position: relative;
   width: 100%;
}

.Banners #article .title {
   position: absolute;
   top: 50%;
   left: 0;
   margin-top: -21.75px;
   width: 100%;
   z-index: 10;
}

.Banners #article .title h2 strong {
   display: block;
   color: #fff;
   /*    font-family: linotype-didot, serif; */
   letter-spacing: 5px;
}

.Banners #article .title h2 {
   line-height: 1.3;
   text-align: center;
}

.details .article .title h2 strong {
   font-size: 40px;
}

.Banners #article .title h2 span {
   display: block;
   color: #fff;
}

.details .article .title h2 span {
   font-size: 14px;
}

#col8 {
   width: 100%;
}

.w-btn-neon2 {
   position: relative;
   border: none;
   min-width: 100px;
   min-height: 50px;
   background: linear-gradient(90deg, rgba(129, 230, 217, 1) 0%,
      rgba(79, 209, 197, 1) 100%);
   border-radius: 1000px;
   color: darkslategray;
   cursor: pointer;
   box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
   font-weight: 700;
   transition: 0.3s;
   
     color: #fff;
  text-shadow:
      0 0 7px #fff,
      0 0 10px #fff,
      0 0 21px #fff,
      0 0 42px #0fa,
      0 0 82px #0fa,
      0 0 92px #0fa,
      0 0 102px #0fa,
      0 0 151px #0fa;
}

.w-btn-neon2:hover {
   transform: scale(1.2);
}

.w-btn-neon2:hover::after {
   content: "";
   width: 30px;
   height: 30px;
   border-radius: 100%;
   border: 6px solid #00ffcb;
   position: absolute;
   z-index: -1;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   animation: ring 1.5s infinite;
}
select {
   width: 60px;
   padding: .8em .5em;
   border: 1px solid #999;
   font-family: inherit;
   border-radius: 30%;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   text-align:center;
   
   
}
.map_select_wrap {
   margin-top: 1.5rem;
}
#cod{
margin-top: 1.5rem; 
}
.text-oragne{
color:#ff6a00;
}
.text-bold{
font-weight:bold;
}
</style>
</head>
<body id="rooms" class="details Banners room_01">
   
   <jsp:include page="header.jsp"></jsp:include>
   
   <div id=map style='display: none;' title='관광지 지도'></div>
   <main id="m1" style="float: center">
      <section id="py5" class="text-center">
         <div id="row5" class="row">
            <div id="col8" class="col-lg-6 col-md-8 mx-auto">
               <div class="section article" id="article">
                  <div class="title">
                     <h2 class="fw-light">
                        <strong>관광지 정보</strong>
                     </h2>
                     <h2 class="lead text-muted">
                        <span>대한민국 전국 팔도를 어우르는 관광명소를 지금 확인하세요</span>
                     </h2>
                  </div>
               </div>
               <div class="map_select_wrap">
                  <select id="con">
                     <option value=kangwon
                        <c:if test="${paging.cri.st eq 'kangwon'}">selected="selected"</c:if>>
                        강원</option>
                     <option value=gyeongnam
                        <c:if test="${paging.cri.st eq 'gyeongnam'}">selected="selected"</c:if>>
                        경남</option>
                     <option value=gyeonggi
                        <c:if test="${paging.cri.st eq 'gyeonggi'}">selected="selected"</c:if>>
                        경기</option>
                     <option value=gyeongbuk
                        <c:if test="${paging.cri.st eq 'gyeongbuk'}">selected="selected"</c:if>>
                        경북</option>
                     <option value=busan
                        <c:if test="${paging.cri.st eq 'busan'}">selected="selected"</c:if>>
                        부산</option>
                     <option value=ulsan
                        <c:if test="${paging.cri.st eq 'ulsan'}">selected="selected"</c:if>>
                        울산</option>
                     <option value=incheon
                        <c:if test="${paging.cri.st eq 'incheon'}">selected="selected"</c:if>>
                        인천</option>
                     <option value=jeonnam
                        <c:if test="${paging.cri.st eq 'jeonnam'}">selected="selected"</c:if>>
                        전남</option>
                     <option value=jeonbuk
                        <c:if test="${paging.cri.st eq 'jeonbuk'}">selected="selected"</c:if>>
                        전북</option>
                     <option value=jeju
                        <c:if test="${paging.cri.st eq 'jeju'}">selected="selected"</c:if>>
                        제주</option>
                     <option value=chungnam
                        <c:if test="${paging.cri.st eq 'chungnam'}">selected="selected"</c:if>>
                        충남</option>
                  </select> 
                          &nbsp;
                  <button class="w-btn-neon2" type="button" id="btngo">검색</button>
               </div>
            </div>
         </div>
      </section>    
        <c:forEach items="${t1}" var="t1">
        <c:set var="i"  value="${i+1 }" />
  			<div id="cod" class="album py-5 bg-light"
            style="float: left; margin-left: 8%; text-align:center;">
            	<h1 style="text-align:center;">TOP${i}</h1>
            <div class="container">
              <div style="float:left;"   class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" >
                  <div class="col">
                     <div class="card shadow-sm" style="width: 420px">
                     
                        <div id="top4" >${t1.cod}</div>
                        <div class="card-body" style="width: 420px; height: 220px">       
                           <p class="card-text" style="font-size: 20px;" id="top3">${t1.hit}회</p>
                              <p id="top2">${t1.adr}</p>
                              <br><p id="top1">${t1.name}</p>
                           <div class="d-flex justify-content-between align-items-center">
                               <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="mapi1" name="${t1.adr}" 
                                    >지도</button>
                                    <input type="hidden" id="topname">
                                         <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="jjim" num="${t1.id}" name="${t1.loc}"  >찜하기</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               </div>
               </c:forEach>
      <c:forEach items="${t}" var="t">
         <div id="cod" class="album py-5 bg-light"
            style="float: left; margin-left: 22px;">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                  <div class="col">
                     <div class="card shadow-sm" style="width: 420px">
                        <input type=hidden id=adr name="${t.adr}" abc="${t.adr}">
                        <div id="tcod" name="tcod">${t.cod}</div>
                        <div class="card-body" style="width: 420px; height: 220px">
                           <p class="card-text" style="font-size: 20px;">${t.name}
                              <br>${t.adr}</p>
                           <div class="d-flex justify-content-between align-items-center">
                              <div class="btn-group">
                                 <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="jjim"
                                    name=${t.loc } num=${t.id } tn="${t.name}">찜하기</button>
                                 <input type="hidden" id="tname" value="${t.name}">
                                 <button type="button"
                                    class="btn btn-sm btn-outline-secondary" id="mapi"
                                    name="${t.adr}" abc="${t.name}">지도</button>
                              </div>
                              <small class="text-muted">${t.id}</small>
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
      <ul class="pageInfo" style="display: table; margin: auto; padding: 0;">
         <c:if test="${paging.prev }">
            <li class="pageInfo_btn_previous">
               <a id="page" href="${paging.startPage-1}">이전</a>
            </li>
         </c:if>
         <c:if test="${paging!=null }">
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="pageInfo_btn">
           <a id="page" class="pageInfo_btn ${paging.cri.pageNum==num ? 'active':'' }" href="${num }">${num }</a>
                  </li>
            </c:forEach>
         </c:if>
         <c:if test="${paging.next }">
            <li class="pageInfo_btn_next">
               <a id="page" href="${paging.endPage+1}">다음</a>
            </li>
         </c:if>
      </ul>
   </div>
   <input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
   <input type="hidden" name="amount" value="${paging.cri.amount }">
   <input type=hidden id="userid" name="userid" value=${userid }>
   <br><br>
   
   <jsp:include page="footer.jsp"></jsp:include>
   
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
   xy = []
   console.log($("#resultpage").val());
   function ap() {
      $('#map').dialog({
         width : 750,
         height : 750,
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
   $(document).ready(function() {

	   $.ajax({
           url : "/travel/topadr",
           data : {},
           method : "POST",
           datType : "json",
           success : function(txt) {
              $('#top1').text(txt[0]['name']);
              $('#top2').text(txt[0]['adr']);
              $('#top3').text(txt[0]['hit']+"회");
//               $('#top4').html(txt[0]['cod']);
              $("#topadr").val(txt[0]['adr']);

              $('#name2').text(txt[1]['name']);
              $('#adr2').text(txt[1]['adr']);
              $('#hit2').text(txt[1]['hit']+"회");
              $('#img2').html(txt[1]['cod']);

              $('#name3').text(txt[2]['name']);
              $('#adr3').text(txt[2]['adr']);
              $('#hit3').text(txt[2]['hit']+"회");
              $('#img3').html(txt[2]['cod']);
           }
        });
   })
   .on("click", "#jjim", function() {
         if($('input[name=userid]').val()=="" ){
               alert('로그인 후 이용해주십시오.');
               document.location="/travel/Login";
               return false;
         }
         console.log($(this).attr('num'));
         console.log($('#userid').val());
         let id = $(this).attr('num');
         let loc = $(this).attr('name');
         let userid=$("#userid").val();
//          let name=$('#tname').attr('name');
         $.ajax({
            url : "/travel/insertJjim",
            data : {
               userid:userid,
               id : id,
               loc : loc
            },
            method : "GET",
            datatype : "TEXT",
            error:function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            success : function(data) {
               if(data=="ok"){
            alert("찜 목록에 추가되었습니다");
               }else if(data=="fail"){
                  alert("이미 추가된 항목입니다.");
               }


            
            }
         });
      })
   
   .on("click", "#btngo", function() {
      document.location = "/travel/in/travle?st=" + $('#con').val()+"&pageNum=1";
   })
   
   .on('click','#page',function() {
      $('input[name=pageNum]').val($(this).attr("href"));
         document.location = "/travel/in/travle?st=" + $('#con').val() + "&pageNum=" + $('input[name=pageNum]').val();
            return false;
   })
      
   .on('click', '#mapi', function() {
      let name = $(this).attr('abc');
      console.log(name);
      $.ajax({
         url : "/travel/hit",
         data : {
            name : name
         },
         datatype : "json",
         method : "GET",
         beforeSend : function() {

         },
         success : function() {

         }
      });
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
   .on('click', '#mapi1', function() {
	  console.log($(this).attr("name"));
      let name = $(this).attr("name");
      $.ajax({
         url : "/travel/hit",
         data : {
            name : name
         },
         datatype : "json",
         method : "GET",
         beforeSend : function() {

         },
         success : function() {

         }
      });
      let adr = $(this).attr("name");
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