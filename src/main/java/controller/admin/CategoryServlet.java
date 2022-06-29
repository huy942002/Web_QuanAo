package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Dao.CategoryDAO;
import Dao.UserDAO;
import entities.Category;
import entities.User;
@MultipartConfig
@WebServlet({ "/categories/index", "/categories/create", "/categories/store", "/categories/edit", "/categories/update", "/categories/delete",
"/categories/show" })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private CategoryDAO categoryDAO;
    public CategoryServlet() {
        super();
        this.userDAO = new UserDAO();
        this.categoryDAO = new CategoryDAO();
    }

	protected void doGet(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
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

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void show(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			Category cate = this.categoryDAO.findById(id);
			request.setAttribute("cate", cate);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<User> ds = this.userDAO.all();
//		request.setAttribute("dsUser", ds);
		request.setAttribute("view", "/view/admin/categories/create.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
		
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> category = this.categoryDAO.all();
		request.setAttribute("ctg", category);
		request.setAttribute("view", "/view/admin/categories/indexCategory.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp"    
		).forward(request, response);
		
	}

	protected void doPost(
		HttpServletRequest request,
		HttpServletResponse response
	) throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		}  else {
			// 404
		}
		
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
			String idString = request.getParameter("id");
			try {
				Category c = new Category();
				String ten = request.getParameter("ten");
				int id = Integer.parseInt(request.getParameter("id"));
				Category ct = this.categoryDAO.findById(id);
				c.setTen(ten);
				c.setId(id);
				c.setUserC(ct.getUserC());
				
				String readfile = request.getServletContext().getRealPath("/images");
				File dir = new File(readfile);
				Part photo = request.getPart("img"); // file hình
				if (photo.getSize()<=0) {
					c.setImg(ct.getImg());
				}else {
					File photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());
					String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
					c.setImg(filename);
				}
				this.categoryDAO.Update(c);
				response.sendRedirect("/Web_QuanAo" + "/categories/index");
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String ten = request.getParameter("ten");
		try {
			Category cate = new Category();
			User us= (User) session.getAttribute("user");
			String readfile = request.getServletContext().getRealPath("/images");
			File dir = new File(readfile);
			Part photo = request.getPart("img"); // file hình
			if (!Files.exists(Path.of(readfile))) {
				Files.createDirectory(Path.of(readfile));
			}
			File photoFile = new File(dir, photo.getSubmittedFileName());
			photo.write(photoFile.getAbsolutePath());
			String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
			cate.setImg(filename);
			cate.setTen(ten);
			cate.setUserC(us);
			this.categoryDAO.create(cate);
			response.sendRedirect("/Web_QuanAo" + "/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}