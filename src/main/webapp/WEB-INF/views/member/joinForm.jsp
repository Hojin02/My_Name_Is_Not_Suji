<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join.css" />

<style>
#checkId , #checkNick{
  width: 120px;
  height: 27px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
  right: 38%;
position: absolute;
margin-top: 0px;

}

.E-mailJ{
font-size: 17px;
font-weight: bold;

}

#result_checkId{
width: 250px;
}
</style>
</head>
<body>

            
<script>
$(document).ready(function() {
  $("#checkId").click(function() {
    var m_email = $("#m_email").val();
    if (m_email === "") {
      $("#result_checkId").html("ID를 입력하세요.");
      return;
    }
    
    var emailvalcheck = /^[a-zA-Z0-9._-]{3,}@[a-zA-Z0-9.-]{3,}\.[a-zA-Z]{2,4}$/;
    if (!emailvalcheck.test(m_email)) {
      $("#result_checkId").html("유효한 E-mail 주소를 입력하세요. ");
      return;
    }
    
    $.ajax({
      type: "POST",
      url: "checkId.do", // 실제 사용되는 서버 엔드포인트로 수정
      data: { m_email: m_email },
      success: function(data) {
        if (data === "available") {
          $("#result_checkId").html("사용 가능한 ID입니다.");
        } else {
          $("#result_checkId").html("이미 사용 중인 ID입니다.");
        }
      },
      error: function() {
        $("#result_checkId").html("ID 중복 확인 중 오류가 발생했습니다.");
      }
    });
  });
});
</script>


<script>


	function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var m_pw = document.getElementById('m_pw');					//비밀번호 
		var m_pwck = document.getElementById('m_pwck');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#119c5b";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(m_pw.value == m_pwck.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}
</script>


            
<script>
$(document).ready(function() {
  $("#checkNick").click(function() {
    var m_nick = $("#m_nick").val();
    if (m_nick === "") {
      $("#result_checkNick").html("NICK을 입력하세요.");
      return;
    }

    $.ajax({
      type: "POST",
      url: "checkNick.do", // 실제 사용되는 서버 엔드포인트로 수정
      data: { m_nick: m_nick },
      success: function(data) {
        if (data === "available1") {
          $("#result_checkNick").html("사용 가능한 NICK 입니다.");
        } else {
          $("#result_checkNick").html("이미 사용 중인 NICK 입니다.");
        }
      },
      error: function() {
        $("#result_checkNick").html("NICK 중복 확인 중 오류가 발생했습니다.");
      }
    });
  });
});
</script>




<header><%@ include file="../header.jsp" %></header>
    <header><%@ include file="../header2.jsp" %></header>
  <form action="memberjoin.do" class="wrap"  method="post">
   
        <div class="Minsert">
       
           <span class="Mjoin">Join</span>
          <br><br>
            <div class="join">
                <span class="E-mailJ">E-mail</span>&nbsp;&nbsp;
                <span id="result_checkId" style="font-size:12px;"></span>  
                <input type="button" id="checkId" value="중복검사" ><br><br>
				<input type="email" name="m_email" id="m_email" placeholder="abc@abc.com">

            </div>
         
            <div class="join">
                <h4>Password</h4> 
                <input type="password" name="m_pw" id="m_pw"  onkeyup="passConfirm()" placeholder="비밀번호">
            </div>
      <div class="join"><br>												
                <span class="E-mailJ">PasswordCheck</span>&nbsp;&nbsp;&nbsp;
                <!-- 비밀번호 체크 하는 ajax -->
                <span id="confirmMsg"></span><br><br>
                <input type="password" name="m_pwck" id="m_pwck" onkeyup="passConfirm()" placeholder="비밀번호확인">
            </div>
          <br>
          <div class="join">
                <span class="E-mailJ">Nick</span>&nbsp;&nbsp;
                <span id="result_checkNick" style="font-size:12px;"></span>  
                <input type="button" id="checkNick" value="중복검사" ><br><br>
                <input type="text" name="m_nick" id="m_nick"  >
            </div>
          
           <div class="join">
                <h4>Name</h4>
                <input type="text" name="m_name" id=""  >
            </div>
     <!--  readonly -->
          <div class="join">
                <h4>Tel</h4>
                <input type="text" name="m_tel" id=""  >
            </div>
          <div class="join">
                <h4>BirthDay</h4>
                <input type="text" name="m_birth" id=""  >
            </div>
          
          
          
  <div class="join">
                <h4>Gender</h4>
            </div>        
<div class="check_joins">
<span class="check_wrap">
  <input type="radio" name="m_gender" id="check_btn_m" value="남자"/>
  <label for="check_btn_m"><span>남자</span></label>
</span>

<span class="check_wrap">
  <input type="radio" name="m_gender" id="check_btn_f" value="여자"/>
  <label for="check_btn_f"><span>여자</span></label>
          </span>

          </div>
     
          
          
          <div class="submit">
                <input type="submit" value="join">
            </div>
          

        </div>
    </form>

 <footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>