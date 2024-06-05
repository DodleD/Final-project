package com.psvm.cs.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
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
		1
	}
	
}
