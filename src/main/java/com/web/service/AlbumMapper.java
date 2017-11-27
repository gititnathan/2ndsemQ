package com.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.AlbumDBBean;


@Service
public class AlbumMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<AlbumDBBean> listBoard(){
		//sqlSession안의 중요 메소드
		//selectList, selectOne, insert, update, delete
		return sqlSession.selectList("listBoard");
	}

	public int insertBoard(AlbumDBBean dto) {
		return sqlSession.insert("insertBoard", dto);
	}

	public AlbumDBBean getBoard(int num, String mode) {
		if(mode.equals("content")) {
			readcount(num);
		}
		return sqlSession.selectOne("getBoard", num);
	}

	public int deleteBoard(int num) {
		return sqlSession.delete("deleteBoard", num);
	}
	
	public void readcount(int num) {
		sqlSession.update("readcount", num);
	}

	public int updateBoard(AlbumDBBean dto) {
		return sqlSession.update("updateBoard", dto);
	}
	
}















