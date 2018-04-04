package restservices;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.BeanParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import datatable.Column;
import datatable.DataTable;
import datatable.Order;
import datatable.Search;
import restservices.DataTableCriterias.ColumnCriterias;
import restservices.DataTableCriterias.SearchCriterias;

@Path("/getData")

public class RestDataTable {
	private static final Gson gson = new Gson();
	private static DataTable datatable;

	@GET
	@Consumes("application/json")
	@Path("datatable")
	public Response getMsg(@Context UriInfo uriInfo, @QueryParam("data") String data) {
		MultivaluedMap<String, String> queryParams = uriInfo.getQueryParameters();

		for (String key : queryParams.keySet()) {
			System.out.println("new key " + key + " value is " + queryParams.get(key));

		}
		String output = "";
		System.out.println("data " + data);
		datatable = gson.fromJson(data, DataTable.class);

		System.out.println("draw " + datatable.getDraw());
		System.out.println("length " + datatable.getLength());
		System.out.println("start " + datatable.getLength());

		for (Column col : datatable.getColumns()) {
			System.out.println("col name -->" + col.getName());
			System.out.println(" col searchvalue -->" + col.getSearchValue());
			System.out.println("col data --> " + col.getData());
			System.out.println("col isSearchable ---> " + col.getSearchable());
			System.out.println("col is regex--> " + col.getSearchRegex());
		}

		for (Order order : datatable.getOrder()) {
			System.out.println("order dir -->" + order.getDir());
			System.out.println("order column --> " + order.getColumn());
		}

		Search search = datatable.getSearch();
		System.out.println("search regex --> " + search.getRegex());
		System.out.println("search value --> " + search.getValue());

		return Response.status(200).entity(respond(datatable)).build();

	}

	public String respond(DataTable datatable) {
		String output = "";
		String search_manipulated_sql = "";
		String order_by = "";
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("draw", datatable.getDraw());
		JsonArray jsonArray = new JsonArray();
		Integer count = 0;
		String[] column = { "name", "company", "phoneno", "emailid", "city", "state", "leadsource",
				"allocation_details" };
		HashMap<Integer, String> column_index = new HashMap<>();
		Boolean isColumnSearchable = false;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = null;
			Statement st = null;
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/business", "root", "root");
			st = connection.createStatement();

			for (Column col : datatable.getColumns()) {
				if (!col.getSearchValue().trim().equalsIgnoreCase("")) {
					isColumnSearchable = true;
					column_index.put(col.getData(), col.getSearchValue());
				}
			}

			for (Order order : datatable.getOrder()) {
				if (order.getDir() instanceof String) {
					order_by = " order by " + column[order.getColumn()] + " " + order.getDir();
				} else {
					ArrayList<String> ordr_dir = (ArrayList<String>) order.getDir();
					String name_of_column = column[Integer.parseInt(ordr_dir.get(0))];
					order_by = " order by " + name_of_column + " " + ordr_dir.get(1);
				}
			}
			if (!isColumnSearchable && datatable.getSearch() != null
					&& !datatable.getSearch().getValue().trim().equalsIgnoreCase("")) {
				search_manipulated_sql = "where name like '%" + datatable.getSearch().getValue()
						+ "%' or company like '%" + datatable.getSearch().getValue() + "%' or phoneno like '%"
						+ datatable.getSearch().getValue() + "%' or emailid like '%" + datatable.getSearch().getValue()
						+ "%' or city like '%" + datatable.getSearch().getValue() + "%' or state like '%"
						+ datatable.getSearch().getValue() + "%' or leadsource like '%"
						+ datatable.getSearch().getValue() + "%' or allocation_details like '%"
						+ datatable.getSearch().getValue() + "%'";
			} else {
				if (isColumnSearchable && column_index.size() > 0) {
					search_manipulated_sql = "where ";
					int temp = 0;
					for (Integer key : column_index.keySet()) {
						if (temp == 0) {
							search_manipulated_sql = search_manipulated_sql + column[key] + " like '%"
									+ column_index.get(key) + "%' ";
						} else {
							search_manipulated_sql = search_manipulated_sql + " or " + column[key] + " like '%"
									+ column_index.get(key) + "%' ";
						}
						temp++;
					}
				}
			}

			String sql = " SELECT x.count, name, company, phoneno, emailid, city, state, leadsource, allocation_details FROM leads, ( SELECT count(*) AS count FROM leads "
					+ search_manipulated_sql + " ) AS x " + search_manipulated_sql + order_by + " LIMIT "
					+ datatable.getLength() + " OFFSET " + datatable.getStart();
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				if (count == 0) {
					count = rs.getInt("count");
					jsonObject.addProperty("recordsTotal", count);
					jsonObject.addProperty("recordsFiltered", count);

				}
				String name = rs.getString("name");
				String company = rs.getString("company");
				String emailid = rs.getString("emailid");
				String city = rs.getString("city");
				String state = rs.getString("state");
				String phoneno = rs.getString("phoneno");
				String allocation_details = rs.getString("allocation_details");
				JsonArray jsonArray1 = new JsonArray();
				jsonArray1.add(name);
				jsonArray1.add(company);
				jsonArray1.add(phoneno);

				jsonArray1.add(emailid);
				jsonArray1.add(city);
				if(state.equalsIgnoreCase("Florida")) {
					jsonArray1.add("<button type=\"button\" class=\"btn btn-outline-primary\">Primary</button>");
				}else {
				jsonArray1.add(state);
				}
				jsonArray1.add(allocation_details);
				jsonArray.add(jsonArray1);

			}
			jsonObject.add("data", jsonArray);
			st.close();
			connection.close();

			output = jsonObject.toString();
			return output;
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
}
