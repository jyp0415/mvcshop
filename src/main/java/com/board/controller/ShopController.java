package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.GoodsJoinCate;
import com.board.service.ShopService;
@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Inject
	ShopService service;
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
					@RequestParam("l") int level, Model model) throws Exception{
		List<GoodsJoinCate> list= null;
		list = service.list(cateCode, level);
		model.addAttribute("list",list);
		
		
	}
}
