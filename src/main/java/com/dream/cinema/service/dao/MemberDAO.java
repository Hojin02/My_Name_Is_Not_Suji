package com.dream.cinema.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


import com.dream.cinema.vo.MemberVO;

public interface MemberDAO {

	ArrayList<MemberVO> getAllMember();
	
	void insertMember(MemberVO memberVO);

	int checkId(String m_email);

	int checkNick(String m_nick);
	
	MemberVO memberLogin(@Param("m_email") String m_email,@Param("m_pw") String m_pw);
}
