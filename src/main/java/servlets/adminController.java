package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;
import conn.DBConnection;
import utils.DBUtils;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/admin-list-user")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		 }

		List<Users> list = null;
		try {
		   list = DBUtils.listUser(conn);
		   System.out.println("connect listUsers successfully!");
		 } catch (SQLException e) {
		    e.printStackTrace();
		 }
		request.setAttribute("userList", list);
		int total = list.size()/2;
		System.out.println(list.size());
		if((total % 2) !=0)
			total++;
		request.setAttribute("total",total );
		// Forward sang /WEB-INF/views/productListView.jsp
		response.setContentType("text/html;charset-UTF-8");

		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/adminlistuser.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
