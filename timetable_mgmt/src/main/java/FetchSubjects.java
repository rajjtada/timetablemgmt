

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.google.gson.Gson;


/**
 * Servlet implementation class FetchSubjects
 */
@WebServlet("/FetchSubjects")
public class FetchSubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FetchSubjects() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String sem = request.getParameter("sem");
		String div = request.getParameter("div");

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			
			String sql = "SELECT subject_code FROM subjects where semester="+sem+" AND division='"+div+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			List<Integer> options = new ArrayList<>();
			
			
			while(rs.next()) {
				options.add(rs.getInt("subject_code"));
			}
			String json = new Gson().toJson(options);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    options.clear();
		    
//			response.sendRedirect("addSubjects.jsp");
		
	
		}	
		catch(Exception e) {
			System.out.println(e);
		}
		
//		List<String> options = new ArrayList<>();
//	    options.add("Option A");
//	    options.add("Option B");
//	    options.add("Option C");
//	    // Return the options as a JSON object
//	    String json = new Gson().toJson(options);
//	    response.setContentType("application/json");
//	    response.setCharacterEncoding("UTF-8");
//	    response.getWriter().write(json);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
