<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%String msg = (String)request.getAttribute("msg"); %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />



</head>
<body>

  <script>
let msg='<%=msg%>';
   if(msg!='null'){
      alert(msg);
   }
</script>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
    <header><%@ include file="../header2.jsp" %></header>
  <form action="memberLogin.do" class="wrap"  method="post">
   
        <div class="login">
       
           <span class="log-in">Log-in</span>
          
            <div class="login_id">
                <h4>E-mail</h4>
                <input type="email" name="m_email" id="m_email" placeholder="Email">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="m_pw" id="m_pw" placeholder="Password">
            </div>
          <div class="submit">
                <input type="submit" value="submit">
            </div>
          
            <div class="login_etc">
               <div class="memberinsert_email">
               <a href="join.do" class="login-a"> 이메일가입</a>
            </div>
              
        <span> | </span>

                <div class="forgot_email">
               <a href="" class="login-a">이메일 찾기</a>
            </div>
<span> | </span>

                <div class="forgot_pw">
                <a href="" class="login-a">비밀번호변경</a>
            </div>
              
            </div>
         
          <a href=""><img width="223" class="naverL"
                  src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		   
        </div>
    </form>
 <footer><%@ include file="../footer.jsp" %></footer>

</body>
</html>