$(document)
	
			.ready(function() {
				Member();
			})

			.on('click', '#ChangePW', function() {
				$('#ChangePW1').dialog({
					title : '비밀번호 변경',
					modal : true,
					width : 500,
					open : function() {
					},
					close : function() {
					}
				})
			})

			.on('click', '#ChangePH', function() {
				$('#ChangePH1').dialog({
					title : '전화번호 변경',
					modal : true,
					width : 500,
					open : function() {
					},
					close : function() {
					}
				})
			})
			
			.on('click','#ProfileImageEdit',function() {
				$('#image-upload').dialog({
					title: '프로필 변경',
					modal: true,
					width: 500,
					open: function() {
					},
					close: function() {
						
					}
				})
			})

			// 비밀번호 변경 유효성 검사
			.on('click','#ChangeGo',function() {
				$.ajax({
					url : '/travel/ChangePW',
					data : {},
					dataType : 'json',
					method : 'post',
					success : function(txt) {
						for (let i = 0; i < txt.length; i++) {
							if ($('#userid').val() == txt[i]['id'] && $('#Oldpassword').val() == txt[i]['pw']) {
								flag = "true";
								break;
							} else {
								flag = "false";
							}
						}
					},
					complete : function() {
						if (flag == "true") {
							$.ajax({
								url : '/travel/ChangePW1',
								data : {
									id : $('#userid').val(),
									pw : $('#Oldpassword').val(),
									pw1 : $('#Newpassword').val()
								},
								dataType : 'text',
								method : 'post',
								success : function(txt) {
									if (txt == "ok!") {
										alert('비밀번호 변경완료');
										document.location = '/travel/Mypage';
									} else {
										return false;
									}
								}
							})
						} else {
							alert("현재 비밀번호와 일치하지 않습니다");
							return false;
						}
					}
				})
			})

			// 전화번호 변경 유효성 검사
			.on('click', '#ChangeGop', function() {
				$.ajax({
					url : '/travel/ChangePH',
					data : {},
					dataType : 'json',
					method : 'post',
					success : function(txt) {
						for (let i = 0; i < txt.length; i++) {
							if ($('#userid').val() == txt[i]['id'] &&
								$('#Oldphone').val() == txt[i]['ph']) {
								flag = "true";
								break;
							} else {
								flag = "false";
							}
						}
					},
					complete : function() {
						if (flag == "true") {
							$.ajax({
								url : '/travel/ChangePH1',
								data : {
									id : $('#userid').val(),
									ph : $('#Oldphone').val(),
									ph1 : $('#Newphone').val()
								},
								dataType : 'text',
								method : 'post',
								success : function(txt) {
									if (txt == "ok!") {
										alert('전화번호 변경완료');
										document.location = '/travel/Mypage';
									} else {
									}
								}
							})
						} else {
							alert("현재 전화번호와 일치하지 않습니다");
							return false;
						}
					}
				})
			})

//	function Member() {
//		$.ajax({
//			url : "/travel/doMypage",
//			data : {},
//			method : "GET",
//			datatype : 'json',
//			beforeSend : function() {
//			},
//			success : function(data) {
//				for (i = 0; i < data.length; i++) {
//					$('#userid').val(data[i]['userid']);
//					$('#password').val(data[i]['password']);
//					$('#username').val(data[i]['username']);
//					$('#birthday').val(data[i]['birthday']);
//					$('#phone').val(data[i]['phone']);
//				}
//			}
//		});
//	}

	function ChangePW() {
		if ($('input[name=Oldpassword]').val() == '') {
			alert('현재 비밀번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Newpassword]').val() != $('input[name=Newpassword1]')
				.val()) {
			alert('비밀번호가 서로 일치해야 합니다');
			return false;
		}
		if ($('input[name=Newpassword]').val() == '') {
			alert('현재 비밀번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Oldpassword]').val() == $('input[name=Newpassword]')
				.val()) {
			alert('이전 비밀번호와 다르게 입력해주세요');
			return false;
		}
	}

	function ChangePH() {
		if ($('input[name=Oldphone]').val() == '') {
			alert('현재 전화번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Newphone]').val() != $('input[name=Newphone1]').val()) {
			alert('전화번호가 서로 일치해야 합니다');
			return false;
		}
		if ($('input[name=Newphone]').val() == '') {
			alert('현재 전화번호를 입력해주세요');
			return false;
		}
		if ($('input[name=Oldphone]').val() == $('input[name=Newphone]').val()) {
			alert('이전 전화번호와 다르게 입력해주세요');
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	