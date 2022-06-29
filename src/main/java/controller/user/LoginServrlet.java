package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import Dao.UserDAO;
import Utils.EncryptUtil;
import entities.User;

/**
 * Servlet implementation class LoginServrlet
 */
@WebServlet({"/login","/logout"})
public class LoginServrlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private UserDAO userDAO;
    public LoginServrlet() {
        super();
        this.userDAO = new UserDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "/view/Login.jsp");
		request.getRequestDispatcher("/view/homeLayout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email"),
			pwd = request.getParameter("password");
		
		User user = this.userDAO.findByEmail(email);
		boolean check = EncryptUtil.check(pwd,
			user.getPassword());
		if (check == true) {
		    	session.setAttribute("user", user);
		    	if(user.getVaiTro()<=1) {
		    		response.sendRedirect("/Web_QuanAo" + "/users/index");
		    	}else {
		    		response.sendRedirect("/Web_QuanAo" + "/Home");
		    	}
		} else {
			// Đăng nhập thất bại			
		}
		
	}

}
