package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.AdminDAO;
import com.board.domain.CategoryVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.GoodsVO;
import com.board.domain.OrderListVO;
import com.board.domain.OrderVO;
import com.board.domain.ReplyListVO;
@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	@Override
	public List<CategoryVO> category() throws Exception {
		
		return dao.category();
	}
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
		
	}
	//상품 목록 조회
	@Override
	public List<GoodsJoinCate> goodslist() throws Exception{
		return dao.goodslist();
	}
	
	//특정 상품 조회
	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		 dao.goodsModify(vo);
	}

	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
	
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	public List<OrderListVO> orderView(OrderVO order)throws Exception{
		return dao.orderView(order);
	}
	
	public void deliveryChange(OrderVO order) throws Exception{
		dao.deliveryChange(order);
	}
	
	public void changeStock(GoodsVO vo) throws Exception{
		dao.changeStock(vo);
	}
	public List<ReplyListVO> allReply() throws Exception{
		return dao.allReply();
		
	}

	public void deleteReply(int repNum) throws Exception{
		dao.deleteReply(repNum);
	}
}
