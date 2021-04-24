package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ProductUpload implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		SecondHandsDAO dao = new SecondHandsDAO();
		
		String img_name = request.getParameter("img_name");
		String subj = request.getParameter("subj");
		String t_num = request.getParameter("t_num");
		String m_num = request.getParameter("m_num");
		String b_num = request.getParameter("b_num");
		String addr = request.getParameter("addr");
		String status = request.getParameter("status");
		String price = request.getParameter("price");
		String content = request.getParameter("content");
		
		
		forward = new ActionForward();
		forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
	
		
		return forward;
	}

}
