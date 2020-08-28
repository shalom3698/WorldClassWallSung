<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개인정보 확인 변경</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	function btn(){ 
		alert('개인정보가 변경 되었습니다.'); 
		return true;
		}

	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("stu_zip").value = data.zonecode;
				document.getElementById("stu_address").value = data.address;
			}
		}).open();
	}
</script>

</head>
<body>
<form action="stuInfoUpUp.do">
	<table border="1" style="text-align: center;">
		<tr>
			<td rowspan="11">
			<img src="/resources/imgFile/${login.stu_path}" width="300"/><br>
			</td>
			<td>학번</td><td colspan="3">${login.stu_no}</td>
		</tr>
		<tr>
			<td>생년월일</td><td colspan="3">${login.stu_birth}</td>
		</tr>
		<tr>
			<td>이름</td><td>${login.stu_name}</td><td>성별</td><td>${login.stu_gen}</td>
		</tr>
		<tr>
			<td>학년</td><td colspan="3">${login.stu_year}</td>
		</tr>
		<tr>
			<td>상태</td><td colspan="3">${login.state}</td>
		</tr>
		<tr>
			<td>국적</td><td colspan="3">${login.stu_coun}</td>
		</tr>
		<tr>
			<td>학과</td><td colspan="3">${login.dept_nm}</td>
		</tr>
		<tr>
			<td>연락처</td><td colspan="3"><input type="text" name="stu_tel" id="stu_tel" value="${login.stu_tel}"></td>
		</tr><tr>
			<td>E-mail</td><td colspan="3"><input type="text" name="stu_email" id="stu_email" value="${login.stu_email}"></td>
		</tr>
		<tr>
			<td>우편번호</td><td colspan="3"><input type="text" name="stu_zip" id="stu_zip" value="${login.stu_zip}" readonly>
			<input type="button" value="우편번호찾기"
					onClick="sample4_execDaumPostcode()"> 우편번호를 검색하세요.</td>
		</tr>
		<tr>
			<td>주소</td><td colspan="3"><input type="text" name="stu_address" id="stu_address" value="${login.stu_address}"></td>
		</tr>
	</table><br>
	
	<input type="hidden" name="stu_no" value="${login.stu_no}">
 	<input type="submit" value="수정" id="buttonfunc" onclick="javascript:btn()">
	<input type="button" value="취소" onclick="document.location.href='stuInfoSel.do'">
</form>

</body>
</html>