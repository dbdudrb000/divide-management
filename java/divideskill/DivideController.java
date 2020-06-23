package collabo.wato.springboot.web.divideskill;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import org.apache.maven.model.Model;
import org.postgresql.jdbc.UUIDArrayAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import collabo.wato.springboot.web.board.service.BoardService;
import collabo.wato.springboot.web.divideskill.service.DivideService;
import collabo.wato.springboot.web.divideskill.vo.DivideVO;
import collabo.wato.springboot.web.member.service.MemberService;
import collabo.wato.springboot.web.member.vo.MemberVO;

@Controller
public class DivideController {

	@Autowired
	DivideService service;

	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;

	private PrintStream out;

	// 메인페이지로 가는 controller
	@RequestMapping("/divide")
	public String main(HttpServletRequest request, HttpServletResponse response, DivideVO vo, MemberVO mvo)
			throws Exception {

		// 좋아요 정보들을 불러오는 코드
		String likeEmail = request.getParameter("email");
		vo.setLike_email(likeEmail);
		List<DivideVO> likeList = service.selectLike(vo);

		request.setAttribute("likeList", likeList);

		// 기능들의 정보를 불러오는 코드
		List<DivideVO> list = service.selectDivide(vo);
		request.setAttribute("list", list);

		return "/main/divide_skill/divide_skill_main";

	}

	@RequestMapping("/divide/insert")
	public String insert(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {

		return "/main/divide_skill/divideInsert";
	}

	// 기능 등록할때 쓰이는 controller
	@RequestMapping("/insertDivide")
	public String insert(HttpServletRequest request, HttpServletResponse response, MultipartFile files)
			throws Exception {

		String dvTitle = request.getParameter("dvTitle");
		String dvUrl = request.getParameter("dvUrl");
		String dvImg = request.getParameter("dvImg");
		String dvDetail = request.getParameter("dvDetail");
		String dvUser = request.getParameter("dvUser");
		String own = request.getParameter("own");

		DivideVO vo = new DivideVO();

		System.out.println("이미지 파일 파라미터 >>" + dvImg);

		 if (!files.isEmpty()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String time = sdf.format(System.currentTimeMillis());
			String fileName = (UUID.randomUUID().toString() + time).replace("-", "") + ".jpg";
			// File file = new File("\\\\BRODY\\hotplace\\img\\" + fileName);
			File file = new File("C:\\divide\\img\\" + fileName);
			files.transferTo(file);

			vo.setFilepath(fileName);
		} 
		
	/*	// 추후에 파일 업로드 방식 수정한 것.
		if(!files.isEmpty()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = sdf.format (System.currentTimeMillis());
			String newfile = time + files.getOriginalFilename();
			File updateFile = new File("C:\\divide\\img\\" + newfile);
			files.transferTo(updateFile);
			vo.setFilepath(newfile); 
		} */

		vo.setTitle(dvTitle);
		vo.setUrl(dvUrl);
		vo.setDetail(dvDetail);
		vo.setCreate_user(dvUser);
		vo.setOwn(own);

		service.insertDivide(vo);

		return "redirect:/mypage";
	}

	@RequestMapping("/urlLocation")
	public String urlLocation(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("param");
		if ("kakao".equals(page)) {
			return "/main/divide_skill/divide_login";
		} else if ("join".equals(page)) {
			return "/main/divide_skill/divideJoin";
		} else {

		}
		return null;

	}

	// 로그인 페이지로 이동하는 controller
	@RequestMapping("/divide/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {

		return "/main/divide_skill/login/divideLogin";
	}

	// 로그인 로직을 실행하는 controller
	@RequestMapping("/divide/loginLogic")
	public String loginLogic(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession,
			MemberVO mvo) throws Exception {
		DivideVO vo = new DivideVO();

		String email = request.getParameter("email");
		String pw = request.getParameter("password");

		mvo.setEmail(email);
		List<MemberVO> loginVo = memberService.getMember(mvo);

		httpSession.setAttribute("loginVo", loginVo.get(0));
		request.setAttribute("email", email);

		return "forward:/divide";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		httpSession.invalidate();
		return "redirect:/divide";

	}

	// mypage 페이지로 이동하는 controller
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String nickname = request.getParameter("nickname");
		System.out.println("nickname >> " + nickname);

		vo.setNickname(nickname);
		List<DivideVO> myList = service.selectDivide(vo);
		request.setAttribute("myList", myList);

		List<DivideVO> unlookList = service.unlookStop(vo);
		request.setAttribute("unlookList", unlookList);

		return "/main/divide_skill/mypage/mypage";
	}

