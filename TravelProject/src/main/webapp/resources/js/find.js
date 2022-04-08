let flag=true;
$(document)
.on('click','#btnfind_id',function(){
	$('#name1').val($.trim($('#name1').val()));
	$('#mobile1').val($.trim($('#mobile1').val()));
	if($('#name1').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('#mobile1').val()=='') {
		alert('전화번호를 입력하세요.');
		return false;
	}
	if($('#idtable tr').length==5){
		alert('아이디를 확인하시오');
		return false;
	}
	$.ajax({
		url:"/travel/find_id",
		data:{username:$('#name1').val(),phone:$('#mobile1').val()},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
	    	if(txt=='fail'){
	    		flag=false;
	    		alert('아이디를 찾을 수 없습니다.');
	    		return false;
	    	} else {
				let str='아이디  :  '+txt
				alert(str)
	    		return false;
    		}
		}
	});
    return false;
})

.on('click','#btnfind_pw',function(){
	$('#name2').val($.trim($('#name2').val()));
	$('#mobile2').val($.trim($('#mobile2').val()));
	$('#userid').val($.trim($('#userid').val()));
	if($('#name2').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('#mobile2').val()=='') {
		alert('전화번호를 입력하세요.');
		return false;
	}
	if($('#userid').val()=='') {
		alert('아이디 입력하세요.');
		return false;
	}
	if($('#pwtable tr').length==6){
		alert('비밀번호를 확인하시오');
		return false;
	}
	$.ajax({
		url:"/travel/find_pw",
		data:{username:$('#name2').val(),phone:$('#mobile2').val(),userid:$('#userid').val()},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
	    	if(txt=='fail'){
	    		flag=false;
	    		alert('비밀번호를 찾을 수 없습니다.');
	    		return false;
	    	} else {
				let str="비밀번호 : "+txt
				alert(str);
	    		return false;
    		}

		}
	});
    return false;
})