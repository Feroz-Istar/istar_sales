package restservices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import com.google.gson.JsonObject;

@Path("/task")

public class RestTaskService {
	@GET
	@Path("/create/{param}")
	public Response getMsg(@PathParam("param") String msg) {
 
		Connection connection = null;
		Statement st = null;
		JsonObject jsonObject = new JsonObject();
		try {
			connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/business","root", "root");
			st = connection.createStatement();
		}catch(Exception e) {
			
		}
		
 
		return Response.status(200).entity("").build();
 
	}
}
