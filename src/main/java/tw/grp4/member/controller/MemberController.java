package tw.grp4.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.grp4.member.model.Member;
import tw.grp4.member.model.MemberService;

@Controller
//@SessionAttributes(names = {"membersList"})
//所有導入controller的請求,其路徑都會以http://localhost:8080/Houseship 開始
//這裡有加/member,所以導到controller方法的url前面都會有http://localhost:8080/Houseship/member
//然後這裡跟return的路徑無關
@RequestMapping(path = "/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	//所以search就不用加(path="/member"),上面已經有了
	@GetMapping
	public String searchAllMember(Model model) {
		model.addAttribute("membersList",memberService.searchAll());
		
		return "/member/member_viewAll";
		
	}
	//controller的url都是http://localhost:8080/Houseship + 你寫得部分(@RequestMapping的path)
	//而jsp的預設url是你當前的url假設是http://localhost:8080/Houseship/member,
	//則用你寫的部分替換最後面的member做為你待轉頁面的url
	//所以jsp的action除非你用絕對路徑,不然都得視你當前頁面是什麼,才能決定你的action路徑要怎麼寫
	
	@GetMapping(path = "/insertmember.controller")
    public String addNewHouseForm(Member member, Model model) {
        
		//這裡member前面有沒有加斜線好像沒差,why?不會變成/WEB-INF/resources/JSP//member/InsertMemberData.jsp嗎?
        return "/member/InsertMemberData";
    }
	//從insertMemberData導過來時的url是http://localhost:8080/HouseShip/member/insertmembermain.controller
	//這時候member後面已經有斜線,所以如果你跟上面一樣打"member/insertmember.controller"
	//會用member/insertmember.controller替換insertmembermain.controller(因為他在斜線後面)\
	//而前面是會寫"member/insertmembermain.controller"是因為導入前在http://localhost:8080/Houseship/member
	//member後面沒有斜線,所以會用member/insertmembermain.controller替換member
	
	@PostMapping(path = "/insertmember.controller")
    public String addNewHouse(Member member, Model model) {
        
		boolean statu = memberService.insert(member);
		
		if(statu==true) {	
			//用redirect重定向如果寫得是/member,會導到localhost:8080/member,不知道為什麼(應該就是得加上根目錄)
			//只寫member則導向localhost:8080/HouseShip/member/member
			return "redirect:/member";
		
		}else {
			//至於單純用return,則無論member前有無加/都不影響導到目的地
			return "/member/ErrorPage";
		}
    }
	//用@RequestParam接收member_viewAll傳來的account,然後用account找到member物件轉到UpdateMemberData
	@GetMapping (path = "/updatemember.controller/{memberaccount}")
    public String updateMemberConfirm(@PathVariable("memberaccount") String account, Model model) {
        model.addAttribute("member", memberService.searchById(account));
        model.addAttribute("account", account);        
        return "/member/UpdateMemberData";
    }
	//用參數Member member接收來自UpdateMemberData的表單請參,並透過其中的account進資料庫改資料
    @PostMapping(path = "/updatemember.controller/{memberaccount}")
    public String updateMember(@PathVariable("memberaccount") String account,@ModelAttribute("member") Member member) {
        System.out.println("============Go to Update=============");
        memberService.update(member.getAccount(), member);
        return "redirect:/member";
    }
    //用@RequestParam接收member_viewAll傳來的account,然後用account找到member物件轉到DeleteByAccount,以便顯示
    @GetMapping(path = "/deletemember.controller/{memberaccount}")
    public String deleteMemberConfirm(@PathVariable("memberaccount") String account, Model model) {
        model.addAttribute("member", memberService.searchById(account));
        model.addAttribute("account", account);
        return "/member/DeleteByAccount";
    }
    //用參數String account接收來自DeleteByAccount的表單請參(只需接收account)
    @PostMapping(path = "/deletemember.controller/{memberaccount}")
    public String deleteMember(@PathVariable("memberaccount") String account,@ModelAttribute("member") Member member ) {
        memberService.delete(account);
        return "redirect:/member";
    }
	
	
	
	
	
	
	
	
	

}
