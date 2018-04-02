package istar;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.KeyFactory;
import com.github.javafaker.Faker;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.StringValue;
import com.google.cloud.Timestamp;

/**
 * Servlet implementation class GenerateUsers
 */
@WebServlet("/GenerateUsers")
public class GenerateUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Datastore datastore = DatastoreOptions.getDefaultInstance().getService();
	  private final KeyFactory keyFactory = datastore.newKeyFactory().setKind("istarUser");

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		Faker faker = new Faker();
		User user =new User("anurag@istarindia.com", "test123", 24);
	    Key key = datastore.allocateId(keyFactory.newKey());
	    Entity task = Entity.newBuilder(key)
	            .set("email", StringValue.newBuilder(user.getEmail()).setExcludeFromIndexes(true).build())
	            .set("created", Timestamp.now())
	            .set("password",user.getPassword())
	            .set("age", user.getAge())
	            .build();
	        datastore.put(task);
	        response.getWriter().println(key.getId());
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
