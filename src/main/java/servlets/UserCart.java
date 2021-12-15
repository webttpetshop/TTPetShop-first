package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DetailCart;
import beans.Products;
import beans.Users;
import conn.DBConnection;
import utils.CartUtils;
import utils.CategoryUtils;
import utils.ProductUtils;
import utils.SessionUtils;

/**
 * Servlet implementation class UserCart
 */
@WebServlet("/User-Cart")
public class UserCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DetailCart> list = null;
		 Connection conn = null;
		 try {
			 
			 conn = DBConnection.getConnection();
			 Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
			 list = CartUtils.getLstDetailCarts(conn, us.getCartID().getCartID());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		request.setAttribute("detailCartList", list);
		RequestDispatcher rd=  request.getRequestDispatcher ("/WEB-INF/views/web/detailCart.jsp"); 
		   rd.forward (request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
