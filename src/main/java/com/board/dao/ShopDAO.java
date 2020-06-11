package com.board.dao;

import java.util.List;

import com.board.domain.CartListVO;
import com.board.domain.CartVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.OrderDetailVO;
import com.board.domain.OrderVO;
import com.board.domain.ReplyListVO;
import com.board.domain.ReplyVO;

public interface ShopDAO {

	public List<GoodsJoinCate> list(int cateCode,int cateCodeRef) throws Exception;
	public List<GoodsJoinCate> list(int cateCode) throws Exception;
	
	public GoodsJoinCate goodsView(int gdsNum) throws Exception;
	
	public void registerReply(ReplyVO reply)throws Exception;
	
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	
	public void deleteReply(ReplyVO reply) throws Exception;
	public String idCheck(int repNum) throws Exception;
	
	public void modifyReply(ReplyVO reply)throws Exception;
	
	public void addCart(CartVO cart) throws Exception;
	
	public List<CartListVO> cartList(String userId) throws Exception;
	
	public void deleteCart(CartVO cart) throws Exception;
	
	public void addOrder(OrderVO order) throws Exception;
	
	public void addOrder_detail(OrderDetailVO orderDetail) throws Exception;
}
