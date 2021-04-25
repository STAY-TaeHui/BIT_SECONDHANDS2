package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

import kr.or.bit.service.LoginOkAction;
import kr.or.bit.service.manageshop.ManageShopAction;
import kr.or.bit.service.manageshop.ManageShopBuyListAction;
import kr.or.bit.service.manageshop.ManageShopSellListAction;
import kr.or.bit.service.myshop.MyShopInfoAction;

import kr.or.bit.service.manageshop.ManageShopAction;


/**
 * Servlet implementation class MyShopController
 */
@WebServlet({"/manageshop/*","*.list"})
public class ManageShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ManageShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ManageShopController");
		
		String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	System.out.println("THIS IS manageshop");
    	System.out.println("url_Command : "+url_Command);
    	Action action=null;
    	ActionForward forward=null;
    	HttpSession session =null;;
    	
    		//myshop 메인
		 if(url_Command.equals("/manageshop")) {
	    		System.out.println("manageshop.jsp VIEW");
	    		action = new ManageShopAction();
	    		forward = action.execute(request, response);
		 }
		 else if(url_Command.equals("/manageshop/buylist.list")) {
	    		System.out.println("managebuylist.jsp VIEW");
	    		action = new ManageShopBuyListAction();
	    		forward = action.execute(request, response);
		 }
		 else if(url_Command.equals("/manageshop/selllist.list")) {
	    		System.out.println("manageselllist.jsp VIEW");
	    		action = new ManageShopSellListAction(); 
	    		forward = action.execute(request, response);
		 }else if(url_Command.equals("/manageshop/selllist.list")) {
	    		System.out.println("manageselllist.jsp VIEW");
	    		action = new ManageShopSellListAction(); 
	    		forward = action.execute(request, response);
		 }
		 else if(url_Command.equals("/manageshop/review")) {
	    		System.out.println("review.jsp VIEW");
	    		forward = new ActionForward();
	    		forward.setRedirect(false);
	    		forward.setPath("/WEB-INF/views/manageshops/review.jsp");
		 }
		 else if(url_Command.equals("/manageshop/reviewok")) {
	    		System.out.println(request.getParameter("content"));
	    		System.out.println(request.getParameter("rating"));
	    		System.out.println(request.getParameter("buy_num"));
	    		System.out.println(request.getParameter("p_num"));
	    		System.out.println(request.getParameter("storename_buyer"));
		 }
		 

		 
    	//////////////////////////////////////////////////////
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			System.out.println("true");
    			System.out.println(forward.getPath());
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			System.out.println("false");
   			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
    			System.out.println(forward.getPath());
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
