

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class login_check
 */
@WebServlet("/login_check")
public class login_check extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public login_check() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String message = "";
		response.setContentType("text/html");
		String user_name = request.getParameter("u_name");
		String pass = request.getParameter("pass");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
//			Statement stmt = con.createStatement();
//			System.out.println("inserting records");
//			String sql = "INSERT INTO users (user_name,pass,role) values('"+user_name+"','"+pass+"','S')";
//			stmt.execute(sql);
			PreparedStatement statement = con.prepareStatement("SELECT * FROM users WHERE user_name = ?");
			statement.setString(1, user_name);
			ResultSet resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
			    // username exists, check password
			    String passwordFromDb = resultSet.getString("pass");
			    if (passwordFromDb.equals(pass)) {
			        // login successful, password matches
			    	System.out.println("User found in the database");
			    	String role = resultSet.getString("role");
			    	if(role.equals("A")) {
			    		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminPanel.jsp");
				    	dispatcher.forward(request, response);
			    	}
			    	else if(role.equals("S")) {
			    		RequestDispatcher dispatcher = request.getRequestDispatcher("Student.jsp");
				    	dispatcher.forward(request, response);
			    	}
			    	else {
			    		//for faculty time-table
			    		HttpSession session = request.getSession();
			    		session.setAttribute("userid", user_name);
			    		String username = (String) session.getAttribute("userid");
			    		System.out.println("Session Variable: "+username);
			    		
			    		
			    		RequestDispatcher dispatcher = request.getRequestDispatcher("Faculty.jsp");
				    	dispatcher.forward(request, response);
				    	
			    	}
			    } 
			    else {
			    	message = "Password Wrong";
			    	request.setAttribute("message", message);
			    	RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			    	dispatcher.forward(request, response);
	
			    	System.out.println("password wrong");
			        // login failed, password does not match
			    }
			} 
			else {
				message = "Username not found! Contact to Admin";
		    	request.setAttribute("message", message);
		    	RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		    	dispatcher.forward(request, response);

				System.out.println("username not found");
			    // username does not exist
			}
			
		}	
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
