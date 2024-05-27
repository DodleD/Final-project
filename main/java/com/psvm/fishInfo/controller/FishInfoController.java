package com.psvm.fishInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.fishInfo.service.FishInfoService;
import com.psvm.fishInfo.vo.Fish;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class FishInfoController {
	@Autowired
	private FishInfoService fishService;
	
	@RequestMapping(value="fishDetail.fi", produces="application/json; charset=UTF-8")
	public String fishDetail(@RequestParam(value="fishName") String fishName, Model model) {
		
		
		ArrayList<Fish> list = fishService.fishDetail(fishName);
		
		
		
		return "fishInfo/fishInfoDetail";
	}
	
	@RequestMapping(value="fishInfo.ma", produces="application/json; charset=UTF-8")
	public String fishInfoList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int boardCount = fishService.selectListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 15);
		ArrayList<Fish> list = fishService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "fishInfo/fishInfo";
	}
	
	@ResponseBody
	@PostMapping(value="search.fi")
	public String ajaxSearchFish(@RequestParam("fishName") String fishName) {
		
		int currentPage=1;
		int boardCount = fishService.selectAjaxCount(fishName);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 15);
		
		ArrayList<Fish> list = fishService.ajaxSearchFish(pi ,fishName);
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list",list);
		
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@PostMapping(value="categorySearch.fi")
	public String ajaxCategorySearch(@RequestParam("cate") String cate,@RequestParam("cpage") String cpage) {
		int currentPage = Integer.parseInt(cpage);
	
		int boardCount = fishService.selectcateCount(cate);
		
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 15);
		
		ArrayList<Fish> list = fishService.ajaxCategorySearch(pi ,cate);
		
		System.out.println(list);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list",list);
		
		
		return new Gson().toJson(map);
	}
	

	
	
}
