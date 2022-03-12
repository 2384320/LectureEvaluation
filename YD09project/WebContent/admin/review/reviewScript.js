	function reviewDelete(eva_id) {
		document.re_delete.eva_id.value = eva_id;
		document.re_delete.submit();
	}

	
		window.onload = function(){
		document.getElementById("btnSearch").onclick = function(){
			if(frm.sword.value == ""){
				frm.sword.focus();
				alert("검색어를 입력하시오");
				return;
			}
			frm.submit();
		}
	}