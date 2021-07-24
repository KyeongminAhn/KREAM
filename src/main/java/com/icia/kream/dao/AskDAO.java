package com.icia.kream.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.kream.dto.AskDTO;
import com.icia.kream.dto.PageDTO;

@Repository
public class AskDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 판매 입찰 페이지 이동 + 판매 입찰 리스트 출력 + 갯수 확인
	public int ListCount() {
		System.out.println("adao + listCount");
		return sql.selectOne("askm.listcount");
	}

	// 판매 입찰 페이지 이동 + 판매 입찰 리스트 출력
	public List<AskDTO> askPage(PageDTO paging) {
		System.out.println("adao + bidPage");
		return sql.selectList("askm.askpage",paging);
	}

	// 판매 입찰 등록하기
	public void askInPut(AskDTO ask) {
		System.out.println("adao + askInPut : " + ask);
		sql.insert("askm.askinput", ask);
	}

	// 판매 입찰 아이디 중복 확인
	public String askIdCheck(String askid) {
		System.out.println("adao + askIdCheck : " + askid);
		return sql.selectOne("askm.askidcheck", askid);
	}

	// 판매 입찰 내용 수정 요청
	public AskDTO askUpDate(int asknumber) {
		System.out.println("adao + askUpDate : " + asknumber);
		return sql.selectOne("askm.askupdate", asknumber);
	}

	// 판매 입찰 내용 수정
	public void askUpDateProcess(AskDTO ask) {
		System.out.println("adao + askUpDateProcess : " + ask);
		sql.update("askm.askupdateprocess", ask);
	}
	
	// 마이페이지 + 판매 입찰 한 리스트 출력 + 갯수
	public int askListCount(String askid) {
		System.out.println("adao + askListCount : " + askid);
		return sql.selectOne("askm.asklistcount",askid);
	}
	
	// 마이페이지 + 판매 입찰 한 리스트 출력
	public List<AskDTO> askPage(Map<String, String> askMap) {
		System.out.println("adao + askPage : " + askMap);
		return sql.selectList("askm.askidpage", askMap);
	}

	// 판매 입찰 취소
	public void askDelete(int asknumber) {
		System.out.println("bdao + askDelete : " + asknumber);
		sql.delete("askm.askdelete", asknumber);
	}
}
