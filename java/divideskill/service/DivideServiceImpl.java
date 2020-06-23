package collabo.wato.springboot.web.divideskill.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import collabo.wato.springboot.web.divideskill.mapper.DivideMapper;
import collabo.wato.springboot.web.divideskill.vo.DivideVO;


@Service
public class DivideServiceImpl implements DivideService{

	@Autowired
	DivideMapper mapper;
	
	@Override
	public void insertDivide(DivideVO vo) throws Exception {
		
		 mapper.insertDivide(vo);	
	}

	@Override
	public void upsertDivideMirror(DivideVO vo) throws Exception {
		
		mapper.upsertDivideMirror(vo);	
	}

	@Override
	public List<DivideVO> selectDivide(DivideVO vo) throws Exception {
		
		return mapper.selectDivide(vo);
	}

	@Override
	public void deleteDivide(DivideVO vo) throws Exception {
		
		mapper.deleteDivide(vo);
	}

	@Override
	public void updateDivide(DivideVO vo) throws Exception {
		
		mapper.updateDivide(vo);
	}

	@Override
	public List<DivideVO> selectDivideMirror(DivideVO vo) throws Exception {
		
		
		return mapper.selectDivideMirror(vo);
	}

	@Override
	public List<DivideVO> unlookStop(DivideVO vo) throws Exception {
	
		return mapper.unlookStop(vo);
		
	}

	@Override
	public void getCookieDivide(HttpServletRequest request, DivideVO vo) throws Exception {
		// 쿠키값 가져오기
	    Cookie[] cookies = request.getCookies();
	    if(cookies != null){
	        for(int i=0; i < cookies.length; i++){
	            Cookie coo = cookies[i] ;
	            // 저장된 쿠키 이름을 가져온다
	            String cName = coo.getName();
	            // 쿠키값을 가져온다
	            String cValue = coo.getValue() ;
	            System.out.println("cName : " + cName);
	            System.out.println("cValue : " + cValue);
	            if(cName.equals("cs_func_id")) {
	            	if(cValue.equals(vo.getCs_func_id())){
	            		// 조회수 X
	            		
	            	}else{
	            		// 조회수 O
	            		mapper.increaseView(vo);
	            	}
	            }
	        }
	    }
	}

	// 최초 좋아요 등록
	@Override
	public void insertLike(DivideVO vo) throws Exception {	
		mapper.insertLike(vo);
	}

	// 좋아요 정보 조회
	@Override
	public List<DivideVO> selectLike(DivideVO vo) throws Exception {
		
		return mapper.selectLike(vo);
	}

	// 좋아요 삭제 하는 서비스
	@Override
	public void deleteLike(DivideVO vo) {
		
		mapper.deleteLike(vo);
	}
	
	// 좋아요 증가시키는 service
	@Override
	public void plusLike(DivideVO vo)throws Exception {
		
		mapper.plusLike(vo);
	}
	// 좋아요 감소 시키는 service
	@Override
	public void minusLike(DivideVO vo) throws Exception {
		System.out.println("좋아요 증가 service @@@@@@@@");
		mapper.minusLike(vo);
	}
	
	// 검색 기능
	@Override
	public List<DivideVO> search(DivideVO vo) throws Exception {
		
		return mapper.search(vo);
	}
	
	// 커뮤니티 게시글 등록
	@Override
	public void insertCommunity(DivideVO vo) throws Exception {
			
			mapper.insertCommunity(vo);
	}

	// 커뮤니티 게시글 조회
	@Override
	public List<DivideVO> selectCommunity() throws Exception {
		
		return mapper.selectCommunity();
	}
	
	// 커뮤니티 추천 증가
	@Override
	public void communityCntPlus(DivideVO vo) throws Exception {
		
		mapper.communityCntPlus(vo);
	}
	 
	@Override
	public void communityCntMinus(DivideVO vo) throws Exception {
		
		mapper.communityCntMinus(vo);
	}
	
	// 커뮤니티 추천 등록
	@Override
	public void insertCommunityCnt(DivideVO vo) throws Exception {
		
		mapper.insertCommunityCnt(vo);
	}

	// 커뮤니티 추천 삭제
	@Override
	public void deletetCommunityCnt(DivideVO vo) throws Exception {
		
		mapper.deletetCommunityCnt(vo);
	}

	// 커뮤니티 추천 조회
	@Override
	public List<DivideVO> selectCommunityCnt(DivideVO vo) throws Exception {
		
		return mapper.selectCommunityCnt(vo);
	}
	
	// 히스토리 등록
	@Override
	public void inserthistory(DivideVO vo) throws Exception {
		
		mapper.inserthistory(vo);
	}
	
	// 히스토리 등록시 버전업
	@Override
	public void verPlus(DivideVO vo) throws Exception {
		
		mapper.verPlus(vo);
	}

	// 히스토리 detail 정보조회
	@Override
	public List<DivideVO> selectHistoryDetail(DivideVO vo) throws Exception {
		
		return mapper.selectHistoryDetail(vo);
	}
	
	// 히스토리 정보 수정
	@Override
	public void updateHistory(DivideVO vo) throws Exception {
	
		mapper.updateHistory(vo);
	}

	// 파일 다운로드 하는 service
	@Override
	public String download(DivideVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String saveDirectory = request.getServletContext().getInitParameter("saveDirectory");
        String filename = request.getParameter("fileName");
        String resqFile = vo.getHistory_filepath();
        
        File file = new File("C:\\\\divide\\\\img\\\\"+ resqFile);
        
        response.setContentType("aplication/download");

        response.setContentLengthLong(file.length());
        
        // 모든 브라우저가 지원
        filename = URLEncoder.encode(resqFile, "utf-8").replace("+", "%20").replace("(", "%28").replace(")", "%29");
        
        response.setHeader("Content-Disposition", "attachment; filename=\"" + resqFile + "\";");
        
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        
        try {
   	     		
            int temp;
            fis = new FileInputStream(file);
            while((temp = fis.read()) != -1) {
                out.write(temp);
            }		
        } catch (Exception e) {
            e.printStackTrace();
       
        } finally {
            if(fis != null) {
                try {
                    fis.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        
        return null;
    }
	
	// 히스토리 삭제 
	@Override
	public void historyDelete(DivideVO vo) throws Exception {
		
		// 히스토리 삭제
		mapper.historyDelete(vo);
		
		// 기능 버전 감소
		vo.setCs_func_id(vo.getHistory_id());
		mapper.verMinus(vo);
	}
	
}
