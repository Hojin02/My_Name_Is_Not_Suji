package com.dream.cinema.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dream.cinema.service.MemberService;
import com.dream.cinema.service.dao.MemberDAO;
import com.dream.cinema.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired // 생성자
	private MemberDAO memberdao;
	
	@Autowired 
	private BCryptPasswordEncoder pwEn;
	
	
	@Transactional
	public ArrayList<MemberVO> getAllMember() {
		return memberdao.getAllMember();
	}



	@Override
	public void insertMember(MemberVO memberVO) {
		memberVO.setM_pw(pwEn.encode(memberVO.getM_pw()));
		memberdao.insertMember(memberVO);
	}




	public int checkId(String m_email) {
		  return memberdao.checkId(m_email);
		}

	public int checkNick(String m_nick) {
		  return memberdao.checkNick(m_nick);
		}

	@Override
	public MemberVO memberLogin(String m_email, String m_pw) {
		MemberVO memberVO = memberdao.memberLogin(m_email, m_pw);

		if (memberVO == null) {
			// db에 없는 정보
			return null;
		} else if (!pwEn.matches(m_pw, memberVO.getM_pw())) {
			// DB에 비밀번호와 입력한 비밀번호가 다를 경우
			return null;
		} else {
		
			return memberVO;
		}
	}

}
