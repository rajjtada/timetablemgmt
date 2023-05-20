

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
 * Servlet implementation class timeTableEntry
 */
@WebServlet("/timeTableEntry")
public class timeTableEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public timeTableEntry() {
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
		String subject = request.getParameter("sub");
		String fac = request.getParameter("fac");
		String day = request.getParameter("weekday");
		String slot = request.getParameter("time_slot");
		
		System.out.println(sem);
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			
			System.out.println("Entering in Timetables!");
			String sql ="INSERT INTO timetables (sem,division,subject,faculty,day,slot)values('"+sem+"','"+division+"','"+subject+"','"+fac+"','"+day+"','"+slot+"')";
			stmt.execute(sql);
			System.out.println("Time-Table Entry Created!");
			response.sendRedirect("timetableadd.jsp");
	
		}	
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
