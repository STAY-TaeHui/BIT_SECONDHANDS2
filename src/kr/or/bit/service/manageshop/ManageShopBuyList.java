package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ManageShopBuyList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		SecondHandsDAO dao = new SecondHandsDAO();
		
		HttpSession session = request.getSession();
		String storename = (String)session.getAttribute("storename");
		
		dao.getBuyList(storename);
		
		
		return null;
	}

}
