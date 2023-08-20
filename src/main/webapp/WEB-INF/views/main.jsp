<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="Path" value="${pageContext.request.contextPath}/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%String msg = (String)request.getAttribute("msg"); %>

<script src="${Path}resources/js/slide.js"></script>
<link rel="stylesheet" href="${Path}css/slide.css" />
<link rel="stylesheet" href="${Path}css/main.css" />
<style>
.main_main{
padding-top: 160px;
}
</style>
</head>
<body>
<script>
let msg='<%=msg%>';
   if(msg!='null'){
      alert(msg);
   }
</script>



  <header><%@ include file="header.jsp" %></header>
    <header><%@ include file="header2.jsp" %></header>
<header><%@ include file="header3.jsp" %></header>
<main class="main_main">

<div class="slide slide_wrap">
	<div class="slide_item item1">
	<a href="#"><img  class="slideimg" src="${Path}img/lego.jpg"></a>
	</div>
	<div class="slide_item item2">
	<a href="#"><img  class="slideimg" src="${Path}img/nike.jpg"></a>	
	</div>
    <div class="slide_item item3">
    <a href="#"><img  class="slideimg" src="${Path}img/phone.jpg"></a>
	</div>
	<div class="slide_item item4">
    <a href="#"><img  class="slideimg" src="${Path}img/red.jpg"></a>
	</div>
	<div class="slide_item item5">
    <a href="#"><img  class="slideimg" src="https://www.lego.com/cdn/cs/set/assets/blt5f2988ecb99157e2/42159.png?format=webply&fit=bounds&quality=70&width=800&height=800&dpr=1.5"></a>
	</div>
    <div class="slide_prev_button slide_button">◀</div>
    <div class="slide_next_button slide_button">▶</div>
    <ul class="slide_pagination"></ul>
  </div>
  <br><br><br><br>
<%--   <table class="maintable1" >
  <tr>
  <td ><a href="#"><img  class="tableimg1" src="${Path}img/dream-drow1.png"></a></td>
   <td ><a href="#"><img  class="tableimg1" src="${Path}img/seleb-pick1.png"></a></td>
   <td ><a href="#"><img  class="tableimg1" src="${Path}img/dream-drow.png"></a></td>
  </tr>

  </table>
  <br><br> --%>
  
  
  <div>
        <table class="maintable2"  border="2">
   <tr><td colspan="5"><span class="just1">인기영화</span><br>
   <span class="just2">박스오피스10위</span>
   </td></tr>
  <tr>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/phone1.jpg"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/truck.jpg"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
    
  </tr>
  <tr>
  	<td class="maintd1">Dior</td>
   <td class="maintd1">Nike</td>
   <td class="maintd1">Lego</td>
   <td class="maintd1">Adidas</td>
   <td class="maintd1">Dior</td>
  </tr>
    <tr>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/phone1.jpg"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/truck.jpg"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
   <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
     <td class="maintd2"><a href="#"><img  class="tableimg3" src="${Path}img/dream-drow.png"></a></td>
  </tr>
  <tr>
  <td class="maintd1">Dior</td>
   <td class="maintd1">Nike</td>
   <td class="maintd1">Lego</td>
   <td class="maintd1">Adidas</td>
   <td class="maintd1">Sony</td>
  </tr>
  </table>
  </div>
  	<br><br><br><br>
  <hr class="mainhr">
 	<br><br><br><br>
  <div>
  
  
   <div>
        <table class="maintable2" >
   <tr><td colspan="4"><span class="just1">이밴트</span><br>
   <span class="just2"></span>
   </td></tr>
  <tr>
   <td class="maintd101"><a href="#"><img  class="tableimg101" src="${Path}img/popcon.png"></a></td>
   <td class="maintd101"><a href="#"><img  class="tableimg101" src="${Path}img/facebook.jpg"></a></td>
   <td class="maintd102"><a href="#"><img  class="tableimg103" src="${Path}img/birthday.jpg"></a></td>
   <td class="maintd103" rowspan="3"><a href="#"><img  class="tableimg104" src="${Path}img/sale.png"></a></td>
  
  </tr>
  <tr></tr>
    <tr>
   <td class="maintd201" colspan="2"><a href="#">imsi<img  class="tableimg3" src="#"></a></td>
   <td class="maintd202" ><a href="#">imsi<img  class="tableimg3" src="#"></a></td>


   </tr>
    </table>
  </div>
  <br><br>
    <table class="maintable2"  border="2">
   <tr><td colspan="4"><span class="just1">시사회/무대인사</span><br>
   </td></tr>
  <tr>
   <td class="maintd"><a href="#">1</a></td>
	<td class="maintd"><a href="#">1</a></td>   
	<td class="maintd"><a href="#">1</a></td>
	<td class="maintd"><a href="#">1</a></td>
  </tr>
  <tr>
   <td class="maintd1">Dior<br>phone case<br>100,000</td>
   <td class="maintd1">Lego<br>truck<br>130,000</td>
   <td class="maintd1"></td>
   <td class="maintd1"></td>
  </tr>
  </table>
  </div>


  
<!--     <div>
    <table class="maintable3"  border="2">
   <tr><td colspan="4"><span class="just1">안내?</span><br>
   
   </td></tr>
  <tr>
   <td class="maintd"><a href="#"><img  class="tableimg2" src="img/sony.jpg"></a></td>
   <td class="maintd"><a href="#"><img  class="tableimg2" src="img/truck.jpg"></a></td>
   <td class="maintd"><a href="#"><img  class="tableimg2" src="img/dream-drow.png"></a></td>
   <td class="maintd"><a href="#"><img  class="tableimg2" src="img/dream-drow.png"></a></td>
  </tr>

  </table>
  </div> -->
  
    

  	<br><br><br><br>
  	 <table class="maintable4"  >
   <tr><td width="100">공지사항</td><td>내용 들어가야함</td></tr>
  </table>
  <hr class="mainhr">
 	<br><br><br><br>

  
</main>
 <footer><%@ include file="footer.jsp" %></footer>
</body>
</html>