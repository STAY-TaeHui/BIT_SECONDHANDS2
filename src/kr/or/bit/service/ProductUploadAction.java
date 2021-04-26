package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ProductUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		SecondHandsDAO dao = new SecondHandsDAO();

		String storename = request.getParameter("storename");
		String img_name = request.getParameter("imgs_name");
		String subj = request.getParameter("subj");
		String b_num = request.getParameter("bottom");
		String addr = request.getParameter("addr");
		String price = request.getParameter("price");
		String content = request.getParameter("content");

		String url = "";
		String icon = "";
		String msg = "";
		boolean b = false;
		boolean result = dao.productUpload(storename, subj, b_num, addr, price, content);
		int p_num = dao.productQuery();
		System.out.println("서비스 p_num :" + p_num);

		try {
			String[] imgs = img_name.split(",");
			for (int i = 0; i < imgs.length; i++) {
				System.out.println(" for문 imgs:" + imgs[i]);
				b = dao.productImgUpload(imgs[i], p_num, i + 1);
				if (b) {
					System.out.println("이미지 insert 성공");
					
				} else {
					System.out.println("이미지 insert 실패");
				}
			}

			System.out.println("subj :" + subj);
			System.out.println("b_num :" + b_num);
			System.out.println("addr :" + addr);
			System.out.println("price :" + price);
			System.out.println("content :" + content);

			// boolean result = dao.productUpload(imgs, storename, subj, b_num, addr, price,
			// content);

			if (result && b) {
				// url = "/WEB-INF/views/manageshop/managemyproducts.jsp";
				url = "index.do";
				icon = "success";
				msg = "등록 성공!";
			} else {
				url = "mysell.do";
				icon = "error";
				msg = "등록 실패..";
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		request.setAttribute("url", url);
		request.setAttribute("icon", icon);
		request.setAttribute("msg", msg);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WEB-INF/views/redirect/redirect.jsp");

		return forward;
	}
}