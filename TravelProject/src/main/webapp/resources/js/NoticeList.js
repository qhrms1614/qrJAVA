$(document)
.on('click','#page',function(e){
	$('input[name=pageNum]').val($(this).attr("href"));
	document.location="/travel/Notice?pageNum="+$('input[name=pageNum]').val()+"&keyword="+$("input[name='keyword']").val()+"&type="+$("select[name=type]").val();
	return false;
})
.on('click','#Write',function(){
	document.location="/travel/Notice_Write"
	return false;
})
.on('click','.td_first',function(){
	document.location="/travel/Notice_View?pageNum="+$('input[name=pageNum]').val()+"&keyword="+$("input[name='keyword']").val()+"&type="+$("select[name=type]").val()+"&post_code="+$(this).attr('id');
	return false;
})
.on('click','#btn_serach',function(){
// 	console.log($("select[name=type]").val());
	$("input[name='keyword']").val($("input[name='n_keyword']").val());
	if($("select[name=type]").val()==""){
		alert("검색 종류를 선택하세요.");
		return false;
	} else {
		$("input[name=type]").val($("select[name=type]").val());
	}
	if(!$("input[name='keyword']").val()){
		alert("키워드를 입력해주세요.");
		return false;
	}
	document.location="/travel/Notice?pageNum=1&keyword="+$("input[name='keyword']").val()+"&type="+$("input[name='type']").val();
	return false;
})