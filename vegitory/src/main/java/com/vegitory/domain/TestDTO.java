package com.vegitory.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //디폴트 생성자 만들어주는 애
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TestDTO {
	String name;
	int score;
}
