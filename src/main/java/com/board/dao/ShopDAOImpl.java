package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.GoodsJoinCate;
import com.board.domain.ReplyListVO;
import com.board.domain.ReplyVO;
@Repository
public class ShopDAOImpl implements ShopDAO {

	@Inject
	SqlSession sql;
	
	private static String namespace="com.board.mappers.shopMapper";
	@Override
	public List<GoodsJoinCate> list(int cateCode) throws Exception {
		return sql.selectList(namespace+".list_2",cateCode);
	}
	
	@Override
	public List<GoodsJoinCate> list(int cateCode,int cateCodeRef) throws Exception{
		HashMap<String, Object> map =new HashMap<String, Object>();
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		System.out.println("list"+map.get("cateCode"));
		return sql.selectList(namespace+".list_1",map);
		
		
	}
	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace+".goodsView",gdsNum);
	}
	//댓글 등록
	@Override
	public void registerReply(ReplyVO reply)throws Exception{
		sql.insert(namespace+".registerReply",reply);
		
	}
	
	//댓글 목록
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace+".replyList",gdsNum);
	}
	public void deleteReply(ReplyVO reply) throws Exception{
		sql.delete(namespace+".deleteReply",reply);
	}
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace+".checkIdReply",repNum);
	}
	
}
