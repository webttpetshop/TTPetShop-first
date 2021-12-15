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
 * 
 * tam thời ko sử dụng cái này nha hihi
 */
@WebServlet("/admin-home")
public class admin_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_Controller() {
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
		List<Users> list1 = null;
		int totalpage = 3;
		try {
			String spageid= request.getParameter ("page") ; //tìm ra id của phần tử đầu tiên của trang
			if (spageid== null)
					spageid="1";
			int pageid= Integer.parseInt(spageid);
			//int totalitem = 3; // số item trên 1 trang
			/*if (pageid==1){}
			else{
			    pageid=pageid-1;
			    pageid=pageid*totalitem +1;
			}*/
		   list = DBUtils.getRcord(conn, pageid, totalpage);
		   System.out.println("connect listUsersByPage successfully!");
		   list1 = DBUtils.listUser(conn);
		 } catch (SQLException e) {
		    e.printStackTrace();
		 }

		request.setAttribute("userList", list);
		int total = list1.size()/totalpage;  // tổng số trang
		System.out.println(list.size());
		if((list1.size() % totalpage) !=0)
			total++;
		request.setAttribute("total",total );
		// Forward sang /WEB-INF/views/productListView.jsp
		response.setContentType("text/html;charset-UTF-8");
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/admin-home.jsp");
		dispatcher.forward(request, response);
		//response.sendRedirect (request.getContextPath()+"/adminListUserByPage?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
