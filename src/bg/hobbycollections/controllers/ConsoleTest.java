package bg.hobbycollections.controllers;

import java.util.ArrayList;

import bg.hobbycollections.dbconnection.DBMySqlConnector;
import bg.hobbycollections.dbconnection.XLSConnector;
import bg.hobbycollections.model.GumInserts;

public class ConsoleTest {
	public static void main(String[] args) {
		DBMySqlConnector db = new DBMySqlConnector();
		// db.getDefaultQuery();
		System.out.println("-----------------------------------------");

		XLSConnector xls = new XLSConnector("bg.xlsx");

		ArrayList<GumInserts> wholeCollection = db.getWholeCollection(); // db

		for (int i = 0; i < wholeCollection.size(); i++) {
			// if (i == 22)
			{
				GumInserts gi = wholeCollection.get(i);

				String excel = xls.printRow(i);
				String dbase = gi.getCategory() + " : " + gi.getSubCategorySeries() + " : " + gi.getNumbersFromTo()
						+ " : " + gi.compactList();
				//if (!excel.equals(dbase)) {

					// test - input from excel
					System.out.println("NO : " + excel);

					// output from collection
					System.out.println(String.format("%2d", i) + " : " + dbase);
				//}
			}
		}

	}
}
