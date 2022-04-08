<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="theme-color" content="#7952b3">
<title>휴먼 투어</title>

<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nc7w5ren57&submodules=geocoder,panorama"></script>

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

.mapdiv {
   width: 300px;
   height: 300px;
   text-align: center;
   padding: 0px;
}

#imgtop {
  width: 100%;
   height: 100%;
   image-repeat: no-repeat;
}

.mapselect {
   text-align: right;
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
.mapout {
   height: 700px;
   margin:0;
   text-align:center;
}

#map {
   width: 70%;
   height: 500px;
   margin: 0 auto;
   align: right;
}

.locselect {
   margin: 0 auto;
}

img {
   width: 100%;
   height: 80%;
   object-fit: cover;
}

.Topheader1 {
   margin: 0;
   text-align: center;
   padding-top: 22px;
   padding-bottom: 100px;
   height: 600px;
   background-color: white;
   width: 100%;
    background-image:
      url(https://i.pinimg.com/originals/9e/74/7d/9e747dd76f1be3d062748e6b3d030f6b.jpg);
   
}
#myCarousel {
   height: 900px;
}

#inner {
   height: 100%;
}

#item1 {
   height: 100%;
}

.visual_item {
   height: 100%;
}

.visual_bg {
   height: 100%;
}

strong {
   background-color: rgba(0, 0, 0, 0.2);
   /*       background-color:white;  */
   font-size: 35px;
   color: white;
}

#infomation {
   width: 50%;
}

#icon {
   background-color: rgba(0, 0, 0, 1);
}

#strong1 {
   text-align: left;
}

#strong2 {
   text-align: left;
}

.Logo1 {
   display: inline-block;
   position: relative;
   height: 50%;
   width: 9.090909090909091%;
   padding: 1px;
   font-family: 'Sunflower', sans-serif;
   font-size: 18px;
   font-weight: bolder;
}

.img-fluid1 {
   height: 150px;
   width: 150px;
   border-collapse: collapse;
   border: solid white;
   border-radius: 50%;
}

.col-md-5 {
   padding-top: 60px;
   margin: 0 auto;
}

