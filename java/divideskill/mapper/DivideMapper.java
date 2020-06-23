package collabo.wato.springboot.web.divideskill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import collabo.wato.springboot.web.divideskill.vo.DivideVO;

@Repository
@Mapper
public interface DivideMapper {
	// 기능 등록
	public void insertDivide(DivideVO vo);
	
	// 기능 조회
	public List<DivideVO> selectDivide(DivideVO vo);
	
	// 기능삭제
	public void deleteDivide(DivideVO vo);
	
	// 기능 수정
	public void updateDivide(DivideVO vo);

	// 코드 등록
	public void upsertDivideMirror(DivideVO vo);
	
	// 코드 조회
	public List<DivideVO> selectDivideMirror(DivideVO vo);
	
	public List<DivideVO> unlookStop(DivideVO vo);

	// 조회수 증가
	public void increaseView(DivideVO vo);
	
	// 기능 정보에 좋아요 증가
	public void plusLike(DivideVO vo);
	
	// 기능 정보에 좋아요 감소
	public void minusLike(DivideVO vo);
	
	// 좋아요 등록
	public void insertLike(DivideVO vo);
	
	// 좋아요 정보 조회
	public List<DivideVO> selectLike(DivideVO vo);
	
	// 좋아요 삭제
	public void deleteLike(DivideVO vo);
	
	// 검색 기능
	public List<DivideVO> search(DivideVO vo);
	
	// 커뮤니티 게시글 조회
	public List<DivideVO> selectCommunity();
	
	// 커뮤니티 게시글 등록
	public void insertCommunity(DivideVO vo);
	
	// 커뮤니티 추천 증가
	public void communityCntPlus(DivideVO vo);
	
	// 커뮤니티 추천 감소
	public void communityCntMinus(DivideVO vo);
	
	// 커뮤니티 추천 등록
	public void insertCommunityCnt(DivideVO vo);
	
	// 커뮤니티 추천 삭제
	public void deletetCommunityCnt(DivideVO vo);
	
	// 커뮤니티 추천 조회
	public List<DivideVO> selectCommunityCnt(DivideVO vo);
	
	// 히스토리 등록
	public void inserthistory(DivideVO vo);
	
	// 히스토리 삭제
	public void historyDelete(DivideVO vo);
	
	// 히스토리 등록시 버전  증가
	public void verPlus(DivideVO vo);
	
	// 히스토리 삭제시 버전  감소
	public void verMinus(DivideVO vo);
	
	// 히스토리 detail 정보 조회
	public List<DivideVO> selectHistoryDetail(DivideVO vo);
	
	// 히스토리 정보 수정
	public void updateHistory(DivideVO vo);
	
	
	
	
	
}
