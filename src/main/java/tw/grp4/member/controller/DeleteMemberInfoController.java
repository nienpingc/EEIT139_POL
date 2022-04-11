package tw.grp4.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.grp4.member.model.Member;
import tw.grp4.member.model.MemberService;

@Controller
@SessionAttributes(names = {"memberList"})
public class DeleteMemberInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(path = "/cheakbeforedelete.controller")
	public String processCheckMemberInfo(@RequestParam("account")String account, Model m) {
		
		m.addAttribute("account", account);
		Member member = memberService.searchById(account);
		m.addAttribute("member", member);
		return "member/DeleteByAccount";
	}
	
	
	@RequestMapping(path = "deletemember.controller", method = RequestMethod.GET)
	public String processInsertMember(@RequestParam("account") String account, Model m) {
		
		boolean statu = memberService.delete(account);
		
		if(statu==true) {
			//更新完資料,更新session屬性狀態,以便導回頁面時能看到最新資訊
			List memberList = memberService.searchAll();
			m.addAttribute("memberList",memberList);
			return "member/member_viewAll";
				
				
		}else {
			return "member/ErrorPage.jsp";
		}
	}

}
