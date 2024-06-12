package com.psvm.cs.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.psvm.commons.vo.PageInfo;
import com.psvm.community.vo.Community;
import com.psvm.community.vo.Reply;
import com.psvm.community.vo.ThumbUp;
import com.psvm.cs.vo.Cs;


public interface CsService {
	
//	int selectListCount(HashMap<String, String> map);
	
	ArrayList<Cs> selectList(PageInfo pi, int boardLevel);

	//게시글 검색 결과 수 가져오기
	int searchListCount(HashMap<String, String> map);
	
	ArrayList<Cs> searchList(PageInfo pi, HashMap<String, String> map);

	int selectListCount(int boardLevel);
		
	int increaseCount(int boardNo);
//	
	Cs selectBoard (int boardNo);
	
	//댓글목록 조회
	ArrayList<Reply> selectReply(int bno);
	
	//게시글 추가
	int insertBoard(Cs c);
		
	//게시글 수정
	int updateBoard(Cs c);
	
	//게시글 삭제
	int deleteBoard(int boardNo);
	
	//댓글추가
	int insertReply(Reply r);
	
	//top5게시글 조회
	ArrayList<Cs> selectTopBoardList();
	
	//댓글삭제
	int deleteReply(int boardReplyNo);
	
	//추천 수 조회
	int thumbUpCount(int boardNo);
	
	//추천 여부 확인
	int thumbUpCheck(ThumbUp t);
	
	//추천 누름
	int thumbUpClick(ThumbUp t);

}
