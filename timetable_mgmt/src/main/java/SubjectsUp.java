

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubjectsUp
 */
@WebServlet("/SubjectsUp")
public class SubjectsUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SubjectsUp() {
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
		String sem = request.getParameter("sem");
		String division = request.getParameter("div");
		String gtu_code = request.getParameter("gtu_code");
		String gtu_name = request.getParameter("gtu_name");
		System.out.println(division);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			System.out.println("Entering Subject Details");
			String sql = "INSERT INTO subjects values('"+sem+"','"+division+"','"+gtu_code+"','"+gtu_name+"')";
			
			stmt.execute(sql);
			System.out.println("Subject entered!");
			response.sendRedirect("addSubjects.jsp");
		
	
		}	
		catch(Exception e) {
			System.out.println(e);
		}
		
		
	}

}
