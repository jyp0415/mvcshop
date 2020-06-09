package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.GoodsJoinCate;
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
	
}