.col-md-7 {
   padding-top: 50px;
   text-align: center;
   margin: 0 auto;
}
select {
   width: 70px;
   padding: .8em .5em;
   border: 1px solid #999;
   font-family: inherit;
   border-radius: 30%;
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   text-align:center;
   
   
}
</style>
</head>
<body>
   <jsp:include page="header.jsp"></jsp:include>
   <main class="mainback">
      <div></div>

      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
         <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel"
               data-bs-slide-to="0" class="active" aria-current="true"
               aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel"
               data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel"
               data-bs-slide-to="2" aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner" id=inner>
            <div class="carousel-item active visual_item">
               <div class="visual_bg">
                  <img id=imgtop
                     src="https://post-phinf.pstatic.net/MjAyMTA2MjRfMTI1/MDAxNjI0NTE2OTIwNjM1.BaIwFfB0qHUYED_zmWAJa053jgO_WBF5XRCXzUK-jFUg.O6F9kpHvAQKB3Jp5UN-6IjjnMkLKEuS3m8wBYpvMw1kg.JPEG/2504225.jpg?type=w1200">
               </div>
               <svg class="bd-placeholder-img" width="50%" height="50%"
                  xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                  preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#777" /></svg>
               <div class="container1">
                  <div id=cap class="carousel-caption text-start">
                     <h1>
                        <strong id="strong1">여행지를 찾아보세요</strong>
                     </h1>
                     <p>
                        <a class="btn btn-lg btn-primary" href="/travel/tour">Tour</a>
                     </p>
                  </div>
               </div>
            </div>
            <div class="carousel-item visual_item">
               <div id=class="visual_bg">
                  <img id=imgtop
                     src="http://tong.visitkorea.or.kr/cms2/website/52/2588552.jpg">
               </div>
               <svg class="bd-placeholder-img" width="50%" height="50%"
                  xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                  preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#777" /></svg>
               <div class="container1">
                  <div id=cap class="carousel-caption">
                     <h1>
                        <strong id="strong2">지친날 쉴 수 있는 곳</strong>
                     </h1>
                     <p>
                        <a class="btn btn-lg btn-primary" href="/travel/stay">Stay</a>
                     </p>
                  </div>
               </div>
            </div>
            <div class="carousel-item visual_item">
               <div id=class="visual_bg">
                  <img id=imgtop
                     src="http://tong.visitkorea.or.kr/cms2/website/77/2563877.jpg">
               </div>
               <svg class="bd-placeholder-img" width="50%" height="50%"
                  xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
                  preserveAspectRatio="xMidYMid slice" focusable="false">
                  <rect width="100%" height="100%" fill="#777" /></svg>
               <div class="container1">
                  <div id=cap class="carousel-caption text-end">
                     <h1>
                        <strong id=>자신이 고른 여행지를 확인하세요</strong>
                     </h1>
                     <p>
                        <a class="btn btn-lg btn-primary" href="/travel/jjim">Favorite1</a>&nbsp;<a
                           class="btn btn-lg btn-primary" href="/travel/jjim1">Favorite2</a>
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <button class="carousel-control-prev" type="button"
         data-bs-target="#myCarousel" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true" id=icon></span>
         <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#myCarousel" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true" id=icon></span>
         <span class="visually-hidden">Next</span>
      </button>
      </div>
   

      <div class="Topheader1">
         <h1>전국 11개의 도시명소를</h1>
         <h2>확인하세요</h2>
         <div id="lg" class="Logo1">
            <!-- 강원도 -->
            <img src="https://t1.daumcdn.net/cfile/tistory/9929FC4B5CECF3B214"
               class="img-fluid1" alt="..."> <b>강원도</b><br>
            <button onclick="location.href='/travel/in/travle?st=kangwon&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=kangwon&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 경기도 -->
            <img src="https://img.hankyung.com/photo/202011/AA.24246710.1.jpg"
               class="img-fluid1" alt="..."> <b>경기도</b><br>
            <button onclick="location.href='/travel/in/travle?st=gyeonggi&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=gyeonggi&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 경남 -->
            <img src="https://t1.daumcdn.net/cfile/blog/11066A164C2178384D"
               class="img-fluid1" alt="..."> <b>경상남도</b><br>
            <button onclick="location.href='/travel/in/travle?st=gyeongnam&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=gyeongnam&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 경북 -->
            <img
               src="https://news.imaeil.com/photos/2019/11/25/2019112514145653533_l.jpg"
               class="img-fluid1" alt="..."> <b>경상북도</b><br>
            <button onclick="location.href='/travel/in/travle?st=gyeongbuk&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=gyeongbuk&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 부산 -->
            <img
               src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191229160530047_oen"
               class="img-fluid1" alt="..."> <b>부산</b><br>
            <button onclick="location.href='/travel/in/travle?st=busan&pageNum=1'">관광</button>
             <button onclick="location.href='/travel/in1/stay?st=busan&pageNum=1'">숙박</button>
         </div>
         <br> <br>
         <div id="lg" class="Logo1">
            <!-- 울산 -->
            <img
               src="https://blog.kakaocdn.net/dn/BrmbU/btrhesHIrGs/4gYIpQUkE0CnaP4ztyTOX0/img.jpg"
               class="img-fluid1" alt="..."> <b>울산</b><br>
            <button onclick="location.href='/travel/in/travle?st=ulsan&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=ulsan&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 인천 -->
            <img
               src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/f5/bf/c4/caption.jpg?w=600&h=300&s=1"
               class="img-fluid1" alt="..."> <b>인천</b><br>
            <button onclick="location.href='/travel/in/travle?st=incheon&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=incheon&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 전남 -->
            <img
               src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1c2EcKlXK4nyUHT_qR4QPF7khdgbxM8qSSw&usqp=CAU"
               class="img-fluid1" alt="..."> <b>전라남도</b><br>
            <button onclick="location.href='/travel/in/travle?st=jeonnam&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=jeonnam&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 전북 -->
            <img
               src="https://media-cdn.tripadvisor.com/media/photo-s/12/a0/65/30/dsc00591-2-largejpg.jpg"
               class="img-fluid1" alt="..."> <b>전라북도</b><br>
            <button onclick="location.href='/travel/in/travle?st=jeonbuk&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=jeonbuk&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 제주도 -->
            <img
               src="https://mblogthumb-phinf.pstatic.net/20141007_45/mookorea_1412671586034aI80a_JPEG/IMG_7104.JPG?type=w2"
               class="img-fluid1" alt="..."> <b>제주도</b><br>
            <button onclick="location.href='/travel/in/travle?st=jeju&pageNum=1'">관광</button>
             <button onclick="location.href='/travel/in1/stay?st=jeju&pageNum=1'">숙박</button>
         </div>
         <div id="lg" class="Logo1">
            <!-- 충남 -->
            <img
               src="http://www.jbnews.com/news/photo/202009/1307197_1102765_179.jpg"
               class="img-fluid1" alt="..."> <b>충청남도</b><br>
            <button onclick="location.href='/travel/in/travle?st=chungnam&pageNum=1'">관광</button>
            <button onclick="location.href='/travel/in1/stay?st=chungnam&pageNum=1'">숙박</button>
         </div>
      </div>
      <div class="mapout">
         <h2>전국 지도</h2>
         <div class="divsel">
            <select class='locselect' id=sel name=sel></select> 
               <button class="w-btn-neon2" type="button" id="btn">검색</button>
                  <br><br>
         </div>
         <div id="map"></div>
      </div>


   </main>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
   let pin = [];
   let markers = [];
   let xy = [];
   let infoWindow;
   let con = [];
   let infoWindows = [];
   let img = [];
   let adress;
   let loct;
   let marker;
   let cen;
   $(document).ready(
		   
         function() {
        	 $.ajax({
                 url : "/travel/pointcity",
                 data : {
                    loc : "kangwon"
                 },
                 method : "GET",
                 datatype : "json",
                 success : function(txt) {

                    for (i = 0; i < txt.length; i++) {
                       let adr = txt[i]['adr'];
                       let n = txt[i]['name'];
                       let im = txt[i]['cod'];
                       img.push(im);
                       con.push(n);
                       ar(adr);
                    }
                 }

              });
        	 
        	 
        	 
            $.ajax({
               url : "/travel/getcity",
               data : {},
               method : "GET",
               datType : "json",
               success : function(txt) {

                  for (i = 0; i < txt.length; i++) {
                     let str = "<option value="+txt[i]['name']+">"
                           + txt[i]['kloc'] + "</option>";
                     console.log(str);
                     $('#sel').append(str);
                  }

               }
            });
            $.ajax({
               url : "/travel/topadr",
               data : {},
               method : "POST",
               datType : "json",
               success : function(txt) {
                  $('#name1').text(txt[0]['name']);
                  $('#adr1').text(txt[0]['adr']);
                  $('#hit1').text(txt[0]['hit']);
                  $('#img1').html(txt[0]['cod']);

                  $('#name2').text(txt[1]['name']);
                  $('#adr2').text(txt[1]['adr']);
                  $('#hit2').text(txt[1]['hit']);
                  $('#img2').html(txt[1]['cod']);

                  $('#name3').text(txt[2]['name']);
                  $('#adr3').text(txt[2]['adr']);
                  $('#hit3').text(txt[2]['hit']);
                  $('#img3').html(txt[2]['cod']);
               }

            });

         })

   .on('change', '#sel', function() {
      xy = [];

      $.ajax({
         url : "/travel/pointcity",
         data : {
            loc : $("option:selected", this).val()
         },
         method : "GET",
         datatype : "json",
         success : function(txt) {

            for (i = 0; i < txt.length; i++) {
               let adr = txt[i]['adr'];
               let n = txt[i]['name'];
               let im = txt[i]['cod'];
               img.push(im);
               con.push(n);
               ar(adr);
            }
         }

      });
   }).on('click', '#btn', function() {
      resetmarker();
      mapmarker();
   })

   var map = new naver.maps.Map('map', {
      center : new naver.maps.LatLng(37.3595704, 127.105399),
      zoomControl : true,
      zoomControlOptions : {
         position : naver.maps.Position.TOP_RIGHT
      },
      zoom : 7,
      mapTypeControl : true,      
      mapDataControl : false
   });

   // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
   function getClickHandler(seq) {
      console.log("1");
      return function(e) {
         var marker = markers[seq], infoWindow = infoWindows[seq];

         if (infoWindow.getMap()) {
            infoWindow.close();
         } else {
            infoWindow.open(map, marker);
         }
      }
   }

   function ar(adress) {
      pin = [];

      naver.maps.Service.geocode({
         query : adress
      }, function(status, response) {
         if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
         }

         var result = response.v2, // 검색 결과의 컨테이너
         items = result.addresses; // 검색 결과의 배열

         let xx = parseFloat(items[0].x);
         let yy = parseFloat(items[0].y);

         aa = {
            adress : adress,
            x : xx,
            y : yy
         };

         xy.push(aa);

      });
   }
   function mapmarker() {
      map = new naver.maps.Map('map', {
         center : new naver.maps.LatLng(xy[0]['y'], xy[0]['x']),
         zoomControl : true,
         zoomControlOptions : {
            position : naver.maps.Position.TOP_RIGHT
         },
         zoom : 9,
         mapTypeControl : true
      });

      for (i = 0; i < xy.length; i++) {
         marker = new naver.maps.Marker({
            map : map,
            position : new naver.maps.LatLng(xy[i]['y'], xy[i]['x'])
         })
         markers.push(marker);
         var infoWindow = new naver.maps.InfoWindow({
            content : "<div class='mapdiv'><b>" + img[i] + '<br>' + con[i]
                  + '</b><br></div>'
         });
         infoWindows.push(infoWindow);
      }
      for (var i = 0; i < markers.length; i++) {
         naver.maps.Event.addListener(markers[i], 'click',
               getClickHandler(i));
      }

   }
   function resetmarker() {

      for (i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
      }
      markers = [];
      infoWindows = [];
   }
</script>
</html>