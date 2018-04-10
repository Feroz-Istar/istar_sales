package restservices.task;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;

import dao.TaskDao;
import istarsalesresponse.IstarSalesResponse;
import pojo.Task;

@Path("/task")

public class FetchTask {
	private static final Gson gson = new Gson();
	private static IstarSalesResponse istarSalesResponse;
	private static final TaskDao taskdao = new TaskDao();

	@GET
	@Path("getAlltask/{user_id}/")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getMsg(@PathParam("user_id") Integer user_id ) {
		
		System.out.println("user id "+user_id);
		if(user_id == null) {
			istarSalesResponse = new IstarSalesResponse(true, null,"task id not supplied");
			
		}
		
		ArrayList<Task> task_array = taskdao.getAllTasks(user_id);
		if(task_array.size()>0) {
			istarSalesResponse = new IstarSalesResponse(false, task_array,"");

		}else {
			istarSalesResponse = new IstarSalesResponse(true, null,"No task found for this user");

		}
		
		return Response.status(200).entity(gson.toJson(istarSalesResponse).toString()).header("Access-Control-Allow-Origin", "*").header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT").allow("OPTIONS").build();
		
		
	}
}
