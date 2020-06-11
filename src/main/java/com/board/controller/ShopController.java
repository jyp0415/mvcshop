package com.board.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.CartListVO;
import com.board.domain.CartVO;
import com.board.domain.GoodsJoinCate;
import com.board.domain.MemberVO;
import com.board.domain.OrderDetailVO;
import com.board.domain.OrderVO;
import com.board.domain.ReplyListVO;
import com.board.domain.ReplyVO;
import com.board.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Inject
	ShopService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		List<GoodsJoinCate> list = null;
		list = service.list(cateCode, level);
		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {

		// 상품 상세정보 카테고리+상품
		GoodsJoinCate view = service.goodsView(gdsNum);
		model.addAttribute("view", view);

		// 상품 댓글도 함께 가져오기
		// List<ReplyListVO> reply = service.replyList(gdsNum);
		// model.addAttribute("reply", reply); //필요없음 ajax 로 가져옴
	}

	// 상품 조회 - 소감(댓글) 작성
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());

		service.registerReply(reply);

		return "redirect:/shop/view?n=" + reply.getGdsNum();
	}

	// (댓글) 목록 불러오기
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {

		List<ReplyListVO> reply = service.replyList(gdsNum);

		return reply;
	}

	// 소감작성
	// (댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registerReply(ReplyVO reply, HttpSession session) throws Exception {

		System.out.println("ajax controller 댓글 작성" + reply.getGdsNum() + " " + reply.getRepCon());
		MemberVO member = (MemberVO) session.getAttribute("member");

		reply.setUserId(member.getUserId());

		service.registerReply(reply);
	}

	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());

		if (member.getUserId().equals(userId)) {

			reply.setUserId(member.getUserId());
			service.deleteReply(reply);

			result = 1;
		}

		return result;
	}

	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());

		if (member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			service.modifyReply(reply);
			result = 1;
		}

		return result;
	}

	// 카트 담기 ajax
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			result = 1;
		}

		return result;
	}

	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);

	}

	// 카트 선택 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		int result = 0;
		int cartNum = 0;

		if (member != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	// 주문
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {

	 
	 MemberVO member = (MemberVO)session.getAttribute("member");  
	 String userId = member.getUserId();
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOrderId(orderId);
	 order.setUserId(userId);
	 service.addOrder(order);
	 orderDetail.setOrderId(orderId);   
	 service.addOrder_detail(orderDetail);
	 
	 //service.cartAllDelete(userId);
	 return "redirect:/";
	 //return "redirect:/shop/orderList";  
	}

}
