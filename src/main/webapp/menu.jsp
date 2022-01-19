<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">

<title>Coffee&Beverage</title>
</head>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

table.bound { /*bound라는 class는 table 안에서만 쓸 수 있다.*/
	border-collapse: collapse;
	border: 1px solid black;
	height: 450px;
	width: 310px;
/* 	font-family: cursive; */
}

td.bound { /*이 bound는 td 안에서는 아래의 의미가 된다.*/
	border: 1px solid black;
	background-color: cornsilk;
}

#selMenu {
	width: 300px;
	height: 280px;
}

#selOrder {
	width: 300px;
	height: 280px;
}

#selSales {
	width: 300px;
	height: 400px;
}
#selSales1 {
	width: 600px;
	height: 400px;
}
#selMenu1 {
	width: 300px;
	height: 200px;
}

#btnPlus, #btnDone, #btnAdd {
	background-color: skyblue;
}

#btnMinus, #btnCancel, #btnReset {
	background-color: tomato;
}

#selMenu, #selOrder, #selSales, #selSales1 {
/* 	background-color: wheat; */
	font-size: 20px;
/* 	font-family: cursive; */
}

#btnMenu {
	background-color: red;
}

.abc {
	text-align: center;
}

body,dialog {
/* background-image: */
/* 		url(data:image/jpeg;base64,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); */
/* 		background-size: 2000px 1200px; */
background-color:wheat;
}

#sel, #sel1 {
	/*     color:white; */
	
}
#h3{
	text-align:center;
	font-size:30px;
 	background-color:white; 
}
caption{
/* 	color:wheat; */
	font-size:30px;
}
/* #sel{ */
/* 	color:black; */
/* } */
</style>
<body>
<h3 id=h3>Cafe Order</h3>
	<hr>
	<table>
		<tr>
			<td valign=top>
				<table class='bound' id=tblMenu>
					<caption>메뉴목록</caption>
					<tr>
						<td colspan=2 align=right>직원전용&nbsp;
							<button id=btnMenu>메뉴관리</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><select id=selMenu size=13></select></td>
					</tr>
					<tr>
						<td class='abc'>메뉴명</td>
						<td><input type=text id=name1 value='메뉴를 클릭하세요' readonly></td>
					</tr>
					<tr>
						<td class='abc'>수량</td>
						<td><input type=number id=count min=0 style='width: 30px'
							value=1>잔</td>
					</tr>
					<tr>
						<td class='abc'>금액</td>
						<td><input type=number id=price1 value=0 readonly>원</td>
					</tr>
					<tr>
						<td><button id=btnReset>비우기</button></td>
						<td align=right><button id=btnAdd>메뉴추가</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound' id=tbl2>
					<caption id=sel1>주문목록</caption>
					<tr>
						<td colspan=2 id=td2 value='123'><select id=selOrder size=13></select>
						</td>
					</tr>
					<tr>
						<td>총액&nbsp;&nbsp;&nbsp;&nbsp;<input type=number id=total style='width: 100px' class='as'>원
						</td>
					</tr>
					<tr>
						<td>모바일&nbsp;<input type=phone id=mobile value='전화번호 입력'
							size=13></td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td><button id=btnCancel>주문취소</button></td>
						<td align=right><button id=btnDone>주문완료</button></td>
					</tr>
				</table>
			</td>
			<td valign=top>
				<table class='bound'>
					<caption id=sel>판매내역</caption>
					<tr>
						<td colspan=2 align=right>
<!-- 							<button id=btnMenu2>summary</button> -->
					<tr>
						<td><select id=selSales size=20></select></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	  <div id=dlgMenu id=btnMenu style='display:none;' title="메뉴관리">
        <table>
            <tr>
                <td>
                    <select id=selMenu1 size=10></select>
                </td>
                <td>
                    <table>
                    <tr>
                        <td>코드</td><td><input type=text id=code style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>메뉴명</td><td><input type=text id=name style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>단가(가격)</td><td><input type=number id=price min=0 step=500 style='width:50px'>원</td>
                    </tr>
                    <tr>
                        <td colspan=2 align=center><button id=btnPlus>Complete</button>&nbsp;
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>    
            </table>
    </div>
	<div id=dlgMenu2 style='display: none;' title="매출내역">
		<table>
			<tr>
				<td><select id=selMenu2 size=10 title="메뉴별 매출내역"></select></td>
				<td><select id=selMenu3 size=10 title="고객별 매출내역"></select></td>
				</tr>
		</table>
	</div>
	<table class='bound'>
					<caption id=sel1>매출내역</caption>
					<tr>
						<td colspan=2 align=right>
							<button id=btnMenu2>summary</button>
					<tr>
						<td><select id=selSales1 size=20></select></td>
					</tr>
				</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
su=0;
$(document)
.ready(function(){
	loadRoom();
	$('#total').val('');
})
.on('click','#btnCancel',function(){
	$("#selOrder").empty();
	$("#total").val('');
	su=0;
})
.on('click','#btnReset',function(){
	$("#name1").val('');
	$("#count").val('');
	$("#price1").val('');
})
.on('click','#btnMenu',function(){ 
        $('#dlgMenu').dialog({
        width:560,
        open:function(){ 
        	$.get('select',{},function(txt){
        		if (txt == "")
        			return false;
        		let rec = txt.split(';');
        		for (i = 0; i < rec.length; i++) {
        			let fld = rec[i].split(',');
        			html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
        			$('#selMenu1').append(html);
        		}
        	})
        },
        close:function(){
        	$('#selMenu').empty();
        	$('#selMenu1').empty();
        	loadRoom();
        }
        });
    })
    .on('change','#count',function(){
    	 str=$('#selMenu option:selected').text();
         let ar=str.split(' ');
         bb=$('#count').val();
         $('#price1').val(ar[2]*bb);

    })
   .on('click','#btnPlus',function() {
	   $('#selMenu1').empty();
				let operation = '';
				if ($('#code').val() == '') {
					if ($('#name').val() != '' && $('#price').val() != '') {
						operation = "insert";
					} else {
						alert('입력값이 모두 채워지지 않았습니다.');
						return false;
					}
				} else {
					if ($('#name').val() != '' && $('#price').val() != '') {
						operation = "update";
					} else {
						operation = "delete";
					}
				}
				$.get(operation, {
					code : $('#code').val(),
					name : $('#name').val(),
					price : $('#price').val()
				}, function(txt) {
					$('#code,#name,#price').val("");
					
					$.get('select',{},function(txt){
						if (txt == "")
							return false;
						let rec = txt.split(';');
						for (i = 0; i < rec.length; i++) {
							let fld = rec[i].split(',');
							html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
							$('#selMenu1').append(html);
						}
					})
				}, 'text');
				   $('#code').val('');
				   $('#name').val('');
				   $('#price').val('');
				return false;
			})
.on('click','#selMenu',function(){
	$('#count').val('1');
	let sM=$('#selMenu').val();
	let ar=sM.split(' ');
	$('#name1').val(ar[1]);
	$('#price1').val(ar[2]);
})
.on('focus','#mobile',function(){
	$('#mobile').val('');
})
.on('click','#btnAdd',function(){
	$('#total').val('');
	nm1=$('#name1').val();
	pr1=$('#price1').val();
	ct1=$('#count').val();
	sel=$("#selMenu option:selected").text();
	let ar=sel.split(' ');
	html ='<option>'+ar[0]+','+ar[1]+','+ct1+','+pr1+'</option>'; 
	$('#selOrder').append(html);
	pr1=parseInt(pr1);
    su+=pr1;
    $("#total").val(su);
    $('#btnReset').trigger('click');

	$('#name1').val('');
	$('#price1').val('');
	$('#count').val('');
})
.on('click','#btnDone',function(){
$('#selOrder option').each(function(){
	str='<option>'+$('#mobile').val()+','+$(this).text()+'</option>'
	$('#selSales').append(str);
	let a=$(this).text();
	let rec=a.split(',');
$.get('insert1',{
	menu_code : rec[0],
	mobile : $('#mobile').val(),
	cty : rec[2],
	total : rec[3]
},function(txt){
	$('#code,#mobile,#price,#count').val("");
},'text');
})
su=0;
$('#total').val('');
$('#selOrder').empty();
loadRoom1();
})


.on('click','#btnMenu2',function(){ 
        $('#dlgMenu2').dialog({
        width:560,
        open:function(){ 
        	loadRoom1();
        },
        close:function(){
        	loadRoom1();
        }
        });
    })

function loadRoom(){
	$.get('select',{},function(txt){
		if (txt == "")
			return false;
		let rec = txt.split(';');
		for (i = 0; i < rec.length; i++) {
			let fld = rec[i].split(',');
			html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
			$('#selMenu').append(html);
		}
	})
}

function loadRoom1(){
	$('#selSales1').empty();
	$('#selMenu2').empty();
	$('#selMenu3').empty();
	str='<option>'+'메뉴별 매출금액'+'</option>';
	$('#selMenu2').append(str);	
	str1='<option>'+'고객별 매출금액'+'</option>';
	$('#selMenu3').append(str1);
	$.get('select1',{},function(txt){
		console.log(txt);
		if (txt == "")
			return false;
		let rec = txt.split(';');  
		for (i = 0; i < rec.length; i++) {
			let fld = rec[i].split(',');
			html = '<option>'+fld[0]+' '+fld[1]+'원'+' '+fld[2]+'</option>';
			$('#selMenu2').append(html);
			$('#selSales1').append(html);
		}
	})
	$.get('select2',{},function(txt){
		console.log(txt);
		if (txt == "")
			return false;
		let rec = txt.split(';');
		for (i = 0; i < rec.length; i++) {
			let fld = rec[i].split(',');
			html1 = '<option>'+fld[0]+' '+fld[1]+'원'+' '+fld[2]+'</option>';
			$('#selMenu3').append(html1);
			$('#selSales1').append(html1);
		}
	})
}
</script>
</html>