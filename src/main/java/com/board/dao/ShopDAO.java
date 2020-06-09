package com.board.dao;

import java.util.List;

import com.board.domain.GoodsJoinCate;

public interface ShopDAO {

	public List<GoodsJoinCate> list(int cateCode,int cateCodeRef) throws Exception;
	public List<GoodsJoinCate> list(int cateCode) throws Exception;
	
	
}
