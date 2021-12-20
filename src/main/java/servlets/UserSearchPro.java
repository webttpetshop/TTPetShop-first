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

import com.google.gson.Gson;

import beans.Discount;
import beans.Products;
import conn.DBConnection;
import utils.CartUtils;
import utils.ProductUtils;

/**
 * Servlet implementation class UserSearchPro
 */
@WebServlet("/User-Search")
public class UserSearchPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSearchPro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchString = (String)request.getSession().getAttribute("searchString");
		System.out.println(searchString);
		List<Products> list = null;
		Connection conn = null;
		try {
			 conn = DBConnection.getConnection();
			 String maxPrice =request.getParameter("max") ;
			 String minPrice =request.getParameter("min");
			 String rate = request.getParameter("rate");
			 System.out.println(maxPrice+"----------------------------------------------------?????");
			 System.out.println(minPrice+"----------------------------------------------------?????");
			 System.out.println(rate +"----------------------------------------------------?????");// 
			 list= ProductUtils.searchPro(conn, searchString,maxPrice, minPrice, rate);
			 System.out.println(list.size()+"----------------------;;;;;;;;;;;;;;;;;");
			 request.setAttribute("proList", list);
			 /*String action = request.getParameter("action");
			 if(action != null)
			 {
				 if(action.equalsIgnoreCase("searchFilter"))
				 {
					 Gson gson= new Gson();
					 PrintWriter out = response.getWriter();
					 out.print(gson.toJson(gson.toJson(list)));
					 out.flush();
					 out.close(); 
				 }
			 }
			 else {*/
				 RequestDispatcher rd=  request.getRequestDispatcher ("/WEB-INF/views/web/searchPro.jsp"); 
				 rd.forward (request, response);
			 //}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
