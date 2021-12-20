package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;
import conn.SQLServerConnection;
import utils.SessionUtils;

/**
 * Servlet implementation class insertUser
 */
@WebServlet("/insertUser")
public class insertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		try {
			conn=SQLServerConnection.initializeDatabase();
			PreparedStatement st=conn.prepareStatement("insert into Users values(?,?,?,?,?,?,0,0)");
			st.setString(1, request.getParameter("username"));
			st.setString(2, request.getParameter("email"));
			st.setString(3, request.getParameter("password"));
			st.setString(4, request.getParameter("fullname"));
			st.setString(5, request.getParameter("address"));
			st.setString(6, request.getParameter("phone"));
			st.executeUpdate();
			st.close();
			conn.close();
			response.sendRedirect(request.getContextPath()+"/home");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
