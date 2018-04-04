package datatable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Order {

@SerializedName("column")
@Expose
private Integer column;
@SerializedName("dir")
@Expose
private Object dir;

public Integer getColumn() {
return column;
}

public void setColumn(Integer column) {
this.column = column;
}

public Object getDir() {
return dir;
}

public void setDir(Object dir) {
this.dir = dir;
}

}
