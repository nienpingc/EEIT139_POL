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
	public class UpdateMemberInfoController {
		
		@Autowired
		private MemberService memberService;
		
		@RequestMapping(path = "/checkbeforeupdate.controller")
		public String processCheckMemberInfo(@RequestParam("account")String account, Model m) {
			
			Member member = memberService.searchById(account);
			m.addAttribute("member", member);
			m.addAttribute("account", account);
			
			return "member/UpdateMemberData";
			
			
			
			
		}
		 
		@Autowired
		private Member member;
		
		@RequestMapping(path = "/updatemember.controller", method = RequestMethod.GET)
		public String processUpdateMemberInfo(@RequestParam("account") String account,
											  @RequestParam("hashed_pwd") String hashed_pwd,
											  @RequestParam("salt") String salt,
											  @RequestParam("firstname") String firstname,
											  @RequestParam("lastname") String lastname,
											  @RequestParam("birthday") String birthday,
											  @RequestParam("email") String email,
											  @RequestParam("m_address") String m_address,
											  @RequestParam("phone") String phone,
											  @RequestParam("mempic") String mempic,Model m ){
			member.setAccount(account);
			member.setHashed_pwd(hashed_pwd);
			member.setSalt(salt);
			member.setLastname(lastname);
			member.setFirstname(firstname);
			member.setBirthday(birthday);
			member.setEmail(email);
			member.setM_address(m_address);
			member.setPhone(phone);
			member.setMempic(mempic);
			
			boolean statu =true;
			statu = memberService.update(account,member);
			System.out.println(member.getAccount());
			System.out.println(member.getBirthday());
			
			
			if(statu==true) {
				//更新完資料,更新session屬性狀態,以便導回頁面時能看到最新資訊
				List memberList = memberService.searchAll();
				m.addAttribute("memberList",memberList);
				
				return "member/member_viewAll";
			
			}else{
				//account丟進去後,get搜尋結果為null時
				return "member/ErrorPage";
			
			}
			
		}

}
