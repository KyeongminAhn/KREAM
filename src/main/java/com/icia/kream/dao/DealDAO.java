package com.icia.kream.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DealDAO {

	@Autowired
	private SqlSessionTemplate sql;

}
