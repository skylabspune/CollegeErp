package com.proj.users.hod;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.proj.Utils.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Creategroup
 */
@WebServlet("/Creategroup")
public class Creategroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Creategroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		out.print("inside get method");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PreparedStatement ps,ps1=null;
		PrintWriter out=response.getWriter();
		out.print("inside get POST..!!!");
		System.out.println("form data recived..");
		System.out.println("Student ID 1 recived is :"+request.getParameter("student1id"));
		System.out.println("Student ID 2 recived is :"+request.getParameter("student2id"));
		System.out.println("Student ID 3 recived is :"+request.getParameter("student3id"));
		System.out.println("Student ID 4 recived is :"+request.getParameter("student4id"));
		System.out.println("Recived Project title is :"+request.getParameter("projecttitle"));
		System.out.println("recived domain name is :"+request.getParameter("domain"));
		System.out.println("recived  fname is :"+request.getParameter("fname"));
		System.out.println("recived mid id "+request.getParameter("mid"));
		
		Connection con=DBClass.DBConnectMethod();
		try {
			ps=con.prepareStatement("insert into projectgroup values(?,?,?,?,?,?,?,?)");  //we are inserting the data in projectgroup table with ps and along 
																			//with this we are updating the mentee table with ps1 assignflag
																					//column to status to true.
			//int rs=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

}
