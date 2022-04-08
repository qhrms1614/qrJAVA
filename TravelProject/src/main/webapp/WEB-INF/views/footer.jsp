<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/hotel/resources/css/first.css" rel="stylesheet"/> 
</head>
<style>
.site-footer
{
  background-color:#26272b;
  padding:45px 0 20px;
  font-size:15px;
  line-height:24px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}
.facebook{
   background-image:
      url(https://kr.seaicons.com/wp-content/uploads/2016/03/FaceBook-icon.png);
   background-repeat: no-repeat;
   background-position: 50% 50%;
   background-size: cover;
}
.youtube{
   background-image:
      url(https://png.pngtree.com/element_our/md/20180509/md_5af2ca57f0d57.jpg);
   background-repeat: no-repeat;
   background-position: 50% 50%;
   background-size: cover;
}
.insta{
   background-image:
      url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJVey-ITWMXULnrnbBadMMvdTQT5MqhleUwQ&usqp=CAU);
        background-repeat: no-repeat;
       background-position: 50% 50%;
       background-size: cover;
}
.naver{
    background-image:
      url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj1y-xNobztthDYI4VGt-p9zByIYZ3HlN7zw&usqp=CAU);
      background-repeat: no-repeat;
       background-position: 50% 50%;
       background-size: cover;
}
#hr{
    size:2px;
    color:gray;
}

.pageInfo_wrap{
	clear:both;
	/* margin-top: 20px;  */
}

.site-footer {
  position : relative;
  transform : translateY(0%);
}
</style>
<body>
	<!-- Footer-->
	<footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">3.37.251.29:8080/travel/main <i>휴먼여행정보센터 </i>2022~</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>출처 및 정보제공</h6>
            <ul class="footer-links">
              <li><a href="https://www.seantour.com/newseantour/main/main.do">바다여행</a></li><br>
              <li><a href="https://map.naver.com/">네이버지도</a></li>
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="/travel/main">홈</a></li><br>
              <li><a href="/travel/stay">숙박정보</a></li><br>
              <li><a href="/travel/jjim1">숙박북마크</a></li><br>
              <li><a href="/travel/jjim">관광북마크</a></li><br>
              <li><a href="/travel/Mypage">마이페이지</a></li><br>
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2022 All Rights Reserved by 
         <a href="http://www.human.or.kr/">Human</a>
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="https://ko-kr.facebook.com/echuman/"><i class="fa fa-facebook"></i></a></li>
              <li><a class="youtube" href="https://www.youtube.com/watch?v=9EDZixuODrw"><i class="fa fa-youtube"></i></a></li>
              <li><a class="insta" href="https://www.instagram.com/?hl=ko"><i class="fa fa-insta"></i></a></li>
              <li><a class="naver" href="https://map.naver.com/v5/"><i class="fa fa-naver"></i></a></li>   
            </ul>
          </div>
        </div>
      </div>
</footer>
</body>
</html>