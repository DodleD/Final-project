package com.psvm.cs.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;
import com.psvm.cs.dao.CsDao;
import com.psvm.cs.vo.Cs;

@Service
public class CsServiceImpl implements CsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CsDao csDao;
	
	@Override
	public int selectListCount(int boardLevel) {
		// TODO Auto-generated method stub
		return csDao.selectListCount(sqlSession, boardLevel);
	}

	@Override
	public ArrayList<Cs> selectList(PageInfo pi, int boardLevel) {
		// TODO Auto-generated method stub
		return csDao.selectList(sqlSession, pi, boardLevel);
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
	public int increaseCount(int boardNo) {
		return csDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Cs selectBoard(int boardNo) {
		return csDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Reply> selectReply(int bno){
		return csDao.selectReply(sqlSession, bno);
	}
	
	@Override
	public int insertBoard(Cs c) {
		return csDao.insertBoard(sqlSession, c);
	}

	@Override
	public int updateBoard(Cs c) {
		return csDao.updateBoard(sqlSession, c);
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		return csDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return csDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Cs> selectTopBoardList() {
		return csDao.selectTopBoardList(sqlSession);
	}
	
	@Override
	public int deleteReply(int boardReplyNo) {
		return csDao.deleteReply(sqlSession, boardReplyNo);
	}
	
	@Override
	public int thumbUpCount(int boardNo) {
		return csDao.thumbUpCount(sqlSession, boardNo);
	}
	
	@Override
	public int thumbUpCheck(ThumbUp t) {
		return csDao.thumbUpCheck(sqlSession, t);
	}
	
	@Override
	public int thumbUpClick(ThumbUp t) {
		return csDao.thumbUpClick(sqlSession, t);
	}
}
