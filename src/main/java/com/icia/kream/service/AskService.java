package com.icia.kream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.dao.AskDAO;
import com.icia.kream.dao.ProductDAO;
import com.icia.kream.dto.AskDTO;
import com.icia.kream.dto.PageDTO;
import com.icia.kream.dto.ProductDTO;

@Service
public class AskService {

	@Autowired
	private AskDAO adao;
	private ModelAndView mav;

	@Autowired
	private ProductDAO pdao;

	@Autowired
	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 5;

	// 판매 입찰 페이지 이동 + 판매 입찰 리스트 출력
	public ModelAndView askPage(int pnumber, int page) {
		System.out.println("service + ask : " + pnumber + "+" + page);
		mav = new ModelAndView();
		// 판매 입찰 글 갯수
		int listCount = adao.ListCount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		System.out.println("paging값" + paging.toString());
		// 판매 입찰 리스트
		List<AskDTO> askList = adao.askPage(paging);
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(askList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		ProductDTO product = pdao.productView(pnumber);
		mav.addObject("paging", paging);
		mav.addObject("askList", askList);
		mav.addObject("product", product);
		mav.setViewName("ask");
		return mav;
	}

	// 판매 입찰 등록하기
	public ModelAndView askInPut(AskDTO ask, int page, int pnumber) {
		System.out.println("service + askInPut : " + ask);
		mav = new ModelAndView();
		adao.askInPut(ask);
		System.out.println(pnumber);
		mav.setViewName("redirect:/askpage?pnumber=" + pnumber);
		return mav;
	}

	// 판매 입찰 아이디 중복 확인
	public String askIdCheck(String askid) {
		System.out.println("service + askIdCheck : " + askid);
		String checkResult = adao.askIdCheck(askid);
		String result = "";
		if (checkResult == null) {
			result = "ok";
		} else {
			result = "no";
		}
		return result;
	}

	// 마이페이지 + 판매 입찰 한 리스트 출력
	public ModelAndView askListPage(String askid, int page) {
		System.out.println("service + askListPage : " + page);
		mav = new ModelAndView();
		Map<String, String> askMap = new HashMap<String, String>();
		// 판매 입찰 글 갯수
		int askListCount = adao.askListCount(askid);
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
		System.out.println("paging값" + paging.toString());
		System.out.println("갯수 : " + askListCount);
		String startRow2 = String.valueOf(startRow);
		String endRow2 = String.valueOf(endRow);
		askMap.put("startRow", startRow2);
		askMap.put("endRow", endRow2);
		askMap.put("askid", askid);
		System.out.println(askMap);
		// 판매 입찰 리스트
		List<AskDTO> askList = adao.askPage(askMap);
		int maxPage = (int) (Math.ceil((double) askListCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(askList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		mav.addObject("paging", paging);
		mav.addObject("askList", askList);
		mav.setViewName("asklist");
		return mav;
	}

	// 판매 입찰 내용 수정 요청
	public ModelAndView askUpDate(int asknumber) {
		System.out.println("service + askUpDate : " + asknumber);
		mav = new ModelAndView();
		AskDTO ask = adao.askUpDate(asknumber);
		System.out.println(ask);
		mav.addObject("ask", ask);
		mav.setViewName("askupdate");
		return mav;
	}

	// 판매 입찰 내용 수정
	public ModelAndView askUpDateProcess(AskDTO ask) {
		System.out.println("service + askUpDateProcess : " + ask);
		mav = new ModelAndView();
		adao.askUpDateProcess(ask);
		mav.addObject("ask", ask);
		mav.setViewName("askupdate");
		return mav;
	}

	// 판매 입찰 취소
	public ModelAndView bidDelete(int asknumber) {
		System.out.println("service + bidDelete : " + asknumber);
		mav = new ModelAndView();
		adao.askDelete(asknumber);
		mav.setViewName("asklist");
		return mav;
	}

	// 즉시 구매 페이지 이동 + 판매 입찰 리스트 출력
	public ModelAndView bidImmediatelyPage(int pnumber, int page) {
		System.out.println("service + bidImmediatelyPage : " + pnumber + "+" + page);
		mav = new ModelAndView();
		// 판매 입찰 글 갯수
		int listCount = adao.ListCount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		System.out.println("paging값" + paging.toString());
		// 판매 입찰 리스트
		List<AskDTO> askList = adao.askPage(paging);
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(askList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		ProductDTO product = pdao.productView(pnumber);
		mav.addObject("paging", paging);
		mav.addObject("askList", askList);
		mav.addObject("product", product);
		mav.setViewName("biddirect");
		return mav;
	}

}
