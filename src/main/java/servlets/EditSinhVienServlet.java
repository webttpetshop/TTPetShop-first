package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
 * Servlet implementation class EditSinhVienServlet
 */
@WebServlet("/editSinhVien")
public class EditSinhVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSinhVienServlet() {
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
		}
		catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		}
		String idStr = (String) request.getParameter("id");
		int id = 0;
		try {
		   id = Integer.parseInt(idStr); 
		} catch (Exception e) {}
		SinhVien sv = null;
		String errorString= null;
		try {
			  sv = DBUtils.findSinhVien(conn, id);
			} catch (SQLException e1) {
			 e1.printStackTrace();
			 errorString = e1.getMessage();
			}
			// KhÃ ng CA lá-i.
			// Sinh Vien khA ng tás"n tá ji A'ánf edit.
			// Redirect sang trang danh SAICH.
			if (errorString!= null && sv == null) {
			 response.sendRedirect(request.getServletPath() + "/sinhvienList");
			  return;
			}
			// LEu thA ng tin vA o request attribute traáw>c khi forward sang views
			request.setAttribute("errorString", errorString);
			request.setAttribute("sinhvien", sv);
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editSinhVienView.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= null;
		try {
		    conn =DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException e1) {
		    //TODO Auto-generated catch block
		    e1.printStackTrace();
		 }
		String idStr= (String)request.getParameter("id");
		String hoten = new String(request.getParameter("hoten").getBytes("ISO-8859-1"), "UTF-8");
		String diachi = new String(request.getParameter("diachi").getBytes("ISO-8859-1"), "UTF-8");
		int id = 0;
		try {
		    id = Integer.parseInt(idStr);
		 } catch (Exception e) {}
		SinhVien sv = new SinhVien(id, hoten, diachi);
		String errorString = null;
		try {
		   DBUtils.updateSinhVien(conn, sv);
		} catch (SQLException e1) {
			 e1.printStackTrace();
			 errorString = e1.getMessage();
		 }
		//LAPU thA ng tin vA o request attribute trePás>c khi forward sang views.
		request.setAttribute("errorString", errorString);
		request.setAttribute("sinhvien", sv);
		// Náu cA lán-i forward sang trang edit.
		if (errorString != null) {
		   RequestDispatcher dispatcher= request.getServletContext().getRequestDispatcher("/WEB-INF/views/editSinhVienView.jsp");
		   dispatcher.forward(request, response);
		}
		// Náou más thá»0 tám 't A'áeap.
		// Redirect sang trang danh SAICH sá En pháom.
		else {
		   response.sendRedirect(request.getContextPath() + "/sinhvienList");
		   }
	}
}
