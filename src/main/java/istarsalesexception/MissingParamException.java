package istarsalesexception;

import javax.ws.rs.core.Response;

import org.json.JSONObject;

public class MissingParamException extends IstarSalesException {

	String message;

	public MissingParamException(String message) {

		super(message);
		this.message = message;
	}

	public Response toResponse() {
		JSONObject jsonResponseObject = new JSONObject();
		jsonResponseObject.put("message", message);
		return Response.status(Response.Status.BAD_REQUEST).entity(jsonResponseObject.toString()).header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
				.allow("OPTIONS").build();
	}

}
