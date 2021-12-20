package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DetailCart;
import beans.Discount;
import beans.Products;
import beans.Users;
import conn.DBConnection;
import utils.CartUtils;
import utils.CategoryUtils;
import utils.DBUtils;
import utils.ProductUtils;
import utils.SessionUtils;

/**
 * Servlet implementation class UserCart
 */
@WebServlet("/User-Cart")
public class UserCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String NULL = null;
       
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
		 Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
		 //System.out.println(us.getCartID().getTotal());
		 Connection conn = null;
		 try {
			 
			 conn = DBConnection.getConnection();
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
		String action = request.getParameter("action");
		Connection conn = null;
		List<DetailCart> list = null;
		 try {
				Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
				conn = DBConnection.getConnection();

				if(action != null && action.equalsIgnoreCase("checkout")){
					int total = CartUtils.findProWithStatusIsOne(conn, us.getCartID().getCartID());
					if(total !=0)
					{
						List<DetailCart> listDetailCart = null;
						listDetailCart = CartUtils.GetListProWithStatusIsOne(conn, us.getCartID().getCartID());
						System.out.println(listDetailCart.size()+"------------------------------------------------------");
						request.setAttribute("detailCartList", listDetailCart);
						RequestDispatcher rd=  request.getRequestDispatcher ("/WEB-INF/views/web/checkout.jsp"); 
						rd.forward (request, response);
					}else {
						request.setAttribute("showModal","What products do you need to buy?");
						doGet(request, response);
					}
					return;
				}
				else {
					if (action != null && action.equals("addDiscountID")) {
						String discountID = request.getParameter("discountID");
						Discount dis= CartUtils.getDiscountID(conn, discountID);
						response.setContentType("text/html");
						response.setCharacterEncoding("UTF-8");
						PrintWriter out = response.getWriter();
						if (dis != null)
						{
				            out.print (dis.getDesDiscount());
				            CartUtils.UpdateDisIDForUserCart(conn, dis.getDiscountID() , us.getUsername());
				            
						}else {
							out.print ("This code for discount have expired Or You had press the error code.");
							return;
						}
					}
					else if (action != null && action.equals("removeDiscountID")) {
						CartUtils.UpdateDisIDForUserCart(conn,NULL, us.getUsername());
						response.setContentType("text/html");
						response.setCharacterEncoding("UTF-8");
						PrintWriter out = response.getWriter();
						out.print ("Your code is deleted");
					}
					else {
						int proID = Integer.parseInt(request.getParameter("productID"));
						if (action.equalsIgnoreCase("changeStatus"))
						{
							int status = Integer.parseInt(request.getParameter("status"));
							CartUtils.changeStatus(conn, us.getCartID().getCartID(), proID, status);
						}
						else if(action.equalsIgnoreCase("changeQuantity")){
							int quantity = Integer.parseInt(request.getParameter("quantity"));
							CartUtils.InsertDetailCart(conn, us.getCartID().getCartID(), proID, quantity);
						}
					}
					Users model = DBUtils.findUserByID(conn, us.getUsername() , us.getPassword());
					SessionUtils.getInstance().putValue(request, "USERMODEL", model);
				}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
