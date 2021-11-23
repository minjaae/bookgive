function inputCheck(){
	if(document.regFrm.role.value==""){
		alert("role을 선택해주세요.");
		document.regFrm.email.focus();
		return;
	}
	
	if(document.regFrm.userID.value==""){
		alert("id를 입력해 주세요.");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pwd.value==""){
		alert("비밀번호를 입력해주세요.");
		document.regFrm.pwd.focus();
		return;
	}
	if(document.regFrm.repwd.value==""){
		alert("비밀번호 확인을 입력해주세요.");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호를 잘못 입력하셨습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.name.value==""){
		alert("이름을 입력해주세요.");
		document.regFrm.name.focus();
		return;
	}
	if(document.regFrm.email.value==""){
		alert("이메일을 입력해주세요.");
		document.regFrm.email.focus();
		return;
	}

    var str=document.regFrm.email.value;	   
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
          alert('E-mail 양식이 잘못 되었습니다.');
	      document.regFrm.email.focus();
		  return;
    }
	if(document.regFrm.phone.value==""){
		alert("전화번호를 입력해주세요.");
		document.regFrm.email.focus();
		return;
	}
    if(document.regFrm.zipcode.value==""){
		alert("우편번호를 검색해주세요");
		return;
	}

	document.regFrm.submit();
}

function win_close(){
	self.close();
}