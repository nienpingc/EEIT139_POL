//package tw.grp4.member.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import tw.grp4.member.model.Member;
//import tw.grp4.member.model.MemberService;
//
//@Controller
////http://localhost:8080/HouseShip/insertmembermain.controller
////http://localhost:8080/HouseShip/insertmembermain.controller
//@RequestMapping(path="/member")
//public class CreateMemberInfoController {
//	
//	@Autowired
//	private MemberService memberService;
//	
//	//用來銜接(member_viewAll.jsp經點擊後轉到insertMemberData.jsp)
//	@GetMapping(path="/insertmembermain.controller")
//	public String processEnterInsertMember() {
//		return "/member/InsertMemberData";
//	}
//	
//	//將請求參數存到資料庫
//	@GetMapping(path="/insertmember.controller")
//	public String processInsertMember(Member member, Model m) {
//	
//		boolean statu = memberService.insert(member);
//		
//		
//		if(statu==true) {	
//			//用redirect重定向如果寫得是/member,會導到localhost:8080/memebr,不知道為什麼(應該就是得加上根目錄)
//			return "redirect: member";
//		
//		}else {
//			//至於單純用return,則無論member前有無加/都不影響導到目的地
//			return "/member/ErrorPage";
//		}
//
//	}
//
//}
