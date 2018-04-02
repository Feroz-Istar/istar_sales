package dao;

import java.util.ArrayList;

import beans.Result;
import beans.Task;

public interface TaskDaoImpl {
	 Long createTask(Task task);

	 Task readTask(Long bookId) ;

	  void updateBook(Task task) ;

	  void deleteTask(Long taskId) ;

	  Result<Task> listTasks(String startCursor,Integer page_limit) ;
	  ArrayList<Task> findByProperty(String property_name,Object property_value);
}
