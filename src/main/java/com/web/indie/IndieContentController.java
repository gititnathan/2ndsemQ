package com.web.indie;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.io.*;
import java.text.DateFormat;
import java.util.*;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.AlbumDBBean;
import com.web.service.AlbumMapper;

@Controller
public class IndieContentController{
	@Autowired
	private AlbumMapper albumMapper;
		@RequestMapping(value="/album_list")
		public ModelAndView album_list() {
			List<AlbumDBBean> list = albumMapper.listAlbum();
			ModelAndView mav = new ModelAndView();
			mav.addObject("albumList", list);
			mav.setViewName("list");
			return mav;
		}
		@RequestMapping(value="/album_write", method=RequestMethod.GET)
		public String writeFormAlbum() throws Exception {
			return "writeForm";
		}
		@RequestMapping(value="/album_write", method=RequestMethod.POST)
		public ModelAndView writePro(HttpServletRequest arg0,
				@ModelAttribute AlbumDBBean dto, BindingResult result) throws Exception {
			if (result.hasErrors()) {
				dto.setArtistnum(0);
//				dto.setAlbumtitle("none");
				dto.setGenre("none");
//				dto.setMusicFiles("");
				dto.setAlbumImage("");
//				dto.setMvLink("");
//				dto.setAlbumDesc("none");
//		
			}
			String uploadPath ="D:\\7월 자바 웹개발 김권능\\study\\hw";
			String musicFiles = "";
			String albumImage = "";
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
			MultipartFile musicfile = mr.getFile("musicFiles"); // multipartReqeust로 musicFiles이라고 넘긴 값을 MultipartFile에 넣어준다.
			File musictarget = new File(uploadPath, musicfile.getOriginalFilename());  //target이라는 파일을 선언하고. (업로드경로, MultipartFile형식의 file로 받은애 원래 이름)을 넣어준다.
			if (musicfile.getSize()>0) {
				musicfile.transferTo(musictarget);//파일을 타켓으로 옮긴다.
				musicFiles = musicfile.getOriginalFilename();//앞서 선언해준 ""이란 파일name에 파일이름을 넘겨준다.
			}
			dto.setMusicFiles(musicFiles);//그리고 디티오에 저장!
			
			
			MultipartFile imagefile = mr.getFile("albumImage");
			File atarget = new File(uploadPath, imagefile.getOriginalFilename());
			if (imagefile.getSize()>0) {
				imagefile.transferTo(atarget);//파일을 타켓으로 옮긴다.
				albumImage = imagefile.getOriginalFilename();//앞서 선언해준 ""이란 파일name에 파일이름을 넘겨준다.
			}
			dto.setAlbumImage(albumImage);
			int res = albumMapper.insertAlbum(dto);
			return new ModelAndView("redirect:album_list");
		}
		@RequestMapping(value="/album_content")
		public ModelAndView getAlbum(HttpServletRequest req, @RequestParam String num) throws Exception {
		int snum = Integer.parseInt(num);
		AlbumDBBean dto = albumMapper.getAlbum(snum,"content");
		ModelAndView mav = new ModelAndView();
		mav.addObject("getAlbum", dto);
		mav.setViewName("content");
		return mav;
	}
		@RequestMapping(value="/album_delete", method=RequestMethod.GET)
		public String deleteForm() {
		return "deleteForm";
	}
		@RequestMapping(value="/album_update", method=RequestMethod.GET)
		public ModelAndView UpdateFormAlbum(@RequestParam String num) throws Exception {
		int snum = Integer.parseInt(num); // int를 받아오는 방법
		AlbumDBBean dto = albumMapper.getAlbum(snum,"update"); // update라는 mode로 dto를 불러온다.
		return new ModelAndView("board/updateForm", "getAlbum", dto); // "getAlbum"로 dto를 넘겨준다.
	}
		@RequestMapping(value="/album_update", method=RequestMethod.POST)
		protected ModelAndView UpdateProAlbum(HttpServletRequest req, @ModelAttribute AlbumDBBean dto, 
				BindingResult result)
		throws Exception {
			//파일 받기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req; // req로 받은 애를 형변환해서 mr에 담아준다.
			MultipartFile mf = mr.getFile("filename"); // mr에서 filename을 가지고 있는 애를 가져와서 mf에 담는다.
			String filename = mf.getOriginalFilename(); // mf에서 가져온 원본파일의 이름을 String형 filename에 담아준다.
			// 파일 이름만 우선 체크해보기
			System.out.println("filename = " + filename);
			// 저장 경로 설정하기
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/files"); // 절대경로 지정해주는 것.
			// 서버에 파일 쓰기
			File file = new File(upPath, filename);
			if (result.hasErrors()) {
				dto.setAlbumnum(0);
			} else {
				mf.transferTo(file);
			}
		int res = albumMapper.updateAlbum(dto);
		/*if (res>0) {
		}else if (res<0) {
		}else {
		}*/
		return new ModelAndView("redirect:album_list");
	}
		@RequestMapping(value="/file_upload", method=RequestMethod.GET)
		public String form() {
		return "form";
	}
		@RequestMapping(value="/file_upload", method=RequestMethod.POST)
		// method = RequestMethod.GET 
		public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) 
		{ 
			//파일이 저장될 path 설정 
			String path = "D:\\7월 자바 웹개발 김권능\\"; 
			Map returnObject = new HashMap(); 
			try { 
				// MultipartHttpServletRequest 생성 
				MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
				Iterator iter = mhsr.getFileNames(); 
				MultipartFile mfile = null; 
				String fieldName = ""; 
				List resultList = new ArrayList();
				// 디레토리가 없다면 생성 
				File dir = new File(path); 
				if (!dir.isDirectory()) { dir.mkdirs(); }
				// 값이 나올때까지 
				while (iter.hasNext()) { 
				fieldName = (String) iter.next(); // 내용을 가져와서 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
				// 파일명이 없다면 
				if ("".equals(origName)) { continue; }
				// 파일 명 변경(uuid로 암호화) 
				String ext = origName.substring(origName.lastIndexOf('.')); 
				// 확장자 
				String saveFileName = getUuid() + ext; 
				// 설정한 path에 파일저장 
				File serverFile = new File(path + File.separator + saveFileName); 
				mfile.transferTo(serverFile); 
				Map file = new HashMap();  // file이라는 hashMap에 원래 파일이름인 origName과 정해준 특정 위치에 저장할 파일이름을 넣어줘야 한다.
				file.put("origName", origName); 
				file.put("sfile", serverFile); 
				resultList.add(file); 
				}
				returnObject.put("files", resultList); 
				returnObject.put("params", mhsr.getParameterMap()); 
				} catch (UnsupportedEncodingException e) { 
					// TODO Auto-generated catch block 
					e.printStackTrace(); }catch (IllegalStateException e) { 
						// TODO Auto-generated catch block 
						e.printStackTrace(); } catch (IOException e) { 
							// TODO Auto-generated catch block 
							e.printStackTrace(); 
							} 
			return null; 
			} 
		//uuid생성 
		public static String getUuid() { 
			return UUID.randomUUID().toString().replaceAll("-", ""); 
			}
		}