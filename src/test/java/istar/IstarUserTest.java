package istar;

import java.util.ArrayList;
import java.util.Random;

import com.github.javafaker.Faker;
import com.google.cloud.Timestamp;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.KeyFactory;
import com.google.cloud.datastore.StringValue;

import beans.IstarUser;

public class IstarUserTest {
	private final static Datastore datastore = DatastoreOptions.getDefaultInstance().getService();
	private final static KeyFactory keyFactory = datastore.newKeyFactory().setKind("IstarUser");
	static ArrayList<String> urls = new ArrayList<>();
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlT6TiJiI0F2xXpoYFpt6uvoVXlPbWjDgcnpbdkHK2AKYyzYaPbg");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSH-8KlY1aLfeq-DCMwhIrBatUqNCC0Crf_bDQXrAzThoIr4UJ");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzix6zlJLz7MDcz907yfj-wRJnZ1FvktyrFmfJYuEPPOV7jVv52g");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWfkA6fPozy8qlbL8q282B2jWo10s-UK2bYFLv1b_v32r5TAF");
		urls.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF5kFQ57MLjbtYkO2sQT-Uu-RQ5lqjdrOIRXqNqBSNEj7L2ScZJQ");
		Random rand = new Random();
		int randomNum = 0 + rand.nextInt((4 - 0) + 1);
		
		
		
		Faker faker = new Faker();
		IstarUser istarUser = new IstarUser();
		istarUser.setEmail(faker.company().name()+"@hello.com");
		istarUser.setName(faker.name().fullName());
		istarUser.setPassword(faker.commerce().productName());
		istarUser.setGender("male");
		istarUser.setAge(faker.number().numberBetween(20,30));
		istarUser.setLastlogin(new java.sql.Timestamp(System.currentTimeMillis()));
		istarUser.setMobile(faker.commerce().price());
		istarUser.setProfile_image(urls.get(randomNum));
		addUser(istarUser);
	}
	
	
	public static Key addUser(IstarUser user) {
		Key key = datastore.allocateId(keyFactory.newKey());
		  Entity task = Entity.newBuilder(key)
				  .set("name",StringValue.newBuilder(user.getName()).setExcludeFromIndexes(true).build())
		      .set("email", StringValue.newBuilder(user.getEmail()).setExcludeFromIndexes(true).build())
		      .set("last_login", Timestamp.now())
		      .set("age",user.getAge())
		      .set("gender", user.getGender())
		      .set("mobile",user.getMobile())
		      .set("profile_image", user.getProfile_image())
		      .set("password",user.getPassword())
		      .set("completed", false)
		      .build();
		  datastore.put(task);
		  return key;
	}

}