	// 기능게시글 점검하기
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, DivideVO vo, RedirectAttributes redirect) throws Exception {
		String cs_func_id = request.getParameter("cs_func_id");
		String nickname = request.getParameter("nickname");

		vo.setCs_func_id(cs_func_id);
		service.deleteDivide(vo);
		
		redirect.addAttribute("nickname",nickname);
		return "redirect:/mypage";
	}

	// 수정페이지로 가는 controller
	@RequestMapping("/divideUp")
	public String divideup(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String cs_func_id = request.getParameter("cs_func_id");
		String compar = request.getParameter("compar");

		if ("Y".equals(compar)) {
			vo.setCs_func_id(cs_func_id);
			List<DivideVO> ChList = service.selectDivide(vo);
			request.setAttribute("ChList", ChList.get(0));
		} else {
			vo.setCs_func_id(cs_func_id);
			List<DivideVO> ChList = service.unlookStop(vo);
			request.setAttribute("ChList", ChList.get(0));
		}
		return "/main/divide_skill/mypage/mypageUpdate";
	}

	// 기능등록 게시글을 수정을 하는 로직 controller
	@RequestMapping("/divideUp/logic")
	public String updateLogic(HttpServletRequest request, HttpServletResponse response, MultipartFile files,
			DivideVO vo) throws Exception {
		String cs_func_id = request.getParameter("cs_func_id");
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		String url = request.getParameter("urlName");
		String urlChange = request.getParameter("urlChange");

		String fileName = request.getParameter("upimg");

		if (!files.isEmpty()) {
			// 파일이 있으면
			// 기존 파일 삭제
			System.out.println("기존 파일명 : " + fileName);
			// File file = new File("\\\\BRODY\\hotplace\\img\\" + fileName);
			File file = new File("C:\\divide\\img\\" + fileName);
			if (file.exists()) {
				System.out.println("나(" + fileName + ") 있어요!");
				System.out.println(file.getPath());
				file.setWritable(true);
				boolean isDelete = file.delete();
				System.err.println("너 지워졌니 ? : " + isDelete);
			}

			// 대체 파일 생성
			
			 SimpleDateFormat sdf = new SimpleDateFormat ( "yyyyMMdd"); 
			 String time = sdf.format (System.currentTimeMillis()); 
			 String updateimg = (UUID.randomUUID().toString() + time ).replace("-", "") + ".jpg" ; 
			 //File updateFile = new File("\\\\BRODY\\hotplace\\img\\" + updateimg); 
			 File updateFile = new File("C:\\divide\\img\\" + updateimg);
			 
			 files.transferTo(updateFile); 
			 vo.setFilepath(updateimg);
			

		/*	// 추후에 파일 업로드방식을 수정한 것.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = sdf.format(System.currentTimeMillis());
			String newfile = time + files.getOriginalFilename();
			File updateFile = new File("C:\\divide\\img\\" + newfile);
			files.transferTo(updateFile);

			vo.setFilepath(newfile); */
			vo.setCs_func_id(cs_func_id);
		}
		vo.setOwn(urlChange);
		System.out.println("여기까지 왓니???");
		service.updateDivide(vo);
		request.setAttribute("nickname", nickname);

		return "redirect:/mypage";
	}

	// 에디터 controller
	@RequestMapping("/editor")
	public String editor(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String cs_func_id = request.getParameter("cs_func_id");

		System.out.println("cs_func_id >>" + cs_func_id);
		vo.setCs_func_id(cs_func_id);

		List<DivideVO> editorList = service.selectDivideMirror(vo);

		if (!editorList.isEmpty()) {
			System.out.println("값이 있음.");
			request.setAttribute("editorList", editorList.get(0));
		} else {
			System.out.println("값이 xxxxx");
			return "/main/divide_skill/mypage/mypageEditor";
		}

		return "/main/divide_skill/mypage/mypageEditor";
	}

	// 코드 등록
	@RequestMapping("/divide/upsertDivideMirror")
	public String upsert(HttpServletRequest request, HttpServletResponse response, MultipartFile files,
			@ModelAttribute DivideVO vo) throws Exception {
		String data = request.getParameter("data");
		System.out.println("순번 : " + data);
//		Enumeration enumeration = request.getParameterNames();
//    	while (enumeration.hasMoreElements()) {
//    	String key = (String) enumeration.nextElement();
//    	String value = request.getParameter(key);
//    		System.out.println(">>> " + key + " : " + value);
//    	}

		service.upsertDivideMirror(vo);

		return "/main/divide_skill/divideInsert";
	}

	// 정지된 기능들 보는 페이지 이동
	@RequestMapping("/unlook")
	public String unlook(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String nickname = request.getParameter("nickname");

		vo.setNickname(nickname);

		List<DivideVO> unlookList = service.unlookStop(vo);

		request.setAttribute("unlookList", unlookList);

		return "/main/divide_skill/mypage/unlook";
	}

	// 기능 정지해체하는 로직
	@RequestMapping("/unlook/logic")
	public String unlookLogic(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String fun_id = request.getParameter("cs_fun_id");
		// String delyn = "Y";

		vo.setDelyn("Y");

		service.updateDivide(vo);

		return "redirect:/divide";
	}

	// 좋아요 등록하는 코드
	@RequestMapping("/like")
	public void csLike(HttpServletRequest request, HttpServletResponse reponse, DivideVO vo, MemberVO mvo)
			throws Exception {

		String cs_func_id = request.getParameter("fun_id");
		String nickname = request.getParameter("nick");
		String email = request.getParameter("email");
		String title = request.getParameter("title");

		System.out.println("title >> " + title);
		System.out.println(" like-email >> " + email);
		System.out.println(" like-nickname >> " + nickname);

		// 좋아요 1씩 증가시키는 코드
		vo.setCs_func_id(cs_func_id);
		service.plusLike(vo);
		vo = new DivideVO();

		// 좋아요DB에 닉네임과 기능ID 넣는 코드
		vo.setTitle(title);
		vo.setLike_email(email);
		vo.setLike_like(cs_func_id);
		vo.setLike_nickname(nickname);
		service.insertLike(vo);

	}

	// 좋아요 취소하는 코드 (삭제)
	@RequestMapping("/deleteLike")
	public void deleteLike(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {

		System.out.println("좋아요 취소 컨트롤러 도착!!!!!!");
		String cs_func_id = request.getParameter("fun_id");
		String nickname = request.getParameter("nick");
		String email = request.getParameter("email");
		String title = request.getParameter("title");

		vo.setCs_func_id(cs_func_id);
		service.minusLike(vo);
		vo = new DivideVO();

		vo.setLike_like(cs_func_id);
		vo.setLike_nickname(nickname);

		service.deleteLike(vo);

	}

	// 검색하는 기능
	@RequestMapping("/mainSearch")
	public String mainSearch(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String search = request.getParameter("search");
		String serachValue = request.getParameter("serachValue");

		if ("mainSearch".equals(search)) {
			vo.setTitle(serachValue);
			List<DivideVO> searchList = service.selectDivide(vo);

			request.setAttribute("list", searchList);
			return "/main/divide_skill/divide_skill_main";

		} else if ("historySearch".equals(search)) {
			vo.setTitle(serachValue);
			List<DivideVO> searchList = service.selectDivide(vo);

			request.setAttribute("list", searchList);
			return "/main/divide_skill/divide_history/historyMain";
		}

		return null;
	}

	// 좋아요 리스트 조회
	@RequestMapping("/likelist")
	public String likelist(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String nickname = request.getParameter("nickname");
		vo.setNickname(nickname);
		List<DivideVO> likeList = service.selectLike(vo);

		request.setAttribute("likeList", likeList);

		return "/main/divide_skill/user_like/likeList";
	}

	// 커뮤니티 게시판 페이지 이동
	@RequestMapping("/community")
	public String community(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String nickname = request.getParameter("nickname");
		String writing = request.getParameter("writing");

		// 게시판 작성글 이동 페이지
		if ("writing".equals(writing)) {
			return "/main/divide_skill/community/divide_writing";
		}

		List<DivideVO> comList = service.selectCommunity();
		request.setAttribute("comList", comList);

		// 커뮤니티 추천 리스트 조회
		vo.setRecommen_nickname(nickname);
		List<DivideVO> cntList = service.selectCommunityCnt(vo);

		request.setAttribute("cntList", cntList);

		return "/main/divide_skill/community/divide_community";
	}

	// 게시글 작성 하는 로직
	@RequestMapping("/communityLogic")
	public String communityLogic(HttpServletRequest request, HttpServletResponse response, DivideVO vo)
			throws Exception {
		String comTitle = request.getParameter("com_title");
		String comDetail = request.getParameter("com_detail");
		String comNickname = request.getParameter("com_nickname");

		vo.setCom_title(comTitle);
		vo.setCom_detail(comDetail);
		vo.setCom_nickname(comNickname);

		service.insertCommunity(vo);

		return "redirect:/community";
	}

	// 게시판 추천 증가
	@RequestMapping("/comLikePlus")
	public void comLikePlus(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String count = request.getParameter("count");
		String com_title = request.getParameter("title");
		String com_detail = request.getParameter("detail");
		String com_nickname = request.getParameter("nickname");

		// community cnt 추천 증가
		vo.setCom_count(count);
		service.communityCntPlus(vo);

		// 추천 등록
		vo.setRecommen_number(count);
		vo.setRecommen_title(com_title);
		vo.setRecommen_detail(com_detail);
		vo.setRecommen_nickname(com_nickname);
		service.insertCommunityCnt(vo);

	}

	// 게시판 추천 감소
	@RequestMapping("/comLikeMinus")
	public void comLikeMinus(HttpServletRequest request, HttpServletResponse response, DivideVO vo) throws Exception {
		String count = request.getParameter("count");
		String nickname = request.getParameter("nickname");

		// 커뮤니티 정보 cnt 추천 감소
		vo.setCom_count(count);
		service.communityCntMinus(vo);

		// 추천 삭제
		vo.setRecommen_nickname(nickname);
		vo.setRecommen_number(count);
		service.deletetCommunityCnt(vo);
	}

	// history 페이지로 이동
	@RequestMapping("/history")
	public String history(HttpServletRequest request, HttpServletResponse response, @ModelAttribute DivideVO vo)throws Exception {
		System.out.println("VO : " + vo.toString());
		String history = request.getParameter("history");
		String historyid = request.getParameter("historyid");
		
		
		if ("inserhistory".equals(history)) {

			vo.setCs_func_id(historyid);
			List<DivideVO> list = service.selectDivide(vo);
			request.setAttribute("list", list.get(0));

			return "/main/divide_skill/divide_history/history_insert";

		} else if ("historydetail".equals(history)) {

			// 히스토리 detail 정보들을 불러오고 보여주는 페이지 이동 로직
			vo.setHistory_id(historyid);
			List<DivideVO> hisDetailList = service.selectHistoryDetail(vo);

			request.setAttribute("hisDetailList", hisDetailList);
			return "/main/divide_skill/divide_history/historyDetail";

		} else if ("historyUpdte".equals(history)) {
			// history 수정페이지 이동.

			int historyVer = Integer.parseInt(request.getParameter("historyVer"));

			vo.setHistory_id(historyid);
			vo.setHistory_ver(historyVer);
			List<DivideVO> updateHistory = service.selectHistoryDetail(vo);

			request.setAttribute("updateHistory", updateHistory.get(0));
			return "/main/divide_skill/divide_history/historyUpdate";
		}
		System.out.println("메인페이지로 이동 한다@@@@@@@@@");
		// history 메인페이지로 이동

		System.out.println("닉네임 >> " + vo.getNickname());
		List<DivideVO> list = service.selectDivide(vo);
		request.setAttribute("list", list);
		return "/main/divide_skill/divide_history/historyMain";
	}

	// history 버젼 등록
	@RequestMapping("/insertHistory")
	public String insertHistory(HttpServletRequest request, HttpServletResponse response, DivideVO vo, MultipartFile files) throws Exception {
		String cs_func_id = request.getParameter("cs_func_id");
		String title = request.getParameter("title");
		String detail = request.getParameter("detail");
		String nickname = request.getParameter("nickname");
		int ver = Integer.parseInt(request.getParameter("ver")); // 문자열로 넘어와서 형변환 해줘야 함.

		if (!files.isEmpty()) {
			
			// 추후에 파일 업로드 방식  수정한 것.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = sdf.format(System.currentTimeMillis());
			String newfile = time + files.getOriginalFilename();
			File updateFile = new File("C:\\divide\\img\\" + newfile);
			files.transferTo(updateFile);
			vo.setHistory_filepath(newfile);
		}

		// history 등록
		vo.setHistory_id(cs_func_id);
		vo.setHistory_title(title);
		vo.setHistory_detail(detail);
		vo.setHistory_nickname(nickname);
		vo.setHistory_ver(ver + 1);

		service.inserthistory(vo);

		// 버전 cnt 증가
		vo.setCs_func_id(cs_func_id);
		service.verPlus(vo);
		return "redirect:/divide";
	}
	
	// 히스토리 삭제
	@RequestMapping("/historyDelete")
	public String historyDelete(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		DivideVO vo = new DivideVO();
		String historyId = request.getParameter("historyId");
		int historyVer = Integer.parseInt(request.getParameter("historyVer"));
		
		vo.setHistory_id(historyId);
		vo.setHistory_ver(historyVer);
		
		service.historyDelete(vo);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('버전 삭제완료 하였습니다.');</script>");
		out.flush();

		return "forward:/history";
	}
	
	// 히스토리 정보수정 Logic
	@RequestMapping("/divide/updateHistory")
	public String updateHistory(HttpServletRequest request, HttpServletResponse response, MultipartFile files,DivideVO vo) throws Exception {

		String history_id = request.getParameter("history_id");
		int history_ver = Integer.parseInt(request.getParameter("history_ver"));
		String history_title = request.getParameter("history_title");
		String history_detail = request.getParameter("history_detail");

		System.out.println("files >> " + files);
		if (!files.isEmpty()) {
			String fileName = request.getParameter("imgFilepath");
			// 파일이 있으면
			// 기존 파일 삭제
			System.out.println("기존 파일명 : " + fileName);
			// File file = new File("\\\\BRODY\\hotplace\\img\\" + fileName);
			File file = new File("C:\\divide\\img\\" + fileName);
			if (file.exists()) {
				file.setWritable(true);
				boolean isDelete = file.delete();
				System.err.println("너 지워졌니 ? : " + isDelete);
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String time = sdf.format(System.currentTimeMillis());
			String newfile = time + files.getOriginalFilename();
			File updateFile = new File("C:\\divide\\img\\" + newfile);
			files.transferTo(updateFile);
			vo.setHistory_filepath(newfile);

		}

		vo.setHistory_id(history_id);
		vo.setHistory_ver(history_ver);
		vo.setHistory_title(history_title);
		vo.setHistory_detail(history_detail);

		service.updateHistory(vo);

		return "redirect:/history";
	}

	// 파일 다운로드 하는 controller
	@RequestMapping("/download")
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		DivideVO vo = new DivideVO();
		String callDownFile = request.getParameter("downFile");
		
		
		vo.setHistory_filepath(callDownFile);
		service.download(vo, request, response);
					
	}
	// sms 인증 test controller
	@RequestMapping("/pageload")
	public String mainPage(HttpServletResponse response, HttpServletRequest request)throws Exception {
		
		
		return "/main/Test/smsTest";
	}

}
