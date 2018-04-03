package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

/**
 * Servlet implementation class Authentication
 */
@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatastoreService datastore ;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Authentication() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public void init() throws ServletException {
		   // Initialization code...
		 datastore = DatastoreServiceFactory.getDatastoreService();
		}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// New location to be redirected

		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		response.setHeader("error", "Please Enter Email And Password ");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String email = request.getParameter("email");// will return value
		String password = request.getParameter("password");


		Filter heightMinFilter = new FilterPredicate("email", FilterOperator.EQUAL, email);

		Filter heightMaxFilter = new FilterPredicate("password", FilterOperator.EQUAL, password);

		CompositeFilter heightRangeFilter = CompositeFilterOperator.and(heightMinFilter, heightMaxFilter);

		Query query = new Query("Istaruser").setFilter(heightRangeFilter);
		List<Entity> results = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
		/*
		 * for (Entity entity : results) {
		 * 
		 * System.out.println(entity.getProperty("name")); authentic = (String)
		 * entity.getProperty("name"); }
		 */

		if (results.size() > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
			rd.forward(request, response);

			// response.sendRedirect("welcome.jsp");
		} else {
			boolean emailcheck = emailCheck(email);
			boolean passcheck = passwordcheck(password);
			String alertMsg = "";
			if(!emailcheck || !passcheck) {
				// alertMsg="And";
				if(!emailcheck) {
				alertMsg=" Sorry, we don't recognize this email ";
					 
				if(!passcheck)
					{
						
						alertMsg = alertMsg +"  password that you've entered is incorrect. ";
					}
				}else {
					alertMsg ="The password that you've entered is incorrect. ";
				}
			}

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			response.setHeader("error", alertMsg);
			rd.forward(request, response);

		}
	}

	public  boolean emailCheck(String email) {

		Filter heightMinFilter = new FilterPredicate("email", FilterOperator.EQUAL, email);

		Query query = new Query("Istaruser").setFilter(heightMinFilter);
		List<Entity> results = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
		return results.size() > 0;
	}

	public  boolean passwordcheck(String password) {

		Filter heightMinFilter = new FilterPredicate("password", FilterOperator.EQUAL, password);
		Query query = new Query("Istaruser").setFilter(heightMinFilter);
		List<Entity> results = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
		return results.size() > 0;

	}

}
