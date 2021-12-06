package filter;
import conn.*;
import utils.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import beans.Users;

import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class JDBCFilter
 */
@WebFilter(filterName="/JDBCFilter", urlPatterns = {"/*"})
public class JDBCFilter extends Filter {

    /**
     * Default constructor. 
     */
    public JDBCFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response =(HttpServletResponse) servletResponse;
		String url = request.getServletPath(); 
		System.out.println("--------------------------------------");
		System.out.println(url);
		if (url.startsWith("/admin")) {
			Users model = (Users) SessionUtils.getInstance().getValue(request, "USERMODEL");
			if (model != null) {
				if (model.getRole()==1) {
					System.out.println("1");
					chain.doFilter(servletRequest, servletResponse);
				}else{
					System.out.println("2");
					response.sendRedirect(request.getContextPath ()+"/log-in?action=login&message=not_permission&alert=danger");
				} 
			}else {
				System.out.println("2");
				response.sendRedirect (request.getContextPath() +"/log-in?action=login&message=not_login&alert=danger");
			}
		}else{
			System.out.println("3");
			chain.doFilter(servletRequest, servletResponse);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	
}
