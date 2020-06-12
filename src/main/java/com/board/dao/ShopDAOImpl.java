package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.CartListVO;
import com.board.domain.CartVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.OrderDetailVO;
import com.board.domain.OrderListVO;
import com.board.domain.OrderVO;
import com.board.domain.ReplyListVO;
import com.board.domain.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession sql;

	private static String namespace = "com.board.mappers.shopMapper";

	@Override
	public List<GoodsJoinCate> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	@Override
	public List<GoodsJoinCate> list(int cateCode, int cateCodeRef) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);

		System.out.println("list" + map.get("cateCode"));
		return sql.selectList(namespace + ".list_1", map);

	}

	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}

	// 댓글 등록
	@Override
	public void registerReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registerReply", reply);

	}

	// 댓글 목록
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", gdsNum);
	}

	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}

	public String idCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".checkIdReply", repNum);
	}

	// 댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
	}

	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	public void addOrder(OrderVO order) throws Exception{
		sql.insert(namespace+".orderInfo",order);
	}

	public void addOrder_detail(OrderDetailVO orderDetail) throws Exception{
		sql.insert(namespace+".orderDetail",orderDetail);
	}
	
	//카트 삭제
	public void deleteAllCart(String userId) throws Exception{
		System.out.println("dao"+userId);
		sql.delete(namespace+".deleteAllCart",userId);
	}
	
	public List<OrderVO> orderList(OrderVO order)throws Exception{
		return sql.selectList(namespace+".orderList",order);
	}
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace+".orderView",order);
	}
}
