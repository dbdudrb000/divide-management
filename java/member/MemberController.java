package collabo.wato.springboot.web.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import collabo.wato.springboot.web.member.service.MemberService;
import collabo.wato.springboot.web.member.vo.MemberVO;

@Controller
public class MemberController {
	
	// ���� controller �� ( ȸ������ ), ( ȸ������ ) �� �ϴ� controller �̴�.
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/member/join")
	public String join(HttpServletResponse response, HttpServletRequest request, @ModelAttribute MemberVO vo) throws Exception{
		memberService.insertMember(vo);
		return "redirect:/hotplace";
	}

	@RequestMapping(value = "/member/update")
	public String update(HttpServletResponse response, HttpServletRequest request, @ModelAttribute MemberVO vo) throws Exception{
		memberService.updateMemeber(vo);
		return "redirect:/hotplace";
	}
	
	@RequestMapping(value = "/member/prevent")
	public String prevent(HttpServletResponse response, HttpServletRequest request, @ModelAttribute MemberVO vo) throws Exception{
		memberService.preventMemeber(vo);
		return "redirect:/hotplace";
	}

	@RequestMapping(value = "/member/view")
	public String view(HttpServletResponse response, HttpServletRequest request, @ModelAttribute MemberVO vo) throws Exception{
		List<MemberVO> membervoList = memberService.getMember(vo);
		request.setAttribute("data",membervoList );
		return "main/admin/member/list";
	}
}
