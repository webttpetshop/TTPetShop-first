package servlets;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Products;
import beans.Users;
import conn.DBConnection;
import utils.CartUtils;
import utils.CategoryUtils;
import utils.DBUtils;
import utils.ProductUtils;
import utils.SessionUtils;

/**
 * Servlet implementation class homeController
 */
@WebServlet(urlPatterns = {"/home","/log-out","/log-in"})
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResourceBundle resourceBundle = ResourceBundle.getBundle("messages");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		List<Products> list = null;
		Connection conn = null;
		try {
			if (action != null && action.equals("login")) {
			    String message =  request.getParameter("message");
			    String alert = request.getParameter("alert");
			    if (message != null && alert != null) {
			        request.setAttribute ("message", resourceBundle.getString(message));
			        request.setAttribute("alert", alert);
			    }
			    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/web/login.jsp");
			    rd.forward (request, response);
			 } else if (action != null && action.equals("logout")) {
			    SessionUtils.getInstance().removeValue (request, "USERMODEL");
			    response.sendRedirect(request.getContextPath() +"/home");
			 } else if(action != null && action.equals("search")) {
				 String searchString = request.getParameter("searchString");
				 if (searchString.isEmpty())
				 {
					 System.out.println("null search");
					 response.sendRedirect(request.getContextPath() +"/home");
				 }
				 else {
					 System.out.println(searchString);
					 request.getSession().setAttribute("searchString", searchString); 
					 response.sendRedirect(request.getContextPath() +"/User-Search");
				}
			}
			 else {
					 conn = DBConnection.getConnection();
					 
					 list = ProductUtils.listPro(conn); 
			 
					 request.setAttribute("Categories", CategoryUtils.getListCat(conn));
					 request.setAttribute("proList", list);
					 RequestDispatcher rd=  request.getRequestDispatcher ("/WEB-INF/views/web/TTPetShopHome.jsp"); 
					 //RequestDispatcher rd=  request.getRequestDispatcher ("/WEB-INF/views/web/checkout.jsp"); 
					 rd.forward (request, response);
					 }
		   
		 } catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		 }
		if (action != null && action.equals("login")) {
			
			String username= request.getParameter ("username");
			String pass= request.getParameter ("pass");
		    Users model = null;
			try {
				model = DBUtils.findUserByID(conn, username, pass);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   if (model != null) {
			   SessionUtils.getInstance().putValue(request, "USERMODEL", model);
		       if (model.getRole()==0) {
		            response.sendRedirect (request.getContextPath()+"/home");
		       } else
		            //response.sendRedirect (request.getContextPath()+"/adminListUserByPage?page=1");
		    	   response.sendRedirect (request.getContextPath()+"/admin-home");
		   } else
		        response.sendRedirect (request.getContextPath () +"/log-in?action=login&message=username_password_invalid&alert=danger");
			}
		else {
			System.out.println("add to detailcart");
			Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
			System.out.println(request.getParameter("productID"));
			int proID =Integer.parseInt(request.getParameter("productID"));
			try {
				CartUtils.InsertDetailCart(conn, us.getCartID().getCartID(), proID, 1);
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
	            out.print ("Sản Phẩm Đã Được Thêm Vào Giỏ Hàng");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("add to detailcart");
		}
	}
}
