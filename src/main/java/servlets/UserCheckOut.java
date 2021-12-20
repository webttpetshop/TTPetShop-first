package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;
import conn.DBConnection;
import utils.BillUtils;
import utils.SessionUtils;

/**
 * Servlet implementation class UserCheckOut
 */
@WebServlet("/User-CheckOut")
public class UserCheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		Connection conn = null;
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
		System.out.println(us.getUsername());
		try {
			conn = DBConnection.getConnection();
			BillUtils.MapFromCartToBill(conn, us.getUsername(), us.getCartID().getCartID());
			out.print ("Order Successfully");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
