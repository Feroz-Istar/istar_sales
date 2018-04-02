package istar;

import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.KeyFactory;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.StringValue;
import com.google.cloud.Timestamp;

public class IstarTaskTest {
	private final Datastore datastore = DatastoreOptions.getDefaultInstance().getService();
	private final KeyFactory keyFactory = datastore.newKeyFactory().setKind("Task");

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public Key addTask(String description) {
		  Key key = datastore.allocateId(keyFactory.newKey());
		  Entity task = Entity.newBuilder(key)
				  .set("name",StringValue.newBuilder(description).setExcludeFromIndexes(true).build())
		      .set("description", StringValue.newBuilder(description).setExcludeFromIndexes(true).build())
		      .set("created", Timestamp.now())
		      .set("completed", false)
		      .build();
		  datastore.put(task);
		  return key;
		}
	
	
	
}
