$(document)
.on('click', '#btnDelete', function() {
		if (confirm("삭제를 하면 홈페이지 이용에 제한이 됩니다.\n\n정말로 삭제 하시겠습니까?")) {
			$.ajax({
				url: "/travel/deleteMember",
				data: { userid: $("#userid").val() },
				method: 'post',
				datatype: 'text',
				success: function(data) {
					location.href = "logout"
				}
			});
		}

		return false;
	})	
.on('click', '#btnRevised', function() {
	let userid = $("#userid").val();
	let name = $("#name").val()
	let mobile = $("#mobile").val();
	if ($('input[name=password]').val() != $('input[name=passwordcheck]').val()) {
 		alert('입력한 비밀번호 확인 칸의 내용이 현재 비밀번호와 다릅니다.');
		return false;
	} if (emptyStr(name)) {
		alert("이름을 작성하지 않았습니다.");
		return false;
	} if (emptyStr(mobile)) {
		alert('휴대전화를 작성하지 않았습니다.');
		return false;
	} else {
		$.post({
			url: "updateMember",
			data: {
				userid: userid,
				name: name,
				mobile: mobile
			},
			method: 'post',
			datatype: 'text',
			success: function(data) {
				if (data != 'ok') {
					alert('변경에 실패하였습니다.');
					return false;
					} else {
					alert("변경에 성공하였습니다.");
					$("#passwordcheck").val(null);
						
					return true;
					}
				}
			});
		}

		return false;
	})