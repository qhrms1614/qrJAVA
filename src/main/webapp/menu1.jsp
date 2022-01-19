<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  <link rel="stylesheet" href="C:\20211022\Cafe.css"> -->
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <title>Coffee&Beverage</title>
</head>
<body>
   <body>
    <table>
        <tr>
            <td valign=top>
                <table class='bound'>
                    <caption>MenuList</caption>
                    <tr>
                        <td colspan=2 align=right>
                        <button id=btnMenu>MenuManagement</button>
                        </td>
                    </tr>
                <tr>
                    <td colspan=2>
                        <select id=selMenu size=13></select>
                    </td>
                </tr>
                <tr>
                    <td>MenuName</td>
                    <td><input type=text id=menuname readonly></td>
                </tr>
                <tr>
                    <td>Count</td>
                    <td><input type=number id=count min=0 style='width:30px'>잔</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type=number id=price value=0 readonly>Won</td>
                </tr>
                <tr>
                    <td><button id=btnReset>Reset</button></td>
                    <td align=right><button id=btnAdd>Menu add</button></td>
                </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' id=tbl2>
                    <caption>OrderList</caption>
                    <tr>
                        <td colspan=2 id=td2>
                            <select id=selOrder size=13></select>
                        </td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><input type=number id=total style='width:100px'>Won</td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><input type=phone id=mobile size=13></td>
                    </tr>
                    <tr>
                        <td colspan=2>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>Order Cancel</button></td>
                        <td align=right><button id=btnDone>Order Complete</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound'>
                    <caption>Sale Daily</caption>
                    <tr>
                        <td>
                            <select id=selSales size=20></select>
                        </td>
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
                        <td colspan=2 align=center><button id=btnPlus>plus</button>&nbsp;
                            <button id=btnMinus>Delete</button>
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>    
            </table>
    </div>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
// 1
$(document)
.ready(function(){
    $.get('select', {}, function(txt) {
       if (txt == "")
          return false;
       let rec = txt.split(';');
       for (i = 0; i < rec.length; i++) {  /*위에서 구한 값들을 여기서 처리한다..각셀에 집어넣는다는 뜻*/
          let field = rec[i].split(',');
          let html ='<option>'+field[0]+','+field[1]+','+field[2]+'</option>';
          $('#selMenu,#selMenu1').append(html);
          console.log(html);
       }
    })
 })
 

 
</script>
</html>