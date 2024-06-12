package com.psvm.cs.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;
import com.psvm.cs.vo.Cs;

@Repository
public class CsDao {

	
	public int selectListCount(SqlSessionTemplate sqlSession, int boardLevel) {
		return sqlSession.selectOne("csMapper.selectCs", boardLevel);
	}
	
	public ArrayList<Cs> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int boardLevel) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectList", boardLevel, rowBounds);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("csMapper.searchListCount", map);
	}
	
	public ArrayList<Cs> searchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.searchList", map, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("csMapper.increaseCount", boardNo);
	}
	
	public Cs selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("csMapper.selectBoard", boardNo);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("csMapper.selectReply", bno);
		
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Cs c) {
		return sqlSession.insert("csMapper.insertBoard", c);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Cs c) {
		return sqlSession.update("csMapper.updateBoard", c);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("csMapper.deleteBoard", boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("csMapper.insertReply", r);
	}
	
	public ArrayList<Cs> selectTopBoardList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("csMapper.selectTopBoardList");
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int boardReplyNo) {
		return sqlSession.update("csMapper.deleteReply", boardReplyNo);
	}

	public int thumbUpCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("csMapper.thumbUpCount", boardNo);
	}
	
	public int thumbUpCheck(SqlSessionTemplate sqlSession, ThumbUp t) {
		return sqlSession.selectOne("csMapper.thumbUpCheck", t);
	}
	
	public int thumbUpClick(SqlSessionTemplate sqlSession, ThumbUp t) {
		return sqlSession.insert("csMapper.thumbUpClick", t);
	}
}

