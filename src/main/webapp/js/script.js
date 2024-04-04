//게시물 등록 전 체크
function chkForm() {
	var f = document.frm; //form 태그 요소. 전체를 가져온다
	
	if(f.name.value == '') {
		alert("이름을 입력해주세요.");
		return false;
	}
	
	if(f.address.value == '') {
		alert("주소를 입력해주세요.");
		return false;
	}
	
	if(f.phone.value == '') {
		alert("전화번호를 입력해주세요.");
		return false;
	}
	
	if(f.gender.value == '') {
		alert("성별을 골라주세요.");
		return false;
	}
	
	if(f.age.value == '') {
		alert("나이를 입력해주세요.");
		return false;
	}
	

	f.submit(); // 서버로 폼태그 안의 데이터 전송
}

function chkDelete(id) {
	const result = confirm("삭제하시겠습니까?");
	
	if(result) {
		const url = location.origin;
		location.href = url + "/jsp_customer/delete?id=" + id;
		
	} else {
		return false;
	}
	
}















