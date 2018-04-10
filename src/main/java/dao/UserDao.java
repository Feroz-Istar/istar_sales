package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.IstarUser;

public class UserDao {
	Connection connection = null;
	Statement st = null;
	public UserDao() {
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
	
	
	public IstarUser getUserByUserId(Integer id) {
		IstarUser istarUser =null;

		String sql = "select * from istaruser where id ="+id;
		try {
			ResultSet rs = st.executeQuery(sql);
			
			while (rs.next()) {
				istarUser= new IstarUser();
				istarUser.setEmail(rs.getString("email"));
				istarUser.setId(rs.getInt("id"));
				istarUser.setPassword(rs.getString("password"));
				istarUser.setUserimage(rs.getString("userimage"));
			}
			rs.close();
			
			return istarUser;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
}
