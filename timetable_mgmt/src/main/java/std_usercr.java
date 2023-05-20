

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class std_usercr
 */
@WebServlet("/std_usercr")
public class std_usercr extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public std_usercr() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String std_name = request.getParameter("std_name");
		String std_eno = request.getParameter("eno");
		String std_pass = request.getParameter("pass");
		String hid = request.getParameter("hid");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			String sql = "";
			if(hid.equals("S")) {
				System.out.println("Creating Student");
				sql = "INSERT INTO users (name,user_name,pass,role) values('"+std_name+"','"+std_eno+"','"+std_pass+"','S')";
				stmt.execute(sql);
				System.out.println("Student Created!");
				response.sendRedirect("admin_stdcre.jsp");
			}
			else {
				System.out.println("Creating Faculty");
				sql = "INSERT INTO users (name,user_name,pass,role) values('"+std_name+"','"+std_eno+"','"+std_pass+"','F')";
				stmt.execute(sql);
				System.out.println("Faculty Created!");
				response.sendRedirect("admin_faccre.jsp");
			}
			
			
			
			
			
		}	
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
