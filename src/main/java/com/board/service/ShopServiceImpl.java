package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ShopDAO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.ReplyListVO;
import com.board.domain.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Inject
	private ShopDAO dao;
	// 카테고리별 상품 리스트
	@Override
	public List<GoodsJoinCate> list(int cateCode, int level) throws Exception {
	 
	 int cateCodeRef = 0; // 카테고리 참조 코드. 없어도 무관
	 
	 if(level == 1) { // lavel 1 = 1차 분류.
	  
	  cateCodeRef = cateCode;
	  return dao.list(cateCode, cateCodeRef);
	  // 두가지 모두 cateCode로 해도 무관
	  
	 } else {// lavel 2 = 2차 분류
	  
	  return dao.list(cateCode);
	  
	 }
	 
	}
	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void registerReply(ReplyVO reply)throws Exception{
		dao.registerReply(reply);
	}

	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	public void deleteReply(ReplyVO reply) throws Exception{
		dao.deleteReply(reply);
	}
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
	
	//댓글 수정
	public void modifyReply(ReplyVO reply)throws Exception{
		dao.modifyReply(reply);
	}
}
