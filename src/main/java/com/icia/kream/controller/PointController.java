package com.icia.kream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.dto.AccountDTO;
import com.icia.kream.dto.MemberDTO;
import com.icia.kream.service.PointService;

@Controller
public class PointController {

	@Autowired
	public PointService ps;
	public ModelAndView mav;

	// 포인트 화면 이동 + 상세 조회
	@RequestMapping(value = "/pointpage")
	public String pointPage() {
		System.out.println("controller + pointpage");
		return "point";
	}

	// 회원 포인트 조회
	@RequestMapping(value = "/pointclient")
	public String pointClinent() {
		System.out.println("controller + pointclient");
		return "pointclient";
	}

	// 포인트 충전 화면 이동
	@RequestMapping(value = "/pointcharge")
	public String pointAccountPage() {
		System.out.println("controller + pointaccountpage");
		return "pointcharge";
	}

	// 포인트 충전
	@RequestMapping(value = "/pointpluspage")
	public ModelAndView pointPlus(@RequestParam("mid") String mid, @RequestParam("maccount") String maccount) {
		System.out.println("controller + pointPlus : " + mid + "+" + maccount);
		String mid_p = mid;
		String maccount_p = maccount;
		mav = new ModelAndView();
		System.out.println("controller + mid_p : " + mid_p);
		System.out.println("controller + maccount_p : " + maccount_p);
		mav.addObject("mid", mid_p);
		mav.addObject("maccount", maccount_p);
		mav.setViewName("pointplus");
		return mav;
	}

	// 포인트 충전 카카오
	@RequestMapping(value = "/pointaccount")
	public ModelAndView pointAccount(@ModelAttribute MemberDTO member, @RequestParam("mid") String mid,
			@ModelAttribute AccountDTO account) {
		System.out.println("controller + pointAccount : " + member + "+" + mid + "+" + account);
		mav = ps.pointAccount(member, mid, account);
		return mav;
	}

	// 포인트 충전 내역 보기
	@RequestMapping(value = "/pointchargelist")
	public ModelAndView pointAccountList(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("mid") String mid) {
		System.out.println("controller + pointAccountList : " + "+" + mid);
		mav = ps.pointAccountList(page, mid);
		return mav;
	}
}
