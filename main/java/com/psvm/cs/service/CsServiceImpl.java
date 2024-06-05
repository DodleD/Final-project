package com.psvm.cs.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.cs.dao.CsDao;
import com.psvm.cs.vo.Cs;

@Service
public class CsServiceImpl implements CsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CsDao csDao;

	@Override
	public ArrayList<Cs> selectList(PageInfo pi, int boardLevel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int searchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return csDao.searchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Cs> searchList(PageInfo pi, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return csDao.searchList(sqlSession, pi, map);
	}

	@Override
	public int selectListCount(int boardLevel) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Cs selectBoard(int boardNo) {
		return csDao.selectBoard(sqlSession, boardNo);
	}

	

	

	
	
}
