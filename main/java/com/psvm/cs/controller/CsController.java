package com.psvm.cs.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psvm.commons.template.Pagination;
import com.psvm.commons.vo.PageInfo;
import com.psvm.cs.service.CsService;
import com.psvm.cs.vo.Cs;

@Controller
public class CsController {
	
	@Autowired
	private CsService csService;
	
	//list.cs
	
	@RequestMapping("list.cs")//게시글 목록 띄우기
	public String selectListCs(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, Model model) {
		
		int boardCount = csService.selectListCount(boardLevel);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Cs> list = csService.selectList(pi, boardLevel);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("boardLevel", boardLevel);
		return "cs/CsList";
	}
	
	//게시글 목록 띄우기
	@RequestMapping("searchlist.cs")
	public String searchList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, @RequestParam(value="condition", defaultValue="title") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
		
		HashMap<String, String>map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardLevel", Integer.toString(boardLevel));
		
		int boardCount = csService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Cs> list = csService.searchList(pi, map);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		model.addAttribute("boardLevel", boardLevel);
		return "cs/CsSearchList";
	}
	
//	@RequestMapping("detail.cs")//게시글 내용 띄우기
//	public String selectBoard(int boardNo, @RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0") int boardLevel, @RequestParam(value="condition", defaultValue="title") String condition, @RequestParam(value="keyword", defaultValue="") String keyword, Model model) {
//		
//		PageInfo pi = new PageInfo();
//		ArrayList<Cs> list = new ArrayList<Cs>();
//		
//		if (keyword.isEmpty()) {
//			int boardCount = csService.selectListCount(boardLevel);
//			pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
//			list = csService.selectList(pi, boardLevel);
//		}else {
//			HashMap<String, String>map = new HashMap<>();
//			map.put("condition", condition);
//			map.put("keyword", keyword);
//			map.put("boardLevel", Integer.toString(boardLevel));
//			
//			int boardCount = csService.searchListCount(map);
//			pi = Pagination.getPageInfo(boardCount, currentPage, 10, 10);
//			list = csService.searchList(pi, map);
//		}
//		model.addAttribute("list", list);
//		model.addAttribute("pi", pi);
//		model.addAttribute("keyword", keyword);
//		model.addAttribute("condition", condition);
//		model.addAttribute("boardLevel", boardLevel);
//		
//		int result = csService.increaseCount(boardNo);
//		
//		Cs c = csService.selectBoard(boardNo);
//		model.addAttribute("c", c);
//		
//		return "cs/CsDetail";
//	}
	
}
