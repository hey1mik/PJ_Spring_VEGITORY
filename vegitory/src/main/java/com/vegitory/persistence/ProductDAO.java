package com.vegitory.persistence;

import java.util.List;

import com.vegitory.domain.ProductDTO;

public interface ProductDAO {
	
//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();
	
	//4. @관련 SQL이 없으면 mapper.xml에 가서
	// id가 newPdtList와 같은 SQL문을 찾아
	// Oracle DB로 가서 실행 후
	// 결과를 return 받음
	
	public List<ProductDTO> newPdtList();
}
