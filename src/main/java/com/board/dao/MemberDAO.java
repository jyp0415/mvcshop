package com.board.dao;

import com.board.domain.MemberVO;

public interface MemberDAO {

	public void signup(MemberVO vo) throws Exception;
	
	public MemberVO signin(MemberVO vo) throws Exception;
}
