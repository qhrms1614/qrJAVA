let flag=true;
let flag1="fail";
$(document)

.on('click','#btnCancle',function(){
   document.location="/travel/"
   return false;
})
.on('click','#check_id',function(){
   let userid_check=/^(?=.*[a-z])(?=.*[0-9]).{5,10}$/;
   $('#userid').val($.trim($('#userid').val()));
   if($('#userid').val()=='') {
      alert('아이디를 입력하세요.');
	  flag1="fail";
      return false;
   } else if(!userid_check.test($('#userid').val())){
      alert('아이디는 최소 5자,최대 10자까지이며\n영어소문자와 숫자로 이루어져야 합니다.');
	  flag1="fail";
      return false;
   }
   $.ajax({
      url:"/travel/id_check",
      data:{userid:$('#userid').val()},
      dataType:'text',
      method:'post',
      async:false,
      success:function(txt){
         console.log(txt);
          if(txt=='fail'){
             flag=false;
             alert('가입되어있는 아이디입니다.');
			 flag1="fail";
             return false;
          } else {
             alert('사용가능한 아이디입니다.');
			 flag1="ok";
             return false;
          }
      }
   });
    return false;
})
.on('submit','#frmsign',function(){
   let password_check=/^(?=.*[a-z])(?=.*[0-9]).{6,12}$/;
   let name_check=/[가-힣]{2,6}$/;
   let mobile_check=/010\d{8}$/;
   
   $('#username').val($.trim($('#username').val()));
   $('#password').val($.trim($('#password').val()));
   $('#password1').val($.trim($('#password1').val()));
   $('#phone').val($.trim($('#phone').val()));
   $('#birthday').val($.trim($('#birthday').val()));
   $('#userid').val($.trim($('#userid').val()));
   
   if($('#userid').val()=='') {
      alert('아이디를 입력하세요.');
      return false;
   }
   if($('#password').val()=='') {
      alert('비밀번호를 입력하세요.');
      return false;
   } else if(!password_check.test($('#password').val())){
      alert('비밀번호는 최소 6자,최대 12자까지이며\n영어소문자와 숫자가 포함되어야 합니다.');
      return false;
   }
   if($('#password1').val()=='') {
      alert('비밀번호확인을 입력하세요.');
      return false;
   }else if(!password_check.test($('#password1').val())){
      alert('비밀번호는 최소 6자,최대 12자까지이며\n영어소문자와 숫자가 포함되어야 합니다.');
      return false;
   }
   if($('#password1').val()!=$('#password').val()) {
      alert('비밀번호가 같지 않습니다.');
      return false;
   }
   if($('#username').val()=='') {
      alert('이름을 입력하세요.');
      return false;
   } else if(!name_check.test($('#username').val())){
      alert('이름은 최소 2자,최대 6자까지이며\n한글로만 이루어져야 합니다.');
      return false;
   }
   if($('#birthday').val()=='') {
      alert('생일을 입력하세요.');
      return false;
   }
   if($('#phone').val()==""){
      alert("휴대전화를 입력하세요.");
      return false;
   }else if(!mobile_check.test($('#phone').val())){
      alert('휴대전화는 8자로 하이픈(-)없이 숫자로만 이루어져야 합니다.');
      return false;
   }
   if(flag1=="ok"){
	return true;
} 
   if(flag1=="fail"){
	alert("중복체크를 해주세요");
	return false;
} 
})
;/**
 * 
 */