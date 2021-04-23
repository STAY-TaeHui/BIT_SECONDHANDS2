package kr.or.bit.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class ChekCurrentUser
 */
@WebServlet("/chekcurrentuser.ajax")
public class ChekCurrentUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChekCurrentUser() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is ChekCurrentUser.ajax");
    	
	      
	    String currentuser   = request.getParameter("currentuser");
    	SecondHandsDAO dao = new SecondHandsDAO();
    	JSONObject obj = dao.ChekCurrentUser(currentuser);
    	
    	 //System.out.println("상품문의 보낼 때 : " + arr);
    	
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(obj);
        
       
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
