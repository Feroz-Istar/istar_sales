package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.appengine.api.datastore.Cursor;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.QueryResultList;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.QueryResults;

import beans.Result;
import beans.Task;
import constants.TaskType;

public class TaskDao implements TaskDaoImpl{

	private DatastoreService datastore;

	
	
	
	public TaskDao() {
		super();
    	datastore = DatastoreServiceFactory.getDatastoreService();

		// TODO Auto-generated constructor stub
	}

	@Override
	public Long createTask(Task task) {
	    Entity entity = new Entity("IstarTask");
	    entity.setProperty(Task.USER_ID,task.getUser_id());
	    entity.setProperty(Task.SCORE,task.getScore());
	    entity.setProperty(Task.START_DATE, task.getStart_date());
	    entity.setProperty(Task.STATUS, task.getStatus());
	    entity.setProperty(Task.TARGET_USER_ID, task.getTarget_user_id());
	    entity.setProperty(Task.TASK_DESCRIPTION, task.getTask_description());
	    entity.setProperty(Task.TASK_TITLE, task.getTask_title());
	    entity.setProperty(Task.TASK_TYPE, task.getTask_type());
	    Key key =  datastore.put(entity);

		// TODO Auto-generated method stub
		return key.getId();
	}

	@Override
	public Task readTask(Long taskId) {
		try {
			Entity taskEntity  =datastore.get(KeyFactory.createKey("IstarTask",taskId));
			 return entityToTask(taskEntity);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private Task entityToTask(Entity taskEntity) {
		// TODO Auto-generated method stub
		return  new Task.Builder().task_title((String) taskEntity.getProperty(Task.TASK_TITLE))
				.task_description((String) taskEntity.getProperty(Task.TASK_DESCRIPTION))
				.task_type((String) taskEntity.getProperty(Task.TASK_TYPE))
				.duration((Long)taskEntity.getProperty(Task.DURATION))
				.score(((Long)taskEntity.getProperty(Task.SCORE)).intValue())
				.status((String)taskEntity.getProperty(Task.STATUS))
				.user_id((Long)taskEntity.getProperty(Task.USER_ID))
				.target_user_id((Long)taskEntity.getProperty(Task.TARGET_USER_ID))
				.start_date((Date)taskEntity.getProperty(Task.START_DATE))
				.id(taskEntity.getKey().getId())
				.build();
	}

	@Override
	public void updateBook(Task task) {
		// TODO Auto-generated method stub
	    Key key = KeyFactory.createKey("IstarTask",task.getId());
	    Entity entity = new Entity(key);
	    entity.setProperty(Task.USER_ID,task.getUser_id());
	    entity.setProperty(Task.SCORE,task.getScore());
	    entity.setProperty(Task.START_DATE, task.getStart_date());
	    entity.setProperty(Task.STATUS, task.getStatus());
	    entity.setProperty(Task.TARGET_USER_ID, task.getTarget_user_id());
	    entity.setProperty(Task.TASK_DESCRIPTION, task.getTask_description());
	    entity.setProperty(Task.TASK_TITLE, task.getTask_title());
	    entity.setProperty(Task.TASK_TYPE, task.getTask_type());
	    datastore.put(entity);
	    }

	@Override
	public void deleteTask(Long taskId) {
		// TODO Auto-generated method stub
	    Key key = KeyFactory.createKey("IstarTask",taskId);
	    // Create the Key
	    datastore.delete(key);
	}

	@Override
	public Result<Task> listTasks(String startCursorString,Integer pagelimit) {
		// TODO Auto-generated method stub
		
	    FetchOptions fetchOptions = FetchOptions.Builder.withLimit(pagelimit);

		 if (startCursorString != null && !startCursorString.equalsIgnoreCase("")) {
		      fetchOptions.startCursor(Cursor.fromWebSafeString(startCursorString));
				System.out.println("startCursorString "+startCursorString);

		    }
		 Query q = new Query("IstarTask").addSort("task_title", SortDirection.ASCENDING);
		    PreparedQuery pq = datastore.prepare(q);

		    
		    QueryResultList<Entity> results;
		    try {
		      results = pq.asQueryResultList(fetchOptions);
		      List<Task> tasks = entitiesToTasks(results);     // Retrieve and convert Entities
		      Cursor cursor = results.getCursor();   
		      
		      if (cursor != null ) {         // Are we paging? Save Cursor
		          String cursorString = cursor.toWebSafeString();               // Cursors are WebSafe
		          return new Result<>(tasks, cursorString);
		        } else {
		          return new Result<>(tasks);
		        }
		    } catch (IllegalArgumentException e) {
		    	
		    }
		return null;
	}

	@Override
	public ArrayList<Task> findByProperty(String property_name, Object property_value) {
		// TODO Auto-generated method stub
		
		
		ArrayList<Task> tasks = new ArrayList<>();
		Filter filter =
				new FilterPredicate(property_name, FilterOperator.EQUAL, property_value);
		Query query = new Query("IstarTask").setFilter(filter);
		List<Entity> results = datastore.prepare(query).asList(
				FetchOptions.Builder.withDefaults());
		for(Entity entity: results) {
			tasks.add(entityToTask(entity));
		}
		
		return tasks;
	}

	
	
	public List<Task> entitiesToTasks(QueryResultList<Entity> resultList) {
	    List<Task> tasks = new ArrayList<>();
	    for(Entity entity: resultList) {
			tasks.add(entityToTask(entity));
		}
	    return tasks;
	  }
}
