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

import beans.SinhVien;
import conn.DBConnection;
import utils.DBUtils;

/**
 * Servlet implementation class SinhVienListServlet
 */
@WebServlet(name="sinhvienList", urlPatterns =  { "/sinhvienList" }) 

public class SinhVienListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SinhVienListServlet() {
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

		List<SinhVien> list = null;
		try {
		   list = DBUtils.listSinhvien(conn);
		   System.out.println("connect listSV successfully!");
		 } catch (SQLException e) {
		    e.printStackTrace();
		 }
		request.setAttribute("sinhvienList", list);
		// Forward sang /WEB-INF/views/productListView.jsp
		response.setContentType("text/html;charset-UTF-8");
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/sinhvienListView.jsp");
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
