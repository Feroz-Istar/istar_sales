package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.IstarUser;
import pojo.Task;

public class TaskDao {

	Connection connection = null;
	Statement st = null;
	public TaskDao() {
		super();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/himanshu", "root", "root");
			st = connection.createStatement();
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Task> getAllTasks(Integer userid){
		ArrayList<Task> task_array = new ArrayList<>();
		UserDao userDao = new UserDao();
		String sql="select * from task where user_id="+userid;
		
		ResultSet rs;
		try {
			System.out.println(sql);
			rs = st.executeQuery(sql);
		
		while(rs.next()) {
			int target_id = rs.getInt("target_user");
			IstarUser istarUser =userDao.getUserByUserId(target_id);
			Task task = new Task(rs.getInt("id"), rs.getString("name"), rs.getString("description"),  rs.getString("status"),
					rs.getTimestamp("start_time"), rs.getInt("duration"), rs.getInt("score"), rs.getInt("user_id"), rs.getString("task_type"));
			task.setTarget_user(istarUser);
			task_array.add(task);
			
		}
		rs.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return task_array;
	}
	
}
