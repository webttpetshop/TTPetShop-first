package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.sym;

import beans.Bill;
import beans.DetailCart;
import beans.Users;
import conn.DBConnection;
import utils.BillUtils;
import utils.DBUtils;
import utils.SessionUtils;

/**
 * Servlet implementation class profile_Controller
 */
@WebServlet(name = "profile", urlPatterns = { "/User-profile" })
public class profile_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Null = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profile_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		List<Bill> list_wait = null;
		List<Bill> list_delivering = null;
		List<Bill> list_received = null;
		 Users us =(Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
		 Connection conn = null;
		 try {
			 
			 conn = DBConnection.getConnection();
			 list_wait = DBUtils.GetBillByUsernameAndStatus(conn,us.getUsername(), 0, -1);
			 list_delivering=DBUtils.GetBillByUsernameAndStatus(conn,us.getUsername(), 1, 1 );
			 list_received=DBUtils.GetBillByUsernameAndStatus(conn,us.getUsername(), 2, 2 );
			 request.setAttribute("list_wait", list_wait);
			 request.setAttribute("list_delivering", list_delivering);
			 request.setAttribute("list_received", list_received);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/web/Profile.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action= request.getParameter("action");
		System.out.println(action);
		try {
			Connection conn = null;
		    conn = DBConnection.getConnection();
		    if(action != null && action.equalsIgnoreCase("editUser"))
		    {
		    	String Username= request.getParameter("Username");
		    	String fullname= new String(request.getParameter("fullname").getBytes("ISO-8859-1"), "UTF-8");
		    	String Email= request.getParameter("Email");
		    	String password= request.getParameter("password");
		    	String address= new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
		    	String phone= request.getParameter("phone");
		    	DBUtils.editUser(conn, Username, fullname, Email, password, address, phone, Null);
				Users model = DBUtils.findUserByUsername(conn, Username);
				SessionUtils.getInstance().putValue(request, "USERMODEL", model);
				doGet(request, response);
		    	
		    }else if (action != null && action.equalsIgnoreCase("CancelOrder")) {
		    	String billID=request.getParameter("billID");
		    	System.out.println(billID+"---------------------------");
		    	BillUtils.cancelOrder(conn, billID);
		    	doGet(request, response);
			}else if (action != null && action.equalsIgnoreCase("received")) {
				int billID=Integer.parseInt(request.getParameter("IDBILL"));
				BillUtils.ReceivedBill(conn, billID);
		    	doGet(request, response);
			}
		    
		    
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
