package com.vegitory.persistence;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.vegitory.domain.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(@Param("bno")int bno);
	public int insert(@Param("reply") ReplyDTO rDto);
	public int delete(int rno);
}
