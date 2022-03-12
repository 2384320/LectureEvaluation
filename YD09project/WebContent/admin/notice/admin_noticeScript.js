function btnSearch() {
	if(frm.sword.value == ""){
		frm.sword.focus();
		alert("검색어를 입력하시오");
		return;
	}
	frm.submit();
}