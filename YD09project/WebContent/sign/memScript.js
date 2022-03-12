var iCC = 0;

function viewHint(opt) {
  if(opt) {
     join_hint_visible.style.display = "block";
  }
  else {
     join_hint_visible.style.display = "none";
  }
}

function idCheck(id) {
	if (id == "") {
		alert("아이디를 입력해주세요.");
		joinForm.memberid.focus();
	} else {
		iCC = 1;
		url="idCheck.jsp?memberid=" + id;
		window.open(url, "post", "width=500, height=200");
	}
}

function inputCheck(){
	const joinForm = document.joinForm;
	
	const memberid = joinForm.memberid;
	const password = joinForm.password;
	const name = joinForm.name;
	const email = joinForm.email;
	const studentdp = joinForm.studentdp;
	const studentid = joinForm.studentid;
	
	if (memberid.value == "") {
		alert("아이디를 입력해 주세요.");
		memberid.focus();
		return;
	} else if (memberid.value.length <= 3 || memberid.value.length >= 11) {
		alert("아이디는 4자 이상 10자 이하로 작성해 주세요.");
		memberid.focus();
		return;
	}
	
	if (iCC == 0) {
		alert("아이디 중복 확인은 필수사항 입니다.")
		memberid.focus();
		return;
	}
	
	if (password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		password.focus();
		return;
	} else if (password.value.length <= 3 || password.value.length >= 11) {
		alert("비밀번호는 4자 이상 10자 이하로 작성해 주세요.");
		password.focus();
		return;
	}
	
	if (name.value == "") {
		alert("이름를 입력해 주세요.");
		name.focus();
		return;
	}
	
	if (email.value == "") {
		alert("이메일을 입력해 주세요.");
		email.focus();
		return;
	} else {
		var str = email.value;	   
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.');
		var spacePos = str.indexOf(' ');
		var commaPos = str.indexOf(',');
		var eMailSize = str.length;
		if (atPos > 1 && atPos == atLastPos && 
	   		dotPos > 3 && spacePos == -1 && commaPos == -1 
	   		&& atPos + 1 < dotPos && dotPos + 1 < eMailSize);
		else {
		  	alert('E-mail 입력 형식이 맞지 않습니다.\n(ex: example@exam.com)');
		  	email.focus();
		  	return;
		}
	}
	
	if(studentdp.value == "0"){
		alert("학과를 선택해 주세요.");
		studentdp.focus();
		return;
	}
	
	if(studentid.value == ""){
		alert("학번을 입력해 주세요.");
		studentid.focus();
		return;
	}
	
	joinForm.submit();
}

function myDelete(my_id) {
	document.my_delete.my_id.value = my_id;
	document.my_delete.submit();
}
