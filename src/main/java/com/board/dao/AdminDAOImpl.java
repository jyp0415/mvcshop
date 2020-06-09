package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.CategoryVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.GoodsVO;
@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.adminMapper";
	@Override
	public List<CategoryVO> category() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".category");
	}
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register",vo);
		
	}
	//상품목록
	@Override
	public List<GoodsJoinCate> goodslist() throws Exception {
		return sql.selectList(namespace+".goodslist");
	}
	@Override
	public GoodsJoinCate goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace+".goodsView",gdsNum);
	}
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		System.out.println("dao 수정"+vo.getGdsDes());
		
		sql.update(namespace+".goodsModify",vo);
		
	}
	
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete(namespace+".goodsDelete",gdsNum);
	}
}
