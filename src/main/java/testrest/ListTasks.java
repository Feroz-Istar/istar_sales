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
	    	tasks_result = taskDao.listTasks("",page_nos*10);
	    else
	    	tasks_result = taskDao.listTasks(startCursor,page_nos*10);
		try {
			task = tasks_result.result;
			startCursor = tasks_result.cursor;
			System.out.println(startCursor);
			
		}catch(Exception e) {
			
		}
		StringBuffer sb = new StringBuffer();
		for(Task taskpojo: task) {
			sb.append(taskpojo.getTask_title()+""+" \n"+taskpojo.getTask_description());
			sb.append("\n /n \n");
		}
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
