package istarsalestest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import com.github.javafaker.Faker;

import pojo.Task;

public class TaskTest {
	static Connection connection = null;
	static Statement st = null;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/himanshu", "root", "root");
			st = connection.createStatement();
			
			
			createTask();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static void createTask() {
		// TODO Auto-generated method stub
		Faker faker = new Faker();
		for(int i=0;i<10;i++) {
		Task task = new Task(faker.superhero().name(), faker.lorem().sentence(), 5, "Not Started", new Timestamp(System.currentTimeMillis()), faker.number().numberBetween(10, 70), faker.number().numberBetween(1, 5), 2, "CALL_TASK");
		saveTask(task);
		}	
		
	}
	private static void saveTask(Task task) {
		// TODO Auto-generated method stub
		String sql="INSERT INTO himanshu.task ( name, description, target_user, status, start_time, duration, score, user_id, task_type) VALUES ( '"
				+ task.getName()
				+ "', '"
				+ task.getDescription()
				+ "', '"
				+ task.getTarget_user()
				+ "', '"
				+ task.getStatus()
				+ "', '"
				+ task.getStart_time()
				+ "', '"
				+ task.getDuration()
				+ "', '"
				+ task.getScore()
				+ "', '"
				+ task.getUser_id()
				+ "', '"
				+ task.getTask_type()
				+ "')";
		System.out.println(sql);
		
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
