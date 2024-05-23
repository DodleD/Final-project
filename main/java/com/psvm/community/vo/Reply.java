package com.psvm.community.vo;

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
public class Reply {
	private int boardReplyNo;
	private int userNo;
	private int boardNo;
	private Date replyDate;
	private int replyDibs;
}
