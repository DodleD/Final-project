package com.psvm.seller.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Review {
	private int replyNo;
	private String nickName;
	private int userNo;
	private int pdNo;
	private int pno;
	private String pdTitle;
	private String changeName;
	private Date reviewDate;
	private int reviewDibs;
	private String reviewContents;
	private String reOriginName;
	private String reChangeName;
}
