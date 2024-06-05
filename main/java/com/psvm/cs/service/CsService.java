package com.psvm.cs.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.psvm.commons.vo.PageInfo;
import com.psvm.cs.vo.Cs;


public interface CsService {
	
//	int selectListCount(HashMap<String, String> map);
	
	ArrayList<Cs> selectList(PageInfo pi, int boardLevel);

	//게시글 검색 결과 수 가져오기
	int searchListCount(HashMap<String, String> map);
	
	ArrayList<Cs> searchList(PageInfo pi, HashMap<String, String> map);

	int selectListCount(int boardLevel);
		
//	int increaseCount(int boardNo);
//	
	Cs selectBoard (int boardNo);
	
	

}
