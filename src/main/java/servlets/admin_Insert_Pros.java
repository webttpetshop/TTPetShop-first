package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import beans.Categories;
import beans.Products;
import beans.Users;
import conn.DBConnection;
import utils.CategoryUtils;
import utils.DBUtils;
import utils.ProductUtils;

/**
 * Servlet implementation class admin_Insert_Pros
 */
@WebServlet("/admin-Inser-Pros")
@MultipartConfig(maxFileSize = 16177215)
public class admin_Insert_Pros extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResourceBundle resourceBundle = ResourceBundle.getBundle("messages");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_Insert_Pros() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		 }
		
		try {
			if (type.equals("edit"))
			{
				System.out.println("vao if nha"+type);
				int id = Integer.parseInt(request.getParameter("id"));
				Products pd;
				pd = ProductUtils.getProByID(conn, id);
				System.out.println(pd.getPrice());
				request.setAttribute("product", pd);
			}
			else
			{

				System.out.println("Not edit product");
			}

			List<Categories> listCat= null;
			listCat =CategoryUtils.getListCat(conn);
			request.setAttribute("categories", listCat);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.setContentType("text/html;charset-UTF-8");
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/insertPro.jsp");
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
		int productID=Integer.parseInt(request.getParameter("productID"));
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
		String description = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
		Double price= Double.parseDouble(request.getParameter("price")) ;
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int categoryID = Integer.parseInt(request.getParameter("categoryID"));
		int viewed = Integer.parseInt(request.getParameter("viewed"));

		InputStream inputStream = null; // input stream of the upload file
		String message = null;
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		System.out.println(request.getParameter("rating"));
		ProductUtils.InsertPro(conn, productID, name,description, price,quantity,categoryID,viewed,inputStream);
		response.sendRedirect (request.getContextPath()+"/admin-ListProduct");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			/*Connection conn = null;
			try {
			    conn = DBConnection.getConnection();
			int productID=Integer.parseInt(request.getParameter("productID"));
			String name = new String(request.getParameter("name"));
			String description = request.getParameter("description");
			Double price= Double.parseDouble(request.getParameter("price")) ;
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int categoryID = Integer.parseInt(request.getParameter("categoryID"));
			int viewed = Integer.parseInt(request.getParameter("viewed"));
			System.out.println(categoryID);
			InputStream inputStream = null; // input stream of the upload file
			// obtains the upload file part in this multipart request
			Part filePart = request.getPart("picture");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());

	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	        ProductUtils.InsertPro(conn, productID, name,description, price,quantity,categoryID,viewed,inputStream);
	        //response.sendRedirect (request.getContextPath()+"/adminListProduct");
			} catch (ClassNotFoundException | SQLException el) {
			   // TODO Auto-generated catch block
			    el.printStackTrace();
			    }*/
	}
	private ProductUtils fileUploadDao;

	@Override
	public void init() throws ServletException {
		fileUploadDao = new ProductUtils();
	}

}
