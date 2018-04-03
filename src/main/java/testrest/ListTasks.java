package testrest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Result;
import beans.Task;
import dao.TaskDao;

/**
 * Servlet implementation class ListTasks
 */
@WebServlet("/ListTasks")
public class ListTasks extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTasks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    List<Task> task = null;
	    Result<Task> tasks_result = null;
	    Integer page_nos= Integer.parseInt(request.getParameter("page"));
	    String startCursor="";
		if(request.getParameter("cursor") != null) {
			startCursor = request.getParameter("cursor").toString();
		}
	    TaskDao taskDao = new TaskDao();
	    if(!startCursor.equalsIgnoreCase(""))
	    	tasks_result = taskDao.listTasks(startCursor,page_nos);
	    else
	    	tasks_result = taskDao.listTasks("",page_nos);
		try {
			task = tasks_result.result;
			startCursor = tasks_result.cursor;
			System.out.println(startCursor);
			
		}catch(Exception e) {
			
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<!DOCTYPE html> <html> <head> <style> table {     font-family: arial, sans-serif;     border-collapse: collapse;     width: 100%; }  td, th {     border: 1px solid #dddddd;     text-align: left;     padding: 8px; }  tr:nth-child(even) {     background-color: #dddddd; } </style> </head> <body>  <h2>HTML Table</h2>  <table>   <tr>     <th>Company</th>     <th>Contact</th>     <th>Country</th>   </tr>\r\n" + 
				"");
		for(Task taskpojo: task) {
			sb.append("<tr>");
			sb.append("<td>"+taskpojo.getTask_title()+"</td>");
			sb.append("<td>"+taskpojo.getTask_description()+"</td>");
			sb.append("<td>"+taskpojo.getStart_date()+"</td>");
			sb.append("</tr>");

		}
		sb.append("</table>  </body> </html>");
		response.getWriter().append(sb.toString());
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
