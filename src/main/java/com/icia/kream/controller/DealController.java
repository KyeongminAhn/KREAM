package com.icia.kream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.icia.kream.service.DealService;

@Controller
public class DealController {

	@Autowired
	private DealService os;
	private ModelAndView mav;

}
