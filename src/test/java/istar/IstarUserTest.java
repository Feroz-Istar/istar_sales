package istar;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import com.github.javafaker.Faker;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.Timestamp;
import com.google.cloud.bigquery.BigQuery;
import com.google.cloud.bigquery.BigQueryOptions;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.cloud.datastore.StringValue;

import beans.IstarUser;

public class IstarUserTest {
	private  static DatastoreService datastore;
	
	//private  static KeyFactory keyFactory;
	static ArrayList<String> urls = new ArrayList<>();
	public static void main(String[] args) throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		/*FileInputStream fs = new FileInputStream(new File("Istarpubsub-93f6a7415498.json"));
		GoogleCredentials credentials = GoogleCredentials.fromStream(fs);*/
		 LocalServiceTestHelper helper =
			        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig()) .setEnvIsLoggedIn(true)
		              .setEnvAuthDomain("localhost")
		              .setEnvEmail("test@localhost");
			    helper.setUp();
			    datastore = DatastoreServiceFactory.getDatastoreService();
		//datastore =DatastoreOptions.newBuilder().setHost("http://localhost:8080/_ah/admin/datastore").setProjectId("istarpubsub-1521790238467").build().getService();
				//getDefaultInstance()..getService();
		//datastore = DatastoreOptions.newBuilder().setCredentials(credentials).setProjectId("istarpubsub-1521790238467").build().getService();
				
				//getDefaultInstance().getService();
		//keyFactory = datastore..setKind("IstarUser");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlT6TiJiI0F2xXpoYFpt6uvoVXlPbWjDgcnpbdkHK2AKYyzYaPbg");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSH-8KlY1aLfeq-DCMwhIrBatUqNCC0Crf_bDQXrAzThoIr4UJ");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzix6zlJLz7MDcz907yfj-wRJnZ1FvktyrFmfJYuEPPOV7jVv52g");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWfkA6fPozy8qlbL8q282B2jWo10s-UK2bYFLv1b_v32r5TAF");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF5kFQ57MLjbtYkO2sQT-Uu-RQ5lqjdrOIRXqNqBSNEj7L2ScZJQ");
		Random rand = new Random();
		int randomNum = 0 + rand.nextInt((4 - 0) + 1);
		

		datastore.put(new Entity("yam"));
		datastore.put(new Entity("yam"));
	    helper.tearDown();

		/*Faker faker = new Faker();
		IstarUser istarUser = new IstarUser();
		istarUser.setEmail(faker.company().name()+"@hello.com");
		istarUser.setName(faker.name().fullName());
		istarUser.setPassword(faker.commerce().productName());
		istarUser.setGender("male");
		istarUser.setAge(faker.number().numberBetween(20,30));
		istarUser.setLastlogin(new java.sql.Timestamp(System.currentTimeMillis()));
		istarUser.setMobile(faker.commerce().price());
		istarUser.setProfile_image(urls.get(randomNum));
		addUser(istarUser);*/
		System.out.println("Ending ........");
	}
	
	
	public static void addUser(IstarUser user) {
		//Key key = datastore.allocateId(keyFactory.newKey());
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
		  //return key;
	}

}
