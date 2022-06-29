package controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
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

import Dao.CategoryDAO;
import Dao.ProductDAO;
import entities.Category;
import entities.Product;
import entities.User;

/**
 * Servlet implementation class ProductServerlet
 */
@MultipartConfig
@WebServlet({ "/Products/index", "/Products/create", "/Products/store", "/Products/edit", "/Products/update", "/Products/delete",
"/Products/show" })
public class ProductServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private ProductDAO prDAO;
       private CategoryDAO categoryDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServerlet() {
        super();
        this.prDAO = new ProductDAO();
        this.categoryDAO = new CategoryDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String idstr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idstr);
			Product pd = this.prDAO.findById(id);
			this.prDAO.Delete(pd);
			response.sendRedirect("/Web_QuanAo" + "/users/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		try {
			String idStr = request.getParameter("id");
			int id = Integer.parseInt(idStr);
			List<Category> category = this.categoryDAO.all();
			request.setAttribute("ctg", category);
			Product entity = this.prDAO.findById(id);
			request.setAttribute("pd", entity);
			request.setAttribute("view", "/view/admin/products/editProduct.jsp");
			request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> category = this.categoryDAO.all();
		request.setAttribute("ctg", category);
		request.setAttribute("view", "/view/admin/products/createProducts.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
		
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date now = new Date();
		List<Product> pd = this.prDAO.all();
		request.setAttribute("now", now);
		request.setAttribute("ds", pd);
		request.setAttribute("view", "/view/admin/products/indexProducts.jsp");
		request.getRequestDispatcher("/view/NewHome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String idstr = request.getParameter("id");
		try {
			System.out.println(idstr);
			int id = Integer.parseInt(idstr);
			Product pd = this.prDAO.findById(id);
			Product emtity = new Product();
			BeanUtils.populate(emtity, request.getParameterMap());
			int id1 = Integer.parseInt(request.getParameter("category_id"));
			Category ctg = this.categoryDAO.findById(id1);
			emtity.setCategory(ctg);
			String readfile = request.getServletContext().getRealPath("/images");
			File dir = new File(readfile);
			Part photo = request.getPart("img"); // file hình
			if (photo.getSize()<=0) {
				emtity.setImg(pd.getImg());
			}else {
				File photoFile = new File(dir, photo.getSubmittedFileName());
				photo.write(photoFile.getAbsolutePath());
				String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
				emtity.setImg(filename);
			}
			this.prDAO.Update(emtity);
			request.setAttribute("user", pd);
			response.sendRedirect("/Web_QuanAo" + "/Products/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		try {
			Product product = new Product();
			BeanUtils.populate(product, request.getParameterMap());
			int id = Integer.parseInt(request.getParameter("category_id"));
			Category ctg = this.categoryDAO.findById(id);
			product.setCategory(ctg);
			
			String readfile = request.getServletContext().getRealPath("/images");
			File dir = new File(readfile);
			Part photo = request.getPart("img"); // file hình
			if (!Files.exists(Path.of(readfile))) {
				Files.createDirectory(Path.of(readfile));
			}
			File photoFile = new File(dir, photo.getSubmittedFileName());
			photo.write(photoFile.getAbsolutePath());
			String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
			product.setImg(filename);
			this.prDAO.create(product);
			session.setAttribute("message", "Thêm mới thành công");
			response.sendRedirect("/Web_QuanAo" + "/Products/index");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
