package com.psvm.myPage.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Inquiry {
	private int faqNo;
	private String inquiryTitle;
	private String inquiryDate;
	private int pdNo;
}
