package bg.hobbycollections.dbconnection;

import java.util.ArrayList;
import bg.hobbycollections.model.GumInserts;

public interface IConnector {
	public ArrayList<GumInserts> getWholeCollection();
}
