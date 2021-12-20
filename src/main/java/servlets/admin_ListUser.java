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

import beans.Users;
import conn.DBConnection;
import utils.DBUtils;

/**
 * Servlet implementation class admin_ListUser
 */
@WebServlet("/admin-ListUser")
public class admin_ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_ListUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();

			List<Users> list = null;
			List<Users> list1 = null;
			int totalpage = 3;
			
			String spageid= request.getParameter ("page") ; //tìm ra id của phần tử đầu tiên của trang
			if (spageid== null)
					spageid="1";
			int pageid= Integer.parseInt(spageid);
			list = DBUtils.getRcord(conn, pageid, totalpage);
			System.out.println("connect listUsersByPage successfully!");
			list1 = DBUtils.listUser(conn);

			request.setAttribute("userList", list);
			int total = list1.size()/totalpage;  // tổng số trang
			System.out.println(list.size());
			if((list1.size() % totalpage) !=0)
				total++;
			request.setAttribute("total",total );
			// Forward sang /WEB-INF/views/productListView.jsp
			response.setContentType("text/html;charset-UTF-8");
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/admin/listUser.jsp");
			dispatcher.forward(request, response);
			
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
		String action= request.getParameter("action");
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		    if(action != null)
		    {
		    	String Username= request.getParameter("Username");
		    	if(action.equalsIgnoreCase("findUser"))
		    	{
		    		System.out.println("begin servlet");
		    		response.setContentType("application/json");
		    		response.setCharacterEncoding("UTF-8");
		    		Users us = DBUtils.findUserByUsername(conn, Username);
		    		Gson gson = new Gson();
		    		PrintWriter writer = response.getWriter();
		    		writer.print(gson.toJson(us));
		    		writer.flush();
		    		writer.close();
		    		return;
		    	}
		    	else {
			    	//String Username= request.getParameter("Username");
			    	String fullname= new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
			    	String Email= request.getParameter("Email");
			    	String password= request.getParameter("password");
			    	String address= new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
			    	String phone= request.getParameter("phone");
			    	String role= request.getParameter("role");
			    	if(action.equalsIgnoreCase("addUser"))
			    	{
				    	DBUtils.addUser(conn, Username, fullname, Email, password, address, phone, role);
			    	}
			    	else if(action.equalsIgnoreCase("editUser")){
						DBUtils.editUser(conn, Username, fullname, Email, password, address, phone, role);
					}
			    	doGet(request, response);
				}

		    }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
