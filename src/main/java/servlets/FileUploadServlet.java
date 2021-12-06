package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
import conn.DBConnection;
import utils.CategoryUtils;
import utils.ProductUtils;

@WebServlet("/admin-Inser-Pros123")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*RequestDispatcher dispatcher = req.getServletContext()
				.getRequestDispatcher("/WEB-INF/file-upload.jsp");
		dispatcher.forward(req, resp);*/
		String type = req.getParameter("type");
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
				int id = Integer.parseInt(req.getParameter("id"));
				Products pd;
				pd = ProductUtils.getProByID(conn, id);
				System.out.println(pd.getProductID());
				req.setAttribute("product", pd);
			}
			else
			{
				List<Categories> listCat= null;
				listCat =CategoryUtils.getListCat(conn);
				req.setAttribute("categories", listCat);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.setContentType("text/html;charset-UTF-8");
		RequestDispatcher dispatcher = req.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/insertPro.jsp");
		dispatcher.forward(req, resp);
	}

	private static final long serialVersionUID = 1L;
	
	private ProductUtils fileUploadDao;

	@Override
	public void init() {
		fileUploadDao = new ProductUtils();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		Connection conn = null;
		try {
		    conn = DBConnection.getConnection();
		 } catch (ClassNotFoundException | SQLException el) {
		   // TODO Auto-generated catch block
		    el.printStackTrace();
		 }
		String firstName = request.getParameter("name");
		int lastName = Integer.parseInt(request.getParameter("categoryID"));

		InputStream inputStream = null; // input stream of the upload file
		System.out.println(firstName);
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

		ProductUtils.InsertPro(conn, 0, firstName,"aa", 111.0,111,lastName,111,inputStream);
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/listProduct.jsp");
		dispatcher.forward(request, response);
		
		/*// sets the message in request scope
        request.setAttribute("Message", message);
         
        // forwards to the message page
        getServletContext().getRequestDispatcher("/WEB-INF/message.jsp")
        .forward(request, response);*/
	}
}