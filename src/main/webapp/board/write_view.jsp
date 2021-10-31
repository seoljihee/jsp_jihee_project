<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#main{
width:400px;
height:480px;
padding:50px 20px 20px 0px;
margin-top:50px;
border : 1px  rgb(155, 155, 155) solid; 
border-radius: 5px;
 background-color: rgb(240, 240, 240);
}
input{
margin-bottom:10px; padding: 5px 25px 5px 25px;
}
label{
font-size:small;
}
</style>
<script type="text/javascript">
	function modifyF(){
		var name = document.getElementById("name")
		var title = document.getElementById("title")
		if(name.value == ""){
			alert('이름은 필수 항목입니다')
			name.focus()
		}else if(title.value == ""){
			alert('제목 필수 항목입니다')
			title.focus()
		}else{
			fo.submit();
		}
	}
</script>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
	<div id="main">
	<div>
		<h1 style="text-align:center;margin-bottom:10px">글작성</h1>
	</div>
		<form id="fo" action="${contextPath}/board/write_save.jsp" method="post">
			<table>
				<tr>
					<td><label>이름</label></td>
				</tr>
				<tr>
					<td><input type="text" id="name" name="name" value="${loginUser}" ></td>
				</tr>
				<tr>
					<td><label>제목</label></td>
				</tr>
				<tr>
					<td><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<td><label>내용을 입력하세요.</label></td>
				</tr>
				<tr>
					<td><textarea rows="10" cols="30" name="content"></textarea> </td>
				</tr>
				<tr>
					<td style="padding-top: 16px;">
					<input style="padding: 7px 100px 7px 100px; color: white; background-color: black;border-radius: 5px;" type="button" value="저장" onclick="modifyF()">
					
					</td>
				</tr>
					<td><a href="list.jsp">목록이동</a></td>
				<tr>
				</tr>
			</table>
		</form>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>