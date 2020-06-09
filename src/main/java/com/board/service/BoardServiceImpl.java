package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dao.BoardDAO;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List list() throws Exception {

		return dao.list();
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}

	// 게시물 조회
	@Override
	public BoardVO view(int bno) throws Exception {

		return dao.view(bno);
	}

	// 게시물 수정
	@Override
	public void modify(BoardVO vo) throws Exception {

		dao.modify(vo);
	}

	// 게시물 삭제
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}

	// 게시물 목록 + 페이징
	@Override
	public List listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}
}