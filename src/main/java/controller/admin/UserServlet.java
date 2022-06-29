package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import Dao.UserDAO;
import Utils.EncryptUtil;
import entities.User;

@MultipartConfig
@WebServlet({ "/users/index", "/users/create", "/users/store", "/users/edit", "/users/update", "/users/delete",
		"/users/show" })
public class UserServlet extends HttpServlet {
	private UserDAO userDAO;

	public UserServlet() {
		super();
		this.userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
		} else if (uri.contains("show")) {
			this.show(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			// 404
		}
	}

	private void Login(HttpServletRequest request, HttpServletResponse response) {

	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String idstr = request.getParameter("id");
		try {
			System.out.println(idstr);
			int id = Integer.parseInt(idstr);
			User u = this.userDAO.findById(id);
			User newValue = new User();
			BeanUtils.populate(newValue, request.getParameterMap());

			newValue.setPassword(u.getPassword());
			this.userDAO.Update(newValue);
			request.setAttribute("user", u);
			response.sendRedirect("/Web_QuanAo" + "/users/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		try {
				User entity = new User();
				BeanUtils.populate(entity, request.getParameterMap());
				String encrypted = EncryptUtil.encrypt(request.getParameter("password"));
				entity.setPassword(encrypted);

				String readfile = request.getServletContext().getRealPath("/images");
				File dir = new File(readfile);
				if (request.getPart("avatar").getSize() > 0) {
					Part photo = request.getPart("avatar"); // file hình
					if (!Files.exists(Path.of(readfile))) {
						Files.createDirectory(Path.of(readfile));
					}
					File photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());
					String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
					entity.setAvatar(filename);
						this.userDAO.create(entity);
						session.setAttribute("message", "Thêm mới thành công");
						response.sendRedirect("/Web_QuanAo" + "/users/index");
				}
		}		
			catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Thêm mới thất bại");
			response.sendRedirect("/Web_QuanAo" + "/users/create");
			// TODO: handle exception

		}

	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date now = new Date();

		List<User> ds = this.userDAO.all();
		request.setAttribute("now", now);
		request.setAttribute("ds", ds);
		request.setAttribute("view", "/view/users/index.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "/view/users/create.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			User entity = this.userDAO.findById(id);
			request.setAttribute("user", entity);
			request.setAttribute("view", "/view/users/edit.jsp");
			request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
		} catch (Exception e) {

		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idstr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idstr);
			User u = this.userDAO.findById(id);
			this.userDAO.Delete(u);
			response.sendRedirect("/Web_QuanAo" + "/users/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
}