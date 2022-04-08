$(document)
.on('click', '#golist', function() {
   if (!confirm("자유게시판 목록으로 돌아가시겠습니까?")) {
      return false;
   } else{
      document.location="/travel/Notice?pageNum=1"+"&keyword="+"&type=";
    return false;
   }
})
.on('submit','#sbm_write',function(){
   $('#writer').val($.trim($('#writer').val()));
   $('#title').val($.trim($('#title').val()));
   $('#content').val($.trim($('#content').val()));
   
   if($('#writer').val()=="" || $('#title').val()=="" || $('#content').val()==""){
      alert("빈칸이 없도록 전부 작성해주세요.");
      return false;
   }
   return true;
})