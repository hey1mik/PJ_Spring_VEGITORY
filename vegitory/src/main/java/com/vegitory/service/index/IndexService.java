package com.vegitory.service.index;

import java.util.List;

import com.vegitory.domain.ProductDTO;

	// 베스트 상품을 5건 출력
public interface IndexService {
	public List<ProductDTO> bestPdtList();
	
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
}
