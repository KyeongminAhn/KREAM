package com.icia.kream.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.kream.dto.AccountDTO;
import com.icia.kream.dto.MemberDTO;

@Repository
public class PointDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 포인트 충전
	public int pointAccount(MemberDTO member) {
		System.out.println("pdao + pointAccount : " + member);
		return sql.update("pim.pointaccount",member);
	}

	// 포인트 충전 후 상세 조회
	public MemberDTO memberPoint(String mid) {
		System.out.println("pdao + memberPoint : " + mid);
		return sql.selectOne("pim.memberpoint", mid);
	}
	
	// 포인트 충전 ACCOUNT 테이블 데이터 추가
	public int pointAccountPlus(AccountDTO account) {
		System.out.println("pdao + pointAccountPlus : " + account);
		return sql.update("pim.pointaccountplus",account);
	}

	// 포인트 충전 리스트 갯수
	public int ListCount(String mid) {
		System.out.println("pdao + ListCount : " + "+" + mid);
		return sql.selectOne("pim.listcount",mid);
	}

	// 포인트 충전 리스트 출력
	public List<AccountDTO> pointAccountList(Map<String, String> searchMap) {
		System.out.println("pdao + pointAccountList : " + searchMap);
		return sql.selectList("pim.pointaccountlist",searchMap);
	}


	
}
