package com.dream.cinema.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.dream.cinema.vo.MemberVO;

public interface MemberService {

	
	ArrayList<MemberVO> getAllMember() throws Exception;

	void insertMember(MemberVO memberVO);

	int checkId(String m_email);

	int checkNick(String m_nick);
	
	MemberVO memberLogin(@Param("m_email")String m_email, @Param("m_pw")String m_pw);
}
