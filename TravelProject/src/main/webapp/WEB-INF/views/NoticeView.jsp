<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
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
<title>게시판</title>
<link href="${pageContext.request.contextPath}/resources/css/NoticeView.css" rel="stylesheet" >
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

li {
	float: left;
	list-style: none;
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

.pageInfo {
	display: inline-block;
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
	background-color: green;
	color: white;
}

.pageInfo a:hover:not(.active) {
	background-color: #ddd;
}

.pageInfo a {
	border-radius: 5px;
}

.pageInfo a.active {
	border-radius: 5px;
}

#resultpage {
	display: block;
	text-align: center;
	margin: 0 auto;
	font-size: 22px;
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	

	<jsp:include page="header.jsp"></jsp:include>

<div id="N_Body" align=center>
	<div id=title_tbl>
		<input type="hidden" name="pageNum" value="${page.pageNum }">
		<input type="hidden" name="keyword" value="${page.keyword }">
		<input type="hidden" name="type" value="${page.type }"> 
		<table id=tb_title>
			<tr>
				<td id="bt_list" <c:if test="${userid==null }">colspan=3</c:if>>
					<input type=button value="LIST" id="golist" class=" list btn btn-outline-secondary">
				</td>
				<c:if test="${userid==post.writer}"> <!-- 같은 아이디인경우 -->
					<td id="bt_up" colspan=2>
						<input type=button value="수정" id="btnUpdate" class=" list btn btn-outline-secondary">
						<input type=button value="삭제" id="btnDelete" class=" list btn btn-outline-secondary">
					</td>
				</c:if>
			</tr>
			<tr>
				<td class=title>
					<input type=hidden value="${post.bno }"name=bno>${post.title}
				</td>
				<td class=write>작성자 ${post.writer }</td>
				<td class=date>
					<c:if test="${post.updated!=null }">
						수정일자 : ${post.updated }<br>
					</c:if>
					작성일자 : ${post.created}
				</td>
			</tr>
			<tr>
				<td colspan=3 class=content>${post.content}
				</td>
			</tr>
		</table>
	</div>
	<div id="div_reply">
		<br>
		<div id="re_title" style="text-align:left"></div>
		<hr>
		<div id="re_list" style="display:none;">
			<table id="reply">
				<tbody></tbody>
			</table>
			<br>
			<c:if test="${userid!=null }">
				<div id="re_insert" align=left>
					<div id="writer">작성자&nbsp;&nbsp;&nbsp;&nbsp; ${userid }</div>
					<br>
					<div id="insert_content" align=right>
						<textarea id="content" rows=3 cols=126 placeholder="1000자 이하로 작성해주십시오."
						 style="resize: none; border: none"></textarea><br>
						<button id="btn_reWrite">등록</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>

let re_display=false;
$(document)
.ready(function(){
	reply_list();
	r_count();
})
.on('click', '#golist', function() { // 리스트로 이동
	document.location="/travel/Notice?pageNum="+$('input[name=pageNum]').val()+"&keyword="+$("input[name='keyword']").val()+"&type="+$("input[name='type']").val();
	return false;
})
.on('click','#btnUpdate',function() { // 게시글 수정버튼 클릭시
	document.location = '/travel/Notice_Update?pageNum='+$('input[name=pageNum]').val()+"&keyword="+$("input[name='keyword']").val()+"&type="+$("input[name='type']").val()+'&post_code='+ $('input[name=bno]').val();
	//1. 글쓰기 ->write: 그냥 페이지 띄우기 2. 글수정 ->write : 페이지 띄우며 기존에 있던 값 불러오기
	return false;
})
.on('click','#btnDelete',function() { // 게시글 삭제버튼 클릭시
	if (!confirm("정말로 해당 게시물을 삭제하시겠습니까?")) {
		return false;
	} else {
		document.location = "/travel/Notice_Del?post_code="+ $('input[name=bno]').val();
		return false;
	}	
})
.on('click','#re_title',function(){ // 댓글 보여주기 가리기
	if($('#re_list').css('display')=='none'){
		$('#re_list').css('display','block');
	} else {
		$('#re_list').css('display','none');
	}
	return false;
})
.on('click','#btn_reWrite',function(){ // 모댓글 작성
	$('#content').val($.trim($('#content').val()));
	if($('#content').val()==""){
		alert("내용을 작성해주세요.");
		return false;
	}	
	let content=$('#content').val().replace(/\n/g,"<br>");
// 	console.log(content);
	
	reply_write("",content);
	$('#content').val('');
	return false;
})
.on('click','#btn_rereW',function(){ // 답글달기 버튼 클릭시
	if(re_display==true){
		$('#reply tbody tr').remove('#W_reply');
		re_display=false;
	} else{
		let grp=$(this).attr('name');
		let listHtml="<tr id='W_reply'><td colspan=3 id='W_reWriter'>작성자&nbsp;"+'${userid}'+"</td></tr>"
		listHtml+="<tr id='W_reply'><td colspan=3 id='W_rContent'>"
		listHtml+="<div id='insert_content' align=right>"
		listHtml+="<textarea id='rew_content' rows=3 cols=126 placeholder='1000자 이하로 작성해주십시오.' style='resize: none; border: none'></textarea><br>"
		listHtml+="<button id='re_Insert' name='"+grp+"'>답글작성</button></div></td></tr>"
		$('#rno'+grp).after(listHtml);
		re_display=true;
	}	
})
.on('click','#re_Insert',function(){ // 답글작성 버튼 클릭시
// 	console.log($(this).attr('name'));
	$('#rew_content').val($.trim($('#rew_content').val()));
	if($('#rew_content').val()==''){
		alert('답글 내용을 작성해주세요.');
		return false;
	}
	let content=$('#rew_content').val().replace(/\n/g,"<br>");
	
	reply_write($(this).attr('name'),content);
	return false;
})
.on('click','#btn_reU',function(){ // 댓글수정버튼 클릭시
	let rno=$(this).attr('name');
	let listHtml="<tr id='rno"+$(this).attr('name')+"'>"
	listHtml+="<td colspan=3 id='W_rContent'><div id='insert_content' align=right>"
	listHtml+="<textarea id='reu_content' rows=3 cols=126 placeholder='1000자 이하로 작성해주십시오.' style='resize: none; border: none'>"+$('#re_content'+rno).html().replace(/(<br>|<br\/>|<br \/>)/g,"\n")+"</textarea>"
	listHtml+="<button id='re_Update' name='"+rno+"'>답글수정</button>"
	listHtml+="<button id='re_cancle' name='"+rno+"'>수정취소</button></div></td></tr>"
	$('#rno'+$(this).attr('name')).replaceWith(listHtml);
})
.on('click','#re_cancle',function(){ // 수정취소 클릭시	
	listHtml="<tr id='rno"+$(this).attr('name')+"'>"
	listHtml+="<td class='cn_child' colspan=3 id='re_content"+$(this).attr('name')+"'>"+$('#reu_content').val().replace(/\n/g,"<br>")+"</td></tr>"
	$('#rno'+$(this).attr('name')).replaceWith(listHtml);
})
.on('click','#re_Update',function(){// 댓글수정
	$('#reu_content').val($.trim($('#reu_content').val()));
	if($('#reu_content').val()==''){
		alert('내용을 작성해주세요.');
		return false;
	}
	let content=$('#reu_content').val().replace(/\n/g,"<br>");
	
	$.ajax({
		url:"/travel/update_reply",
		data:{content:content,rno:$(this).attr('name')},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
 	    	if(txt=="ok"){
 	    		alert("수정이 완료되었습니다.");
 	    	}
		}
	});
 	reply_list();
	return false;
})
.on('click','#btn_reD',function(){ // 모댓글 삭제
	if(!confirm('삭제하시겠습니까?')){
		return false;
	} else {
		$.ajax({
			url:"/travel/delete_reply",
			data:{rno:$(this).attr('name')},
			dataType:'text',
			method:'post',
			async:false,
			success:function(txt){
				console.log(txt);
	 	    	if(txt=="ok"){
	 	    		alert("삭제되었습니다");
	 	    	}
			}
		});
	}
 	reply_list();
	r_count();
	return false;
})
;
function reply_write(grp,content){
	let writer="${userid}";
//	writer='${userid}';
	$.ajax({
		url:"/travel/write_reply",
		data:{writer:writer,content:content,bno:$('input[name=bno]').val(),grp:grp},
		dataType:'text',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
 	    	if(txt=="ok"){
 	    		alert("답글 작성이 완료되었습니다.");
 	    	}
		}
	});
	reply_list();
	r_count();
}
function reply_list(){
	let writer="${userid}";
	$.ajax({
		url:"/travel/list_reply",
		data:{bno:$('input[name=bno]').val()},
		dataType:'json',
		method:'post',
		async:false,
		success:function(txt){
			console.log(txt);
//			let writer='${userid}';
// 			console.log(writer);
			let listHtml="";
 	    	for(i=0; i<txt.length; i++){ 
    			if(txt[i]['grpl']==0){ // 모댓글일경우
     	    		listHtml+="<tr>"
    				if(writer!="") { // 회원인경우
        				listHtml+="<td id='writer_p'>작성자&nbsp;"+txt[i]['writer']+"</td>"; // 작성자
        				if(txt[i]['updated']==null) listHtml+="<td id='data_p'>"+txt[i]['created']+"</td>"; // 수정되지 않았을경우
     	    			else listHtml+="<td id='data_p'>"+txt[i]['created']+"&nbsp;(수정됨)</td>" // 수정된 경우
     	    			if(txt[i]['content']!="삭제된 댓글입니다."){
        					listHtml+="<td id='btn_p'><button id='btn_rereW' name='"+txt[i]['grp']+"'>답글달기</button>"
        					if(writer==txt[i]['writer']) {
         	    				listHtml+="<button id='btn_reU' name='"+txt[i]['rno']+"'>댓글수정</button>"
         	    				listHtml+="<button id='btn_reD' name='"+txt[i]['rno']+"'>댓글삭제</button></td></tr>"
         	    			} else listHtml+="</td></tr>"     	    				     	    				
     	    			} else {
     	    				listHtml+="<td id='btn_p'><button id='btn_reD' name='"+txt[i]['rno']+"'>댓글삭제</button></td></tr>"
     	    			}
     	    			listHtml+="<tr id='rno"+txt[i]['rno']+"'>"
     	    			listHtml+="<td colspan=3 class='cn_p' id='re_content"+txt[i]['rno']+"'>"+txt[i]['content']+"</td></tr>"
    				} else { // 비회원인경우
    					listHtml+="<td id='no_writer'>작성자&nbsp;"+txt[i]['writer']+"</td>"; // 작성자
    					if(txt[i]['updated']==null) listHtml+="<td colspan=2 id='no_data'>"+txt[i]['created']+"</td>";
     	    			else listHtml+="<td colspan=2 id='no_data'>"+txt[i]['created']+"&nbsp;(수정됨)</td></tr>"
     	    			listHtml+="<tr id='rno"+txt[i]['rno']+"'>"
     	    			listHtml+="<td colspan=3 class='cn_p' id='re_content"+txt[i]['rno']+"'>"+txt[i]['content']+"</td></tr>"
    				}    				
    			} else { //자식댓글인경우
    				listHtml+="<tr>"
    				if(writer!="") { // 회원인경우
        				listHtml+="<td id='writer_c'>↳&nbsp;작성자&nbsp;"+txt[i]['writer']+"</td>"; // 작성자
        				if(txt[i]['updated']==null) listHtml+="<td id='data_c'>"+txt[i]['created']+"</td>";
     	    			else listHtml+="<td id='data_c'>"+txt[i]['created']+"&nbsp;(수정됨)</td>"
    					listHtml+="<td id='btn_c'>"
    					if(writer==txt[i]['writer']) {
     	    				listHtml+="<button id='btn_reU' name='"+txt[i]['rno']+"'>댓글수정</button>"
     	    				listHtml+="<button id='btn_reD' name='"+txt[i]['rno']+"'>댓글삭제</button></td></tr>"
     	    			} else listHtml+="</td></tr>"
     	    				listHtml+="<tr id='rno"+txt[i]['rno']+"'>"
         	    			listHtml+="<td class='cn_child' colspan=3 id='re_content"+txt[i]['rno']+"'>"+txt[i]['content']+"</td></tr>"
    				} else { // 비회원인경우
    					listHtml+="<td id='no_cwriter'>↳&nbsp;작성자&nbsp;"+txt[i]['writer']+"</td>"; // 작성자
    					if(txt[i]['updated']==null) listHtml+="<td colspan=2 id='no_cdata'>"+txt[i]['created']+"</td>";
     	    			else listHtml+="<td colspan=2 id='no_cdata'>"+txt[i]['created']+"&nbsp;(수정됨)</td></tr>"
     	    			listHtml+="<tr id='rno"+txt[i]['rno']+"'>"
     	    			listHtml+="<td colspan=3 class='cn_child' id='re_content"+txt[i]['rno']+"'>"+txt[i]['content']+"</td></tr>"
    				}    
    			}
 	    	}
//  	    	console.log(listHtml);
    		$('#reply tbody').html(listHtml);
		}
	});
}
function r_count(){
	$.ajax({
		url:"/travel/rcount",
		data:{bno:$('input[name=bno]').val()},
		dataType:'text',
		method:'post',
		async:false,
		beforeSend:function(){
			$('#re_title').empty();
		},
		success:function(txt){
//			console.log(txt);
			let str="댓글 ("+txt+")";
 	    	$('#re_title').append(str);
		}
	});
}

</script>
</html>