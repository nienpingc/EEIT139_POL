package tw.grp4.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.grp4.member.model.Member;
import tw.grp4.member.model.MemberService;


@WebServlet(
		urlPatterns = {"/SignIn","/SignOut"},
		initParams = {
				@WebInitParam(name = "SignInSuccess_Path", value = "/index"),
				@WebInitParam(name = "SignInFailure_Path", value = "/JSP/signIn.jsp"),
				@WebInitParam(name = "SignOut_Path", value = "/JSP/signIn.jsp"),
		}
		)
@Controller
@SessionAttributes(names = {"member","isMember"})
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	private MemberService memberService;
	private boolean isMember = false;

	
	private String SignInSuccess_Path;
	private String SignInFailure_Path;
	private String SignOut_Path;
	
	
	@Override
	public void init() throws ServletException{
		SignInSuccess_Path = getInitParameter("SignInSuccess_Path");
		SignInFailure_Path = getInitParameter("SignInFailure_Path");
		SignOut_Path = getInitParameter("SignOut_Path");
		
	}
	//登出
	@GetMapping(path="/logout.controller" )
	protected String logout(SessionStatus status) throws ServletException, IOException {
		System.out.println("hi");
		status.setComplete();
		
		return "signIn";
	}
	
	//沒有權限就進入功能頁面時,用來導回登入頁面
	@RequestMapping(path = "returntosigninpage.controller" , method = RequestMethod.GET)
	protected String ReturnToSignInPage() {
		
		return "signIn";
	}

	
	//登入
	@RequestMapping(path ="/checksignin.controller" , method = RequestMethod.GET)
	protected String checkSignIn(@RequestParam("account") String account, @RequestParam("password") String password, Model m) throws ServletException, IOException {
		try {		
			
			Member member = memberService.searchById(account);
			
			if (password.equals(member.getHashed_pwd())) {
				System.out.println("123");
				isMember = true;
				//用session cope紀錄是否為會員
				m.addAttribute("member", member);
				m.addAttribute("isMember", isMember);
				return "index";

			} else {
				System.out.println("456");
				m.addAttribute("errorMes","輸入的帳號或密碼錯誤");
				return "signIn";
			}
			
		} catch (Exception e) {
			System.out.println("789");
			e.printStackTrace();
			m.addAttribute("errorMes","輸入的帳號或密碼錯誤");
			return "signIn";
		}
	}

}