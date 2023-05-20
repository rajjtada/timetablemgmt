

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getSlot
 */
@WebServlet("/getSlot")
public class getSlot extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public getSlot() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sem = request.getParameter("sem");
		String div = request.getParameter("div");
		String sub = request.getParameter("sub");
		String fac = request.getParameter("fac");
		String day = request.getParameter("day");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/timetablemgmt","root","");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM timetables where faculty='"+fac+"' AND day='"+day+"'";
		
			ResultSet rs = stmt.executeQuery(sql);
			
			
			
			Set<String> options = new HashSet<String>();
		
			while(rs.next()) {
				options.add(rs.getString("slot"));
			}
			
			String sql1 = "SELECT * FROM timetables where sem='"+sem+"' AND division='"+div+"' AND day='"+day+"'";
			
			ResultSet rs1 = stmt.executeQuery(sql1);
			while(rs1.next()) {
				options.add(rs1.getString("slot"));
			}
			
			String json = new Gson().toJson(options);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		}
		
		catch(Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
