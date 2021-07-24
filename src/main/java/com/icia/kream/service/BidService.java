package com.icia.kream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.dao.BidDAO;
import com.icia.kream.dao.ProductDAO;
import com.icia.kream.dto.BidDTO;
import com.icia.kream.dto.PageDTO;
import com.icia.kream.dto.ProductDTO;

@Service
public class BidService {

	@Autowired
	private BidDAO bdao;
	private ModelAndView mav;

	@Autowired
	private ProductDAO pdao;

	@Autowired
	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 5;

	// 구매 입찰 페이지 이동 + 구매 입찰 리스트 출력
	public ModelAndView bidPage(int pnumber, int page) {
		System.out.println("service + bid : " + pnumber + "+" + page);
		mav = new ModelAndView();
		// 구매 입찰 글 갯수
		int listCount = bdao.ListCount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		System.out.println("paging값" + paging.toString());
		// 구매 입찰 리스트
		List<BidDTO> bidList = bdao.bidPage(paging);
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println("리스트 값 " + bidList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		ProductDTO product = pdao.productView(pnumber);
		mav.addObject("paging", paging);
		mav.addObject("bidList", bidList);
		mav.addObject("product", product);
		mav.setViewName("bid");
		return mav;
	}

	// 구매 입찰 등록하기
	public ModelAndView bidInPut(BidDTO bid, int page, int pnumber) {
		System.out.println("service + bidInPut : " + bid);
		mav = new ModelAndView();
		bdao.bidInPut(bid);
		System.out.println(pnumber);
		mav.setViewName("redirect:/bidpage?pnumber=" + pnumber);
		return mav;
	}

	// 구매 입찰 아이디 중복 확인
	public String bidIdCheck(String bidid) {
		System.out.println("service + bidIdCheck : " + bidid);
		String checkResult = bdao.bidIdCheck(bidid);
		String result = "";
		if (checkResult == null) {
			result = "ok";
		} else {
			result = "no";
		}
		return result;
	}

	// 마이페이지 + 구매 입찰 한 리스트 출력
	public ModelAndView bidListPage(String bidid, int page) {
		System.out.println("service + bidListPage : " + bidid + "+" + page);
		mav = new ModelAndView();
		Map<String, String> bidMap = new HashMap<String, String>();
		// 구매 입찰 글 갯수
		int bidlistCount = bdao.bidListCount(bidid);
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
	//	paging.setStartRow(startRow);
		//paging.setEndRow(endRow);
		System.out.println("paging값" + paging.toString());
		System.out.println("갯수 : "+ bidlistCount);
		String startRow2 = String.valueOf(startRow);
		String endRow2 = String.valueOf(endRow);
		bidMap.put("startRow", startRow2);
		bidMap.put("endRow", endRow2);
		bidMap.put("bidid", bidid);
		System.out.println(bidMap);
		// 구매 입찰 리스트
		List<BidDTO> bididList = bdao.bididPage(bidMap);
		int maxPage = (int) (Math.ceil((double) bidlistCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(bididList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		mav.addObject("paging", paging);
		mav.addObject("bidList", bididList);
		mav.setViewName("bidlist");
		return mav;
	}

	// 구매 입찰 내용 수정 요청
	public ModelAndView bidUpDate(int bidnumber) {
		System.out.println("service + bidUpDate : " + bidnumber);
		mav = new ModelAndView();
		BidDTO bid = bdao.bidUpDate(bidnumber);
		System.out.println(bid);
		mav.addObject("bid", bid);
		mav.setViewName("bidupdate");
		return mav;
	}

	// 구매 입찰 내용 수정
	public ModelAndView bidUpDateProcess(BidDTO bid) {
		System.out.println("service + bidUpDateProcess : " + bid);
		mav = new ModelAndView();
		bdao.bidUpDateProcess(bid);
		mav.addObject("bid", bid);
		mav.setViewName("bidupdate");
		return mav;
	}

	// 구매 입찰 취소
	public ModelAndView bidDelete(int bidnumber) {
		System.out.println("service + bidDelete : " + bidnumber);
		mav = new ModelAndView();
		bdao.bidDelete(bidnumber);
		mav.setViewName("bidlist");
		return mav;
	}

	// 즉시 판매 페이지 이동 + 구매 입찰 리스트 출력
	public ModelAndView askImmediatelyPage(int pnumber, int page) {
		System.out.println("service + bid : " + pnumber + "+" + page);
		mav = new ModelAndView();
		// 구매 입찰 글 갯수
		int listCount = bdao.ListCount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		System.out.println("paging값" + paging.toString());
		// 구매 입찰 리스트
		List<BidDTO> bidList = bdao.bidPage(paging);
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println("리스트 값 " + bidList);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		ProductDTO product = pdao.productView(pnumber);
		mav.addObject("paging", paging);
		mav.addObject("bidList", bidList);
		mav.addObject("product", product);
		mav.setViewName("askdirect");
		return mav;
	}

}
