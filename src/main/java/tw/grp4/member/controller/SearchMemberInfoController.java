package tw.grp4.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.grp4.member.model.Member;
import tw.grp4.member.model.MemberService;

@Controller
@SessionAttributes(names = {"memberList"})
public class SearchMemberInfoController {
	
	@Autowired
	private MemberService memberService;
	//index.jsp轉member_viewAll.jsp在這轉(script.js裡有放path)
	@GetMapping(path="/member")
	public String processSearchAll(Model m) {
		
		List<Member> memberList =  memberService.searchAll();
		//要把所有會員資料帶到member_viewAll.jsp
		m.addAttribute("memberList", memberList);
		
		for(Member member :memberList) {
			System.out.println(member.getAccount());
		}
		//轉到member_viewAll.jsp
		return "member/member_viewAll";
	}
	
	public String processSearchById() {
		return null;
	}

}
