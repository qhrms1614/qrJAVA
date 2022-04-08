let flag=true;
$(document)
.on('submit','#frmlogin',function(){
	if(flag==true) {alert($('#userid').val()+"님 환영합니다.");}
	if(flag==false) { return false;}
	return true;
})
;
function check(){
	flag=true;
	$('#userid').val($.trim($('#userid').val()));
	$('#password').val($.trim($('#password').val()));
	if($('#userid').val()=='') {
		flag=false;
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('#password').val()=='') {
		flag=false;
		alert('비밀번호를 입력하세요.');
		return false;
	}
	$.ajax({
		url:"/travel/user_check",
		data:{userid:$('#userid').val(),password:$('#password').val()},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
 	    	if(txt=='fail'){
 	    		flag=false;
 	    		console.log(flag);
 	    		alert('정보가 일치하지 않습니다.');		 	    		
 	    	}
		}
	});
}