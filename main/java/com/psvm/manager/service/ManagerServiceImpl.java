package com.psvm.manager.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.psvm.commons.vo.PageInfo;
import com.psvm.manager.dao.ManagerDao;
import com.psvm.manager.vo.ApplicationProduct;
import com.psvm.manager.vo.Search;
import com.psvm.manager.vo.Seller;
import com.psvm.member.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao managerDao;
	
	// 관리자를 제외한 모든 회원 수 조회
	public int memberListCount() {
		return managerDao.memberListCount(sqlSession);
	}
	
	// 관리자를 제외한 모든 회원 조회
	public ArrayList<Member> memberList(PageInfo pi){
		return managerDao.memberList(sqlSession, pi);
	}
	
	// 검색한 회원 수 조회
	public int searchMemberCount(Search s) {
		return managerDao.searchMemberCount(sqlSession, s);
	}
	
	// 검색한 회원 조회
	public 	ArrayList<Member> searchMemberList(Search s, PageInfo Pi) {
		return managerDao.searchMemberList(sqlSession, s, Pi);
	}
	
	
	
	// 관리자가 회원 강제 탈퇴
	public int deleteMember(int userNo) {
		return managerDao.deleteMember(sqlSession, userNo);
	}
	
	
	
	
	// 판매자 수 조회
	public int sellerListCount() {
		return managerDao.sellerListCount(sqlSession);
	}
	
	// 판매자 조회
	public ArrayList<Seller> sellerList(PageInfo pi) {
		return managerDao.sellerList(sqlSession, pi);
	}
	
	// 검색한 판매자 수 조회
	public int searchSellerCount(Search s) {
		return managerDao.searchSellerCount(sqlSession, s);
	}
	
	// 검색한 판매자 조회
	public ArrayList<Seller> searchSellerList(Search s, PageInfo pi){
		return managerDao.searchSellerList(sqlSession, s, pi);
	}
	
	// 판매자 신규 신청한 회원 수 조회
	public int sellerNewApplicationCount() {
		return managerDao.sellerNewApplicationCount(sqlSession);
	}
	
	// 판매자 신규 신청한 회원 조회
	public ArrayList<Seller> sellerNewApplicationList(PageInfo pi){
		return managerDao.sellerNewApplicationList(sqlSession, pi);
	}
	
	// 검색한 판매자 신규 신청 회원 수 조회
	public int searchSellerNewApplicationCount(Search s) {
		return managerDao.searchSellerNewApplicationCount(sqlSession, s);
	}
	
	// 검색한 판매자 신규 신청 회원 조회
	public ArrayList<Seller> searchSellerNewApplicationList(Search s, PageInfo pi){
		return managerDao.searchSellerNewApplicationList(sqlSession, s, pi);
	}
	
	// 판매자 신규신청 승인
	public int sellerNewApplicationApprove(int userNo) {
		return managerDao.sellerNewApplicationApprove(sqlSession, userNo);
	}
	
	// 판매자가 신청한 상품 수 조회
	public int sellerProductApplicationCount() {
		return managerDao.sellerProductApplicationCount(sqlSession);
	}
	
	// 판매자가 신청한 상품 조회
	public ArrayList<ApplicationProduct> sellerProductApplicationList(PageInfo pi){
		return managerDao.sellerProductApplicationList(sqlSession, pi);
	}
	
}
