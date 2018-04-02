package istar;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.utils.SystemProperty;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

import beans.IstarUser;

public class IstarUserTest {
	static DatastoreService datastore;

	 private final LocalServiceTestHelper helper =
		      new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());

		  @Before
		  public void setUp() {
		    helper.setUp();
		  }

		  @After
		  public void tearDown() {
		    helper.tearDown();
		  }
	// private static KeyFactory keyFactory;
	static ArrayList<String> urls = new ArrayList<>();

	public static void main(String[] args) throws FileNotFoundException, IOException {
		
			    		// TODO Auto-generated method stub
		/*
		 * FileInputStream fs = new FileInputStream(new
		 * File("Istarpubsub-93f6a7415498.json")); GoogleCredentials credentials =
		 * GoogleCredentials.fromStream(fs);
		 */
		  datastore = DatastoreServiceFactory.getDatastoreService();

		  Entity post = new Entity("NewPost"); // create a new entity
		  post.setProperty("woow", "aif ali kahn");
		  datastore.put(post);
	}

	

}
