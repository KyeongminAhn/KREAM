package com.icia.kream.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.dao.MemberDAO;
import com.icia.kream.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	// memberJoin 호출 결과를 받아서 insert 성공 여부에 따라 처리
	public ModelAndView memberJoin(MemberDTO member) {
		mav = new ModelAndView();
		int insertResult = 0;
		insertResult = mdao.memberJoin(member);
		if(insertResult > 0) {
			// insert 성공 => 회원가입 완료 판단 
			mav.setViewName("memberlogin");
		} else { 
			// insert 실패 => 회원가입 실패
			mav.setViewName("joinfail");
		}
		
		return mav;
	}
	
	// ID 중복확인
	public String idCheck(String mid) {
		String idResult = mdao.idCheck(mid);
		String result = "";
		
		if(idResult == null) {
			result = "ok";
		} else {
			result = "no";
		}
		return result;
	}
	
	// 로그인
	public ModelAndView memberLogin(MemberDTO member) {
		mav = new ModelAndView();
		String loginId = mdao.memberLogin(member);
		String loginIdName = mdao.memberLoginName(member);
		if(loginId != null) {
			session.setAttribute("loginMember", loginId);
			session.setAttribute("loginMemberName", loginIdName);
			System.out.println("여기여기여기  :" + loginIdName);
			// 로그인 성공 후 home.jsp로 이동
			mav.setViewName("redirect:/");
		} else {
			// 로그인 실패 처리
			mav.setViewName("memberlogin");
		}
				
		return mav;
	}

	// 회원정보수정 화면
	public ModelAndView memberUpdate() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginMember");
		MemberDTO memberUpdate = mdao.memberUpdate(loginId);
		mav.addObject("memberUp", memberUpdate);
		mav.setViewName("memberupdate");
		return mav;
	}

	// 회원정보수정 처리
	public ModelAndView memberUpdateProcess(MemberDTO member) {
		mav = new ModelAndView();
		int updateResult = mdao.memberUpdateProcess(member);
		if(updateResult > 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("updatefail");
		}
		return mav;
	}
	
	// 회원목록
	public ModelAndView memberList() {
		mav = new ModelAndView();
		List<MemberDTO> memberList = mdao.memberList();		
		mav.addObject("memberList", memberList);
		mav.setViewName("memberlist");
		return mav;
	}
	
	// 회원 상세조회
	public ModelAndView memberView(String mid) {
		mav = new ModelAndView();
		MemberDTO member = mdao.memberView(mid);
		mav.addObject("result", member);
		mav.setViewName("memberview");
		return mav;
	}
	
	// (ajax)회원 상세조회
	public MemberDTO memberViewAjax(String mid) {
		MemberDTO member = mdao.memberView(mid);
		return member;
	}
	
	// 회원정보삭제 처리
	public ModelAndView memberDelete(String mid) {
		mav = new ModelAndView();
		mdao.memberDelete(mid);
		mav.setViewName("redirect:/");
		return mav;
	}

	// 회원 이메일 ID 찾기 처리
	public ModelAndView idFindProcess(String mphone) {
		System.out.println("service + idfindprocess : " + mphone);
		mav = new ModelAndView();
		MemberDTO member = mdao.idFindProcess(mphone);
		mav.addObject("member", member);
		mav.setViewName("memberidfindresult");
		return mav;
		
	}

	// 회원 비밀번호 찾기 페이지 이동
	
	// 회원 비밀번호 찾기 처리
	
	
}
