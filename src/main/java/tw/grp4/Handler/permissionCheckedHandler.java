package tw.grp4.Handler;

import javax.persistence.PostRemove;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class permissionCheckedHandler implements HandlerInterceptor {
	
	//驗證用戶是否已透過登入具權限
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Boolean statu = (Boolean) request.getSession().getAttribute("isMember");
		
		if(statu == null) {
			response.sendRedirect("returntosigninpage.controller");
			//request.getRequestDispatcher("returntosigninpage.controller").forward(request, response);
			
		}
		
		return true;
			
	}

	
}
