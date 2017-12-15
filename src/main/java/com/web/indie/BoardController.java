package com.web.indie;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.AlbumDBBean;
import com.web.model.BoardDBBean;
import com.web.service.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping(value="/board_list")
	public ModelAndView album_list() {
		System.out.println("1");
		List<BoardDBBean> list = boardMapper.listBoard();
		System.out.println("2");
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", list);
		mav.setViewName("board_list");
		return mav;
	}
	@RequestMapping(value="/indie_content")
	public ModelAndView getAlbum(HttpServletRequest req, @RequestParam String num) throws Exception {
	int snum = Integer.parseInt(num);
	AlbumDBBean dto = boardMapper.getBoard(snum,"content");
	ModelAndView mav = new ModelAndView();
	mav.addObject("getBoard", dto);
	mav.setViewName("Bcontent");
	return mav;
}
	@RequestMapping(value="/indie_write", method=RequestMethod.GET)
	public String writeFormAlbum() throws Exception {
		return "writeForm2";
	}
	@RequestMapping(value="/indie_write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest arg0,
			@ModelAttribute BoardDBBean dto, BindingResult result) throws Exception {
		
		System.out.println(dto.getAlbumName() + "1");
		System.out.println(dto.getAlbumImage()+ "2");
		System.out.println(dto.getArtistName()+ "3");
		System.out.println(dto.getMvlink()+ "4"); 
		
		if (result.hasErrors()) {
			dto.setAlbumImage("");
		}
		String uploadPath ="D:\\7월 자바 웹개발 김권능\\study\\hw";
		String albumImage = "";
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;//httpservletrequest로 받은 multipart에 들어있는 애들을 Multipart**로 바꿔준다.
		
		MultipartFile imagefile = mr.getFile("albumImage");
		File atarget = new File(uploadPath, imagefile.getOriginalFilename());
		if (imagefile.getSize()>0) {
			imagefile.transferTo(atarget);//파일을 타겟으로 옮긴다.
			albumImage = imagefile.getOriginalFilename();//앞서 선언해준 ""을 가지고 있는 albumImage에 파일이름을 넘겨준다.
		}
		dto.setAlbumImage(albumImage);
		int res = boardMapper.insertBoard(dto);
		return new ModelAndView("redirect:board_list");
	}
	
}
