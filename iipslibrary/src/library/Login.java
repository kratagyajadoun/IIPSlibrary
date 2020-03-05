
package library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out=response.getWriter();
		  
		  String number=request.getParameter("phone");
		  String password=request.getParameter("password");
		  
		  
		  
	      try
	      {
	    	  Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("driver register");
		      
		       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
	           
		       System.out.println("db found");
		       PreparedStatement ps=con.prepareStatement("select number,password from user where number=? and password=?");
		    
		       
		       ps.setString(1,number);
		       ps.setString(2,password);
		       
		       
		       ResultSet rs=ps.executeQuery();
		       if(rs.next())
		       {
		    	   
		    	   HttpSession session=request.getSession();//to start a session
		           session.setAttribute("key",number);
		       
		       
		    	   RequestDispatcher rd=request.getRequestDispatcher("userhome.jsp");
		    	   rd.include(request, response);
		    	   //out.print("login valid");
		    	  //response.sendRedirect("userhome.jsp");
		       }
		       else
		       {

		    	   RequestDispatcher rd=request.getRequestDispatcher("index.html");
		    	   rd.include(request, response);
		    	   out.print("login invalid");
		    	   //response.sendRedirect("index.html");
		       }
	      
	      }
		catch(Exception e)
		{
			
			e.printStackTrace();
			
	      }
	      
	}

}
