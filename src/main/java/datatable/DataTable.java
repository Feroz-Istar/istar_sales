package datatable;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class DataTable {

	@SerializedName("draw")
	@Expose
	private Integer draw;
	@SerializedName("columns")
	@Expose
	private List<Column> columns = null;
	@SerializedName("order")
	@Expose
	private List<Order> order = null;
	@SerializedName("start")
	@Expose
	private Integer start;
	@SerializedName("length")
	@Expose
	private Integer length;
	@SerializedName("search")
	@Expose
	private Search search;

	public Integer getDraw() {
		return draw;
	}

	public void setDraw(Integer draw) {
		this.draw = draw;
	}

	public List<Column> getColumns() {
		return columns;
	}

	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}

}