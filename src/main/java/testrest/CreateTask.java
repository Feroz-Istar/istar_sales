package testrest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.javafaker.Faker;
import com.google.appengine.api.datastore.Entity;

import beans.Task;
import constants.TaskType;
import dao.TaskDao;

/**
 * Servlet implementation class CreateTask
 * http://localhost:8080/CreateTask?id=4644337115725824&target_id=4785074604081152
 */
@WebServlet("/CreateTask")
public class CreateTask extends BaseIstarServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public CreateTask() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long user_id = Long.parseLong(request.getParameter("id"));
		Long target_id = Long.parseLong(request.getParameter("target_id"));
		Faker faker = new Faker();

		Task task = new Task.Builder().task_title(faker.company().name())
				.task_description(faker.lorem().paragraph())
				.task_type(TaskType.CALL_TASK)
				.duration(new Date().getTime())
				.score(faker.number().numberBetween(0, 99))
				.status("INCOMPLETE")
				.user_id(user_id)
				.target_user_id(target_id)
				.start_date(new Date()).build();

		TaskDao taskDao = new TaskDao();
		response.getWriter().append(taskDao.createTask(task)+"");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
