package com.board.service;

import java.util.List;

import com.board.domain.CategoryVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.GoodsVO;
import com.board.domain.OrderListVO;
import com.board.domain.OrderVO;
import com.board.domain.ReplyListVO;

public interface AdminService {

	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo)throws Exception;
	
	public List<GoodsJoinCate> goodslist() throws Exception;
	
	public GoodsJoinCate goodsView(int gdsNum) throws Exception;
	public void goodsModify(GoodsVO vo) throws Exception;
	public void goodsDelete(int gdsNum) throws Exception;
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order)throws Exception;
	public void deliveryChange(OrderVO order) throws Exception;
	public void changeStock(GoodsVO vo) throws Exception;
	public List<ReplyListVO> allReply() throws Exception;

	public void deleteReply(int repNum) throws Exception;
}
