package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ManageShopAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		String storename = request.getParameter("storename");
		String keyword = request.getParameter("keyword");
		String status = request.getParameter("staus");
		
		SecondHandsDAO dao = new SecondHandsDAO(); 
    	String m_profile =  dao.MyShopProfile(storename);
    	
    	HttpSession session = request.getSession();
    	System.out.println("SESION 이름은 : "+session.getAttribute(storename));
    	
    	//그냥 불러오기

    	request.setAttribute("myproducts",dao.getmyproductslist(storename)); 
    	request.setAttribute("storename", storename);
    	request.setAttribute("m_profile", m_profile);
    	
    	forward.setRedirect(false);
    	forward.setPath("WEB-INF/views/manageshop/managemyproducts.jsp");
    	
		return forward;
	}

}
