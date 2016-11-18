package bg.hobbycollections.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import bg.hobbycollections.dbconnection.DBMySqlConnector;
import bg.hobbycollections.dbconnection.XLSConnector;
import bg.hobbycollections.model.AbstractItemsEnumeration;
import bg.hobbycollections.model.GumInserts;

public class ConsoleXLSXtoDB {

	public static void main(String[] args) throws IOException {

		ArrayList<GumInserts> wholeCollection = null;
		XLSConnector xlsConnector = new XLSConnector("bg.xlsx");
		wholeCollection = xlsConnector.getWholeCollection();

		DBMySqlConnector db = new DBMySqlConnector();
		db.initializeDatabase();

		for (int i = 0; i < wholeCollection.size(); i++) {
			boolean isNumericRepresentation = wholeCollection.get(i).getIsNumericRepresentation();
			
			int categoryId = db.insertCategoryByLabel(wholeCollection.get(i).getCategory());

			int subCategoryId = db.insertSubcategoryByLabel(wholeCollection.get(i).getSubCategorySeries(), categoryId,
					wholeCollection.get(i).getNumbersFromTo(), isNumericRepresentation);

			Map<?, Integer> numbersInSerie = wholeCollection.get(i).getNumbersAndCounts();
			Map<?, String> additionalText = wholeCollection.get(i).getAdditionalText();
			
			/*-TreeMap<Integer, Integer> numbersInSerie = (TreeMap<Integer, Integer>) wholeCollection.get(i).getNumbersAndCounts();
			TreeMap<Integer, String> additionalText = (TreeMap<Integer, String>) wholeCollection.get(i).getAdditionalText();*/

			int affectedRowsItems = db.insertItems(subCategoryId, numbersInSerie, isNumericRepresentation);
			int affectedRowsComment = db.insertComments(subCategoryId, additionalText, isNumericRepresentation);

			System.out.print(wholeCollection.get(i).getCategory() + " [" + categoryId + "] " + " > ");
			System.out.print(wholeCollection.get(i).getSubCategorySeries() + " [" + subCategoryId + "] " + " > ");
			System.out.print(wholeCollection.get(i).getNumbersAndCounts() + " [" + affectedRowsItems + "] " + " > ");
			System.out.println(wholeCollection.get(i).getAdditionalText() + " [" + affectedRowsComment + "]");

		}
	}

}
