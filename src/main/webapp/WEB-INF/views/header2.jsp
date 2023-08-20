<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath}/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 헤더</title>
<%-- <script src="${pageContext.request.contextPath }/resources/js/aa.js"></script> --%>
<link rel="stylesheet" href="${Path}css/header_style2.css" />

</head>
<body>
<header class="he2">



    <nav class="headnav2">
       <a href="#">멤버십</a>
        <a href="#">고객센터</a>
    
    	
    	
     
<%-- loginsession에서 MemberLogin 객체를 가져옴 --%>
<c:set var="memberLogin" value="${loginsession}" />
<%-- 로그인 상태에 따라 출력하는 내용 분기 처리 --%>

<%-- 로그인 상태에 따라 출력하는 내용 분기 처리 --%>
<c:choose>
    <c:when test="${empty memberLogin}">
        <a href="login.do" class="log-in-out">로그인</a>
    </c:when>
    <c:otherwise>
        <a href="logout.do" class="log-in-out">로그아웃</a>
    </c:otherwise>
</c:choose>

    </nav>






</header>

</body>
</html>