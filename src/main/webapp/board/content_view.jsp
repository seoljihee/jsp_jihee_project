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
height:550px;
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
<body>
<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
<c:set var="dto" value="${dao.contentView(param.id, 1) }"/>
<c:import url="../default/header.jsp"/>
<div class="wrap">
	<div id="main">
	<div>
		<h1 style="text-align:center;margin-bottom:10px">글작성</h1>
	</div>
		<form action="${contextPath}/board/modify.jsp" method="post">
			<table>
				<tr>
					<td><label>번호</label></td>
				</tr>
				<tr>
					<td><input type="text" name="id" value=""></td>
				</tr>
				<tr>
					<td><label>조회수</label></td>
				</tr>
				<tr>
					<td><input type="text" name="hit"></td>
				</tr>
				<tr>
					<td><label>제목</label></td>
				</tr>
				<tr>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td><label>내용을 입력하세요.</label></td>
				</tr>
				<tr>
					<td><textarea rows="10" cols="30" name="content"></textarea> </td>
				</tr>
				<tr>
					<td style="padding-top: 16px;"><input style="padding: 7px 83px 7px 83px; color: white; background-color: black;border-radius: 5px;" type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>