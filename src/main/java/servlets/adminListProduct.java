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

import beans.*;
import conn.DBConnection;
import utils.*;

/**
 * Servlet implementation class adminListProduct
 */
@WebServlet("/adminListProduct")
public class adminListProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminListProduct() {
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

		List<Products> list = null;
		List<Products> list1 = null;
		int totalpage = 20;
		try {
			String spageid= request.getParameter ("page") ; //tìm ra id của phần tử đầu tiên của trang
			if (spageid== null)
					spageid="1";
			int pageid= Integer.parseInt(spageid);
			//int totalitem = 15; // số item trên 1 trang
			/*if (pageid==1){}
			else{
			    pageid=pageid-1;
			    pageid=pageid*totalitem +1;
			}*/
		   list = ProductUtils.getRcord(conn, pageid, totalpage);
		   System.out.println("connect listProductPage successfully!");
		   //list1 = ProductUtils.listPro(conn);
		 } catch (SQLException e) {
		    e.printStackTrace();
		 }

		request.setAttribute("proList", list);
		int total = list.size()/totalpage;  // tổng số trang
		System.out.println(list.size());
		if((total % totalpage) !=0)
			total++;
		request.setAttribute("total",total );
		//request.setAttribute("showModal", "showModal");
		// Forward sang /WEB-INF/views/productListView.jsp
		response.setContentType("text/html;charset-UTF-8");
		
		/*RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/adminListProduct.jsp");*/
		RequestDispatcher dispatcher = request.getServletContext()
		.getRequestDispatcher("/WEB-INF/views/admin/listProduct.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		 }
		String type = request.getParameter("type");
		for (String id : request.getParameterValues("productID"))
		{
			ProductUtils.delProByID(conn, id);
		}
		response.sendRedirect (request.getContextPath()+"/adminListProduct");
	}

}
