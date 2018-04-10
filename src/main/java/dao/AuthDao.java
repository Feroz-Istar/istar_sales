package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import pojo.IstarUser;

public class AuthDao {

	
	public IstarUser getUser(String email,String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = null;
			Statement st = null;
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/himanshu", "root", "root");
			st = connection.createStatement();
			String sql= "Select * from istaruser where email like '%"+email+"%' and password ='"+password+"'";
			System.out.println("auth query is "+sql);
			ResultSet rs = st.executeQuery(sql);
			IstarUser istarUser =null;
			while(rs.next()) {
				istarUser= new IstarUser();
				istarUser.setEmail(rs.getString("email"));
				istarUser.setId(rs.getInt("id"));
				istarUser.setPassword(rs.getString("password"));
				istarUser.setUserimage(rs.getString("userimage"));
			}
			rs.close();
			st.close();
			connection.close();
			return istarUser;

			
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
}
