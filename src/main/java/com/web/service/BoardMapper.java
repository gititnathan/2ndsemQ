package com.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.AlbumDBBean;
import com.web.model.BoardDBBean;

@Service
public class BoardMapper {

	@Autowired
	private SqlSession sqlSession;
	public int insertBoard(BoardDBBean dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	public List<BoardDBBean> listBoard(){
		//sqlSession���� �߿� �޼ҵ�
		//selectList, selectOne, insert, update, delete
		return sqlSession.selectList("listBoard");
	}
	
	public AlbumDBBean getBoard(int num, String mode) {
		return sqlSession.selectOne("getBoard", num);
	}
}
