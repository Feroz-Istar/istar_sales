package testrest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.javafaker.Faker;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

import beans.IstarUser;

/**
 * Servlet implementation class Dummy
 */
@WebServlet("/Dummy")
public class Dummy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ArrayList<String> urls = new ArrayList<>();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dummy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlT6TiJiI0F2xXpoYFpt6uvoVXlPbWjDgcnpbdkHK2AKYyzYaPbg");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSH-8KlY1aLfeq-DCMwhIrBatUqNCC0Crf_bDQXrAzThoIr4UJ");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzix6zlJLz7MDcz907yfj-wRJnZ1FvktyrFmfJYuEPPOV7jVv52g");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWfkA6fPozy8qlbL8q282B2jWo10s-UK2bYFLv1b_v32r5TAF");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF5kFQ57MLjbtYkO2sQT-Uu-RQ5lqjdrOIRXqNqBSNEj7L2ScZJQ");
		Random rand = new Random();
		int randomNum = 0 + rand.nextInt((4 - 0) + 1);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				  try {
					    Faker faker = new Faker();
					    
					    for(int i=0;i<10;i++) {
						IstarUser user = new IstarUser();
						user.setEmail(faker.company().name()+"@hello.com");
						user.setName(faker.name().fullName());
						user.setPassword(faker.commerce().productName());
						user.setGender("male");
						user.setAge(faker.number().numberBetween(20,30));
						user.setLastlogin(new java.sql.Timestamp(System.currentTimeMillis()));
						user.setMobile(faker.commerce().price());
						user.setProfile_image(urls.get(randomNum));
					    Entity entity = new Entity("Istaruser");
						entity.setProperty("name",user.getName());
						entity.setProperty("email", user.getEmail());
						entity.setProperty("last_login", new Date());
						entity.setProperty("age",user.getAge());
						entity.setProperty("gender", user.getGender());
						entity.setProperty("mobile",user.getMobile());
						entity.setProperty("profile_image", user.getProfile_image());
						entity.setProperty("password",user.getPassword());
						entity.setProperty("completed", false);
						 
						  datastore.put(entity);
					    }
				  }catch(Exception e) {
					  e.printStackTrace();
					  
				  }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
