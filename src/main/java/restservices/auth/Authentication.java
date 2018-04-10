package restservices.auth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.AuthDao;
import istarsalesexception.MissingParamException;
import istarsalesresponse.IstarSalesResponse;
import pojo.IstarUser;

@Path("/auth")

public class Authentication {
	private static final AuthDao autodao = new AuthDao();
	private static final Gson gson = new Gson();
	private static IstarSalesResponse istarSalesResponse;

	@GET
	@Path("/login")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getMsg(@QueryParam("email") String email,@QueryParam("password") String password ) {
		if(email == null) {
			String msg = "";
			if(password == null) {
				msg ="Email and password not found";
			}else {
				msg ="email not found";
			}
			istarSalesResponse = new IstarSalesResponse(true, null,msg);
		}
		
		
		if(password == null) {
			istarSalesResponse = new IstarSalesResponse(true, null,"password not provided");


		}
		
		IstarUser istarUser = autodao.getUser(email, password);
		
		if(istarUser == null) {
			istarSalesResponse = new IstarSalesResponse(true, null,"Please check your email and password");
		}else {
			istarSalesResponse = new IstarSalesResponse(false, istarUser,"");

		}
		
		
 
		return Response.status(200).entity(gson.toJson(istarSalesResponse).toString()).header("Access-Control-Allow-Origin", "*").header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT").allow("OPTIONS").build();
 
	}
}
