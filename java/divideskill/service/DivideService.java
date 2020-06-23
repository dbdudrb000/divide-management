package collabo.wato.springboot.web.divideskill.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collabo.wato.springboot.web.divideskill.vo.DivideVO;

public interface DivideService {
	
	// 기능등록 
	void insertDivide(DivideVO vo) throws Exception;

	// 코드 등록 
	void upsertDivideMirror(DivideVO vo) throws Exception;
	
	// 코드 조회 
	List<DivideVO> selectDivideMirror(DivideVO vo) throws Exception;
	
	// 기능조회 
	List<DivideVO> selectDivide(DivideVO vo) throws Exception;
	
	// 기능삭제
	void deleteDivide(DivideVO vo) throws Exception;
	
	// 기능수정
	void updateDivide(DivideVO vo) throws Exception;
	
	// 점검중인 기능 조회
	List<DivideVO> unlookStop(DivideVO vo) throws Exception;

	// 쿠키 조회
	void getCookieDivide(HttpServletRequest request, DivideVO vo) throws Exception;
	
	// 좋아요 최초 등록
	void insertLike (DivideVO vo) throws Exception;
	
	// 좋아요 정보 조회
	List<DivideVO> selectLike(DivideVO vo) throws Exception;
	
	// 좋아요 삭제 
	void deleteLike(DivideVO vo) throws Exception;
	
	// 기능에 좋아요 증가
	void plusLike(DivideVO vo) throws Exception ;
	
	// 기능에 좋아요 감소
	void minusLike(DivideVO vo) throws Exception;
	
	// 검색 기능
	List<DivideVO> search(DivideVO vo) throws Exception;
	
	// 커뮤니티 조회
	List<DivideVO> selectCommunity() throws Exception;
	
	// 커뮤니티 게시글 등록 
	void insertCommunity(DivideVO vo) throws Exception;
	
	// 커뮤니티 추천 증가
	void communityCntPlus(DivideVO vo) throws Exception;     
	
	// 커뮤니티 추천 감소
	void communityCntMinus(DivideVO vo) throws Exception;  
	
	// 커뮤니티 추천 등록
	void insertCommunityCnt(DivideVO vo) throws Exception;
	
	// 커뮤니티 추천 삭제
	void deletetCommunityCnt(DivideVO vo) throws Exception;
	
	// 커뮤니티 추천 조회
	List<DivideVO> selectCommunityCnt(DivideVO vo) throws Exception;
	
	// 히스토리 등록
	public void inserthistory(DivideVO vo) throws Exception;
	
	//히스토리 삭제
	public void historyDelete(DivideVO vo) throws Exception;
	
	// 히스토리 버전 증가
	public void verPlus(DivideVO vo)throws Exception;
	
	// 히스토리 detail 정보 조회
	public List<DivideVO> selectHistoryDetail(DivideVO vo) throws Exception;
	
	//히스토리 정보 수정
	public void updateHistory(DivideVO vo) throws Exception;
	
	// 파일 다운로드
	public String download(DivideVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
}	
