package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.utility.ConnectionJDBCFactory;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			PrintWriter out=response.getWriter();
			boolean status=false;
			Connection conn=null;
			PreparedStatement ps=null;
			String email=request.getParameter("email");
			String userpass=request.getParameter("userpass");
			String sql="select * from supervisor where email=? or username=? and userpass=?";
			conn=ConnectionJDBCFactory.getInstance().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, email);
			ps.setString(3, userpass);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			HttpSession session=request.getSession();
			if(status){

				System.out.print("hi");
				String username=rs.getString(2);
				email=rs.getString(3);
				session.setAttribute("email", email);
				session.setAttribute("username",username);
				session.setAttribute("islogin","plz sign in first");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("Error","Sorry! Password or username error!");
				session.setAttribute("Loginmsg", "Plz sign in first..");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    service(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 service(request, response);
	}
}
