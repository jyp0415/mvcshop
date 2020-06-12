package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ShopDAO;
import com.board.domain.CartListVO;
import com.board.domain.CartVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.OrderDetailVO;
import com.board.domain.OrderListVO;
import com.board.domain.OrderVO;
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

		if (level == 1) { // lavel 1 = 1차 분류.

			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			// 두가지 모두 cateCode로 해도 무관

		} else {// lavel 2 = 2차 분류

			return dao.list(cateCode);

		}

	}

	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	@Override
	public void registerReply(ReplyVO reply) throws Exception {
		dao.registerReply(reply);
	}

	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}

	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	// 댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}

	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	// 주문정보 전송 및 상세 정보 전송
	public void addOrder(OrderVO order) throws Exception {
		dao.addOrder(order);
	}

	public void addOrder_detail(OrderDetailVO orderDetail) throws Exception {
		dao.addOrder_detail(orderDetail);
	}

	public void deleteAllCart(String userId) throws Exception {
		dao.deleteAllCart(userId);
	}

	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	
}
