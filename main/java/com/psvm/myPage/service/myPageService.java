package com.psvm.myPage.service;

import java.util.ArrayList;

import com.psvm.myPage.vo.MyInfo;

public interface myPageService {
	
	ArrayList<MyInfo> selectMyInfo(int userNo);
	
//	int deleteMember(int userNo);
//	
//	ArrayList<InterestProduct> selectInterestProduct(int userNo);
//	
}
