package istarsalesexception;

import javax.ws.rs.core.Response;

import org.json.JSONObject;

public class IstarSalesException extends Exception {
	String message;
	public IstarSalesException(String message) {
		this.message = message;
	}
	
	public Response toResponse() {
		JSONObject jsonResponseObject = new JSONObject();
		jsonResponseObject.put("message", message);
		return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(jsonResponseObject.toString()).header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
				.allow("OPTIONS").build();
	}
}
