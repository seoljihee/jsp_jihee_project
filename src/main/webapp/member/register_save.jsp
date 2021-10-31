<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO1"/>
<jsp:useBean id="dto" class="com.care.root.member.dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="result" value="${dao.memberSave(dto)}"/>

<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			alert("회원가입이 완료 되었습니다. 로그인 후 이용해 주세요!!")
			location.href="${contextPath}/login/Login.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("존재하는 아이디 입니다.")
			location.href="${contextPath}/member/register_view.jsp";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>