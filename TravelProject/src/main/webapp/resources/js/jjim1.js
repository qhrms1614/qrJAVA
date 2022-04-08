xy = []
 console.log($("#resultpage").val());
 function ap() {
    $('#map').dialog({
       width : 950,
       height : 950,
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
       $.ajax({
             url:"/travel/deleteJjim1",
             data:{id:id,
                  loc:loc},
             method:"GET",
             datatype:"json",
             success:function(data){
                alert('찜 목록이 삭제되었습니다.');
                document.location="/travel/jjim1";
             }
          });
   })
   .on('click','#page',function(){
   $('input[name=pageNum]').val($(this).attr("href"));
         document.location = "/travel/in1/stay?st=" + $('#con').val()+"&page="+$('input[name=pageNum]').val();
   return false;
})
.on('click', '#mapi', function() {
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