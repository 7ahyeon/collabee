package com.spring.collabee.view.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@SessionAttributes("orderGoods")
@RestController
@RequestMapping("/order")
public class OrderAjaxController {
	
	@Autowired
	private CartService cartService;
	
	public OrderAjaxController() {
	}
	
	@RequestMapping(value="/cartToOrder.do", method = RequestMethod.POST)
	public int cartToOrder(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam(value = "chbox[]") List<String> list, MemberVO mvo, CartVO cart, OrderVO ovo) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		int productNum = 0;
		if (mvo == null) {
			// 비회원 주문
			if ( session.getAttribute("nmember") == null) {
				cart.setNmemberNum(cookie.getValue());
				ovo.setNmemberNum(cookie.getValue());
			} else {
				ovo = (OrderVO) session.getAttribute("nmember");
				cart.setNmemberNum(ovo.getNmemberNum());
			}
		} else {
			// 회원 주문
			cart.setMemberNum(mvo.getMemberNum());
		}
		List<CartVO> orderGoods = new ArrayList<CartVO>();
		System.out.println("--------카트 정보" + cart.toString());
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			orderGoods.add(cartService.checkCartList(cart));
		}
		System.out.println("-------카트 물건" + orderGoods.toString());
		model.addAttribute("orderGoods", orderGoods);
		return 1;
	}
}