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
#login_main{}
h1{text-align:left; margin-top:60px;margin-bottom:30px; }
#login_main{
width:300px;
height:300px;
padding: 2px 25px 30px 25px;
margin-top:100px;
margin-bottom: 80px;
border : 1px  rgb(155, 155, 155) solid; 
border-radius: 5px;
 background-color: rgb(240, 240, 240);
}
#div2 a{color:red; font-size:small;}
#div2{margin: 40px 20px 15px 30px;}
</style>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap">
<c:choose>
	<c:when test="${loginUser == null }">
<div id="login_main">
<h1>LOGIN</h1>
	<form action="${contextPath }/login/LoginChk.jsp" method="post">
	<table>
		<tr>
			<td>
				<input style="margin-bottom:10px; padding: 5px 25px 5px 25px;"type="text" name="id" placeholder="input id">
			</td>
			<td rowspan="2">
				<input style="margin-left: 10px; padding: 25px 10px 25px 10px; color:rgb(255, 255, 255);background-color: black;border-radius: 5px; " type="submit" value="LOGIN">
			</td>
		</tr>
		<tr>
			<td>
				<input style="padding: 5px 25px 5px 25px;" type="password" name="pwd" placeholder="input id">
			</td>
		</tr>
		<tr style="line-height:40px;">
			
			<td style="text-align:right; margin-top:20px;" colspan="2">
			<a href="${contextPath }/member/register_view.jsp">회원가입</a>
			</td>
		</tr>
	</table>
	</form>
	<div id="div2">
		<h4><a href="#">아이디와 비밀번호를 잃어버리셨나요?</a></h4>
	</div>
</div>
</c:when>
<c:otherwise>
 <script type="text/javascript">
 	alert("[  ${loginUser}  ]님은 이미 로그인한 사용자 입니다.")
 	location.href="${contextPath}/default/main.jsp";
 </script>
</c:otherwise>
</c:choose>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>