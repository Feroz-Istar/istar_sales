package istar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.github.javafaker.Faker;

public class MysqlInsert {

	public static void main(String[] argv) {

		System.out.println("-------- MySQL JDBC Connection Testing ------------");

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			return;
		}

		System.out.println("MySQL JDBC Driver Registered!");
		Connection connection = null;
		Statement st = null;
		try {
			connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/business","root", "root");
			st = connection.createStatement();
			Faker faker = new Faker();
			
			for(int i =0 ;i <2000;i++) {
				String sql = "INSERT INTO business.leads ( name, company, phoneno, emailid, city, state, leadsource, allocation_details) "
						+ "VALUES ( '"
						+ faker.name().fullName().replaceAll("'", "\\'")
						+ "', '"
						+ faker.company().name().replaceAll("'", "\\'")
						+ "', '"
						+ faker.phoneNumber().phoneNumber().replaceAll("'", "\\'")
						+ "', '"
						+ faker.name().firstName().replaceAll("'", "\\'")+"@hello.com"
						+ "', '"
						+ faker.address().city().replaceAll("'", "\\'")
						+ "', '"
						+ faker.address().state().replaceAll("'", "\\'")
						+ "', '"
						+ faker.beer().name().replaceAll("'", "\\'")
						+ "', '"
						+ faker.superhero().power().replaceAll("'", "\\'")
						+ "')";
				System.out.println(sql);
				st.executeUpdate(sql);
			}
			
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}
	  }

}
