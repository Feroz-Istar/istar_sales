package istarsalesresponse;

public class IstarSalesResponse {
	private Boolean isError;
	private Object object;
	private String error_message;
	public IstarSalesResponse(Boolean isError, Object object, String error_message) {
		super();
		this.isError = isError;
		this.object = object;
		this.error_message = error_message;
	}
	
	
	

}
