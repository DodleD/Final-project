package com.psvm.fishInfo.vo;

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
public class Fish {
	public int fishNo;
	public String fishType;
	public String tasteType;
	public int fishFileNo;
	public String fishName;
	public String temperature;
	public String rationTime;
	public String topOrBottom;
	public String tendency;
	public String field;
	public String light;
}
