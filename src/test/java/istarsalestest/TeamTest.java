package istarsalestest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.github.javafaker.Faker;
import com.google.appengine.api.search.query.QueryParser.restriction_return;

import pojo.IstarUser;
import pojo.Project;
import pojo.Team;

public class TeamTest {
	static Connection connection = null;
	static Statement st = null;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/himanshu", "root", "root");
			st = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//insertteam();
	
	//	IstarUser user =findUserByEmail("Gabriella@gmail.com");
		//
		//System.out.println(user.getId());
		//System.out.println(team.getId());
		
		//insertTeamMember(user , team);
//		Team team = findByTeamName("south zone");
//	Project project = 	createProject("Istar Sales projetc" , team.getId());
//	
		IstarUser istarUser =  testUser("Fern@gmail.com","test123");
		System.out.println("email -------->"+istarUser.getId());
	}
	
	static void insertteam() {
		
		Faker faker =  new Faker();
		for(int i =0 ;i<10;i++) {
			String sql = "INSERT INTO team (team_name) VALUES ( '"+faker.team().name()+"')";

			try {
				st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	static void insertTeamMember(IstarUser istarUser, Team team) {
		
		String sql  = "INSERT INTO teammembers ( userid, teamid) VALUES ('"+istarUser.getId()+"','"+team.getId()+"');";
	
	try {
		st.executeUpdate(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
	
	
	
	static IstarUser findUserByEmail( String email) {
		
			String sql = "select * from istaruser where email  like '%"+email+"%'  ";	
			try {
				st.executeQuery(sql);
			
			ResultSet  rs  = st.executeQuery(sql);
			IstarUser istarUser = null;
			while(rs.next()) {
			 istarUser = new IstarUser();
			 
			 istarUser.setId(rs.getInt("id"));
			 istarUser.setEmail(rs.getString("email"));
			 istarUser.setPassword(rs.getString("password"));
			}
			return istarUser;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;}

	
	static Team findByTeamName(String teamName) {
		//Team team = new Team();
		try {
			
			String sql = "select * from team where team_name  like '%"+teamName+"%'";	
			System.out.println(sql);
			st.executeQuery(sql);
			ResultSet rs = st.executeQuery(sql);
			Team team = null ;
			while(rs.next()) {
			
				 team  = new Team();
				
				 team.setId(rs.getInt("id"));
				 team.setTeamName(rs.getString("team_name"));
			}
			return team ;
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
		
		
		
	}
	
	static Project createProject (String projectname ,int teamid ) {
		
		String sql = "INSERT INTO project ( projectname, teamid) VALUES ('"+projectname+"','"+teamid+"')";
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
		return null;
		
		
	}
	
	static IstarUser testUser(String email , String password) {
		
		String sql= "Select * from istaruser where email like '%"+email+"%' and password ='"+password+"'";
		System.out.println(sql);
		try {
	st.executeQuery(sql);
	ResultSet rs = st.executeQuery(sql);
	
	IstarUser istarUser =  null;
	while(rs.next()) {
		
		  istarUser =  new IstarUser();
		istarUser.setEmail(rs.getNString("email"));
		istarUser.setId(rs.getInt("id"));
	}
	return istarUser;
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

		return null;
		
	}
	
}
