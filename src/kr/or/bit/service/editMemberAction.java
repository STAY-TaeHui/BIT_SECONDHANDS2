package kr.or.bit.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class editMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String storename = "";
		String nameText = "";
		String originalPath = "";
		String msg = "";
		String url = "";
		String icon = "";
		String encType = "UTF-8";
		int maxFilesize = 5 * 1024 * 1024;
		String pathName = request.getServletContext().getRealPath("fileUpload");

		try {
			System.out.println("edit 시작아아아악");
			MultipartRequest mr = new MultipartRequest(request, pathName, maxFilesize, encType,
					new DefaultFileRenamePolicy());

			storename = mr.getParameter("storename");
			nameText = mr.getParameter("nameText");
			originalPath = mr.getParameter("originalPath");
			File changeFile = mr.getFile("file");
			String changeFilePath = changeFile.getPath();
			System.out.println("edit 상점이름" + storename);
			System.out.println("edit 바꿀파일경로" + changeFilePath);
			System.out.println("edit 바꿀상점이름" + nameText);
			String profile = changeFilePath.substring(changeFilePath.lastIndexOf('\\') + 1, changeFilePath.length());
			System.out.println("edit 파일이름" + profile);
			System.out.println("edit 오리지널 파일이름" + originalPath);

			SecondHandsDAO dao = new SecondHandsDAO();

			if (profile == "") {
				profile = originalPath;
				System.out.println("사진이 비어 오리지날로 변경됩니다" + originalPath);
			}
			if (nameText == "") {
				nameText = storename;
				System.out.println("바꿀 이름이 비어 기존 이름으로 변경됩니다" + nameText);
			}

			boolean result = dao.updateMemberProfile(profile, nameText, storename);

			if (result) {
				msg = "수정 성공";
				icon = "success";

				File f = new File(pathName);
				if (!f.exists()) {
					f.mkdirs();
				}

			} else {
				msg = "수정 실패";
				icon = "error";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		url = "myshop.do?storename=" + nameText;
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("icon", icon);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WEB-INF/views/redirect/redirect.jsp");

		return forward;
	}

}
