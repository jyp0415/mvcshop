package com.board.service;

import java.util.List;

import com.board.domain.GoodsJoinCate;

public interface ShopService {


	public List<GoodsJoinCate> list(int cateCode,int level) throws Exception;
}
