package com.dream.cinema;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dream.cinema.service.MemberService;
import com.dream.cinema.vo.MemberVO;
@Controller
public class MemberController {


	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	
	//메인페이지로 이동
    @RequestMapping("/main.do")
    public String MainPage(HttpSession session,Model model) {
    	String msg=(String)session.getAttribute("msg");//세션 msg메세지 가져감
    	model.addAttribute("msg", msg); //msg 는 msg
    	session.removeAttribute("msg"); 
        return "main"; 
    }
    
	@RequestMapping("/login.do")
	public String LoginPage() {
		return "/member/loginForm";
	}
	
	@RequestMapping("/join.do")
	public String JoinPage() {
		return "/member/joinForm";
	}

	
	@RequestMapping(value = "/memberjoin.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute("memberVO") MemberVO memberVO, Model model) {
		memberService.insertMember(memberVO);
		model.addAttribute("msg", memberVO.getM_nick	() + " 님 회원가입 환영합니다.");
		return "/member/loginForm";
	}
	

	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam("m_email") String m_email) {
	  int count = memberService.checkId(m_email);
	  if (count > 0) { // 비교했는데 1개이상 있는경우
	    return "taken"; //ID 이미 있는
	  } else {
	    return "available"; // ID 사용가능 checkNick
	  }
	}
	
	@RequestMapping(value = "/checkNick.do", method = RequestMethod.POST)
	@ResponseBody
	public String checkNick(@RequestParam("m_nick") String m_nick) {
	  int count = memberService.checkNick(m_nick);
	  if (count > 0) { // 비교했는데 1개이상 있는경우
	    return "taken"; //ID 이미 있는
	  } else {
	    return "available1"; // ID 사용가능 checkNick
	  }
	}
	
	
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(@RequestParam("m_email") String m_email, @RequestParam("m_pw") String m_pw, Model model,
	        HttpServletRequest request) throws Exception {

	    // MemberService를 통해 회원 로그인 처리
	    MemberVO MemberLogin = memberService.memberLogin(m_email, m_pw);
	    if (MemberLogin != null) {
	        // 로그인 성공 시 MemberVO 객체를 모델에 추가하여 View에서 사용 가능하도록 함
	        model.addAttribute("MemberLogin", MemberLogin);
	        System.out.println("통과");
	        // 로그인 성공 시 세션에 회원 정보 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("loginsession", MemberLogin);
	        System.out.println("통과");
	        // 로그인 성공 메시지를 모델에 추가
	        model.addAttribute("msg", MemberLogin.getM_nick() + " 님 로그인 환영합니다");
	        System.out.println(MemberLogin.getM_email());
	        // 로그인 성공 시 "main" 페이지로 이동
	        return "main"; // 로그인 성공 페이지로 이동
	    } else {
	        // 로그인 실패 메시지를 모델에 추가
	        model.addAttribute("error", "로그인 실패");
	        System.out.println("에러3");
	        // 로그인 실패 시 "member/loginForm" 페이지로 이동
	        return "member/loginForm"; // 로그인 실패 시 다시 로그인 페이지로 이동
	    }
	}

	//로그아웃
	@RequestMapping("/logout.do")
	public String LogoutPage(HttpSession session) {
		session.removeAttribute("loginsession");
		return "redirect:/main.do";
	}
	
}
