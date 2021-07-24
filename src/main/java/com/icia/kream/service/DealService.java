package com.icia.kream.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.dao.DealDAO;

@Service
public class DealService {

	@Autowired
	public DealDAO odao;
	public ModelAndView mav;

}
