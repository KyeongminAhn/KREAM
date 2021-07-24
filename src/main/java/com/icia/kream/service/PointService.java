package com.icia.kream.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.icia.kream.dao.PointDAO;
import com.icia.kream.dto.AccountDTO;
import com.icia.kream.dto.MemberDTO;
import com.icia.kream.dto.PageDTO;
import com.icia.kream.dto.QuestionDTO;

@Service
public class PointService {

	@Autowired
	public PointDAO pdao;
	public ModelAndView mav;
	
	@Autowired
	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 5;
	
	// 포인트 충전
		public ModelAndView pointAccount(MemberDTO member, String mid, AccountDTO account) {
			System.out.println("service + pointAccount : " + member + "+" + mid);
			mav = new ModelAndView();
			// MEMBER 테이블 포인트 추가
			int memberResult = pdao.pointAccount(member);
			// ACCOUNT 테이블 데이터 추가
			int accountResult = pdao.pointAccountPlus(account);
			// MEMBER 테이블 MID account 조회
			MemberDTO memberPoint = pdao.memberPoint(mid);
			mav.addObject("member", memberPoint);
			mav.setViewName("point");
			return mav;
		}

		// 포인트 충전 내역
		public ModelAndView pointAccountList(int page, String mid) {
			System.out.println("service + pointAccountList : " + "+" + page);
			mav = new ModelAndView();
			// 포인트 충전 내역 갯수 체크
			int listCount = pdao.ListCount(mid);
			System.out.println("listCount 값 : " + listCount);
			int startRow = (page - 1) * PAGE_LIMIT + 1;
			int endRow = page * PAGE_LIMIT;
			PageDTO paging = new PageDTO();
			paging.setStartRow(startRow);
			paging.setEndRow(endRow);
			System.out.println("paging값" + paging.toString());
			// 포인트 충전 내역 
			Map<String, String> searchMap = new HashMap<String, String>();
			searchMap.put("mid", mid);
			String startRow2 = String.valueOf(startRow);
			String endRow2 = String.valueOf(endRow);
			searchMap.put("startRow", startRow2);
			searchMap.put("endRow", endRow2);
			List<AccountDTO> accountlist= pdao.pointAccountList(searchMap);
			int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
			int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
			int endPage = startPage + BLOCK_LIMIT - 1;
			if (endPage > maxPage) {
				endPage = maxPage;
			}
			System.out.println(accountlist);
			paging.setPage(page);
			paging.setStartPage(startPage);
			paging.setEndPage(endPage);
			paging.setMaxPage(maxPage);
			mav.addObject("paging", paging);
			mav.addObject("accountList", accountlist);
			mav.setViewName("pointchargelist");
			return mav;
		}
		
}
