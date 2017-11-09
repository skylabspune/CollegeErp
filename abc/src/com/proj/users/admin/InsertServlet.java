package com.proj.users.admin;
import java.sql.*;
import java.util.Random;

import com.proj.Utils.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String type=request.getParameter("type");
		out.println("Form data recived");
		out.println("uname :"+uname);
		out.println("type : "+type);
		
		Random r=new Random();
		int numb=1000+(int)(r.nextFloat()*12348);
		String rpassword=String.valueOf(numb);
		try{

			con=DBClass.DBConnectMethod();
			ps=con.prepareStatement("select * from "+request.getParameter("type")+" where uname=? and password=?");
			ps.setString(1,uname);
			ps.setString(2,rpassword);
			rs=ps.executeQuery();
			
				if(rs.next()){
					Random r1=new Random();
					int numb1=1000+(int)(r.nextFloat()*32457);
					String rpassword1=String.valueOf(numb1);
					
					ps=con.prepareStatement("insert into "+type+" values(?,?,?,?,?,?,?,?,?)");
					ps.setInt(1,0);
					ps.setString(2,"null");
					ps.setString(3,"null");
					ps.setString(4,request.getParameter("dname"));
					ps.setString(5,"null");
					ps.setString(6,"null");
					ps.setString(7,request.getParameter("uname"));
					ps.setString(8,rpassword);
					ps.setString(9,"null");
					int rs1=ps.executeUpdate();
					out.println("Record inserted Success  when rs.next() is true: "+rs1);
					response.sendRedirect("admin.jsp");	
				}
				else{
					
					ps=con.prepareStatement("insert into "+type+" values(?,?,?,?,?,?,?,?,?)");
					ps.setInt(1,0);
					ps.setString(2,"null");
					ps.setString(3,"null");
					ps.setString(4,request.getParameter("dname"));
					ps.setString(5,"null");
					ps.setString(6,"null");
					ps.setString(7,request.getParameter("uname"));
					ps.setString(8,rpassword);
					ps.setString(9,"null");
					int rs2=ps.executeUpdate();
					out.println("Record inserted Success  when rs.next() is false: "+rs2);
					response.sendRedirect("admin.jsp");	
				}
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
			out.println(e);
			e.printStackTrace();
		}
		
	}

}
