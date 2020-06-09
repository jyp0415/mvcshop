package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.CategoryVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.GoodsVO;
import com.board.service.AdminService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;
	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 상품 가져오기 json 데이터로 가져오고 뿌려주자 
	// 상품등록을 눌렀을때 1차 분류 2차 분류 가져오기 
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");

		List<CategoryVO> category = null;
		category = adminService.category();
		
		
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@RequestMapping(value="/goods/register",method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo) throws Exception{
		adminService.register(vo);
		return "redirect:/admin/index";
	}
	//상품 목록 보기 
	@RequestMapping(value="/goods/list",method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception{
		logger.info("get /goods/list");
		
		List<GoodsVO> list = adminService.goodslist();
		
		model.addAttribute("list",list);
	}
	//특정 상품 조회
	@RequestMapping(value="/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum,Model model) throws Exception{
		//url 에서 n 의 값을 찾아서 gdsnum 에 대입 
		logger.info("get /goods/view");
		
		GoodsJoinCate goods=adminService.goodsView(gdsNum);
		model.addAttribute("goods",goods);
	}
	
	//상품 수정
	@RequestMapping(value="/goods/modify",method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("gdsNum") int gdsNum,Model model) throws Exception{
		//modify의 form 태그의 name 에서 gdsNum 을 가져온다
		logger.info("get /goods/modify");
		
		GoodsJoinCate goods=adminService.goodsView(gdsNum);
		System.out.println("goods catecode"+goods.getCateCode());
		System.out.println("goods catecoderef"+goods.getCateCodeRef());
		model.addAttribute("goods",goods);
		
		List<CategoryVO> category =null;
		category = adminService.category();
		model.addAttribute("category",JSONArray.fromObject(category));
	}
	
	//상품 수정
	@RequestMapping(value="/goods/modify",method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo) throws Exception{
		System.out.println("수정 "+ vo.getGdsDes());
		System.out.println("수정 gdsnum : "+ vo.getGdsNum()); //modify에서 form에 hidden name 값이 gdsNum 이어야 한다.
		adminService.goodsModify(vo);
		
		return "redirect:/admin/index";
	}
	//상품 삭제
	@RequestMapping(value="/goods/delete",method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception{
		adminService.goodsDelete(gdsNum);
		
		return "redirect:/admin/index";
	}
	
}
