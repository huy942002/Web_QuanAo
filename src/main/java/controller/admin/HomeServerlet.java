package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CategoryDAO;
import Dao.ProductDAO;
import entities.Category;
import entities.Product;
import entities.User;

/**
 * Servlet implementation class HomeServerlet
 */
@WebServlet("/Home")
public class HomeServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO prdD;
	private Product prd;
	private CategoryDAO cate;
    public HomeServerlet() {
        super();
        this.prdD = new ProductDAO();
        this.cate = new CategoryDAO();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)  session.getAttribute("user");
		List<Product> listP = this.prdD.all();
		List<Category> lcate = this.cate.all();
		request.setAttribute("cate", lcate);
		request.setAttribute("listP", listP);
		request.setAttribute("user", user);
		request.setAttribute("view", "/view/home.jsp");
		request.getRequestDispatcher("/view/homeLayout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
