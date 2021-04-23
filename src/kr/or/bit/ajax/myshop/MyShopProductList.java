package kr.or.bit.ajax.myshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.dao.SecondHandsDAO;


@WebServlet("/MyShopProductList.ajax")
public class MyShopProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyShopProductList() {
        super();
    }
 
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("THIS IS MSPL.ajax");
    	String storename = request.getParameter("storename");
		SecondHandsDAO dao = new SecondHandsDAO();
		JSONArray  arr =  dao.getMyProductList(storename);

		request.setAttribute("count", arr.size());
        response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(arr);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
