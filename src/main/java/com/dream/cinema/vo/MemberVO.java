package com.dream.cinema.vo;

public class MemberVO {
	

	private String m_email;
	private String m_pw;
	private String m_name;
	private String m_gender;
	private String m_tel;
	private String m_birth;
	private String m_nick;
	private String m_rank;
	
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getM_rank() {
		return m_rank;
	}
	public void setM_rank(String m_rank) {
		this.m_rank = m_rank;
	}
	@Override
	public String toString() {
		return "MemberVO [m_email=" + m_email + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_gender=" + m_gender
				+ ", m_tel=" + m_tel + ", m_birth=" + m_birth + ", m_nick=" + m_nick + ", m_rank=" + m_rank + "]";
	}
	
	
	
	
	
}