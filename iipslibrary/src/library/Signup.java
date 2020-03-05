package library;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out=response.getWriter();
		  
		  String fname=request.getParameter("fname");
		  String lname=request.getParameter("lname");
		  String number=request.getParameter("number");
		  String password=request.getParameter("password");
		  
		  
	      try
	      {
	    	  Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("driver register");
		      
		       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","tiger");
	           
		       System.out.println("db found");
		       PreparedStatement ps=con.prepareStatement("insert into user (fname,lname,number,password) values(?,?,?,?)");
		    
		       
		       ps.setString(1,fname);
		       ps.setString(2,lname);
		       ps.setString(3,number);
		       ps.setString(4,password);
		       
		       int i=ps.executeUpdate();
		       if(i==1)
		       {   RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	    	       rd.include(request, response);
		    	   //out.print("congratulations you have successfully signed up");
		    	   //out.print("<a href='/userhome.jsp'>go to home page</a>");
		       }
		       else
		       {
		    	   out.print("data not inserted");
		       }
	      
	      }
		catch(Exception e)
		{
			
			e.printStackTrace();
			
	      }
	      
	}

}
