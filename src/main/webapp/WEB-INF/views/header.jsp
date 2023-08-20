<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">




<title>나는 헤더</title>

<link rel="stylesheet" href="${Path}css/header_style.css" />

</head>

<body>
	<header class="he1">
		<a href="main.do"><img class="Headlogo"
			src="${Path}img/DREAMLOGO1.jpg"></a>
		<nav class="headnav">

			<!-- 로그인한 사용자 정보를 가져오기 -->
			<c:set var="memberLogin" value="${loginsession}" />
			
		
			<c:choose>
				
				<c:when test="${empty memberLogin}">
					<a href="join.do" class="aa"><img class="headmember"
						src="${Path}img/member.png">회원가입</a>
				</c:when>
				
				<c:otherwise>
					<c:choose>
						<c:when test="${memberLogin.m_email eq 'ilovesi79@naver.com'}">
							<a href="admin.do" class="aa"><img class="headmember"
								src="${Path}img/member.png">관리자 정보</a>
						</c:when>
					
						<c:otherwise>
							<a href="mypage.do" class="aa"><img class="headmember"
								src="${Path}img/member.png">내 정보</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
			
			
			<a href="#" class="aa"><img class="headmember"
				src="${Path}img/ticket1.png">바로예매</a> <a href="#">SHOP</a> <span
				class="Headsearch"> <img class="HeadsearchD"
				src="${Path}img/D.png"> <input type="text" name="Headsearch"
				class="Headsearchtext"> <a href="#"><img
					class="HeadsearchSe" src="${Path}img/search.png"></a>
			</span>
		</nav>






	</header>
</body>
</html>
