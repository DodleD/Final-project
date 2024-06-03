package com.psvm.curation.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.psvm.curation.vo.Curation;

@Repository
public class CurationDao {
	public ArrayList<Curation> getQuestionList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("curationMapper.getQuestionList");

	}
}
