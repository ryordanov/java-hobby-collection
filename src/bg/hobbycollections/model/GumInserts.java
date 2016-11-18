package bg.hobbycollections.model;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.formula.functions.T;

public class GumInserts {
	private String category;
	private String subCategorySeries;
	private String numbersFromTo;
	private Boolean isNumericRepresentation; // 0:string; 1:integer; 2:...

	// list with items, counts and comments
	/*-private Map<Integer, Integer> numbersAndCounts;/*- = new TreeMap<Integer, Integer>(); // number:count*/
	/*-private Map<Integer, String> additionalText; /*- = new TreeMap<Integer, String>(); // number:comment */
	private AbstractItemsEnumeration<T> itemsCountsComments /*-= FactoryItemsEnumeration.getItemEnumeration("numbers")*/;

	public GumInserts(String mainCategory, String subCategorySeries, String numbersFromTo,
			Boolean isNumericRepresentation) {
		this(mainCategory, subCategorySeries, numbersFromTo);
		this.setIsNumericRepresentation(isNumericRepresentation);
	}

	public GumInserts(String mainCategory, String subCategorySeries, String numbersFromTo) {
		this.category = mainCategory;
		this.subCategorySeries = subCategorySeries;
		this.numbersFromTo = numbersFromTo;
		/*- changed with Factory */
		/*-this.numbersAndCounts = new TreeMap<Integer, Integer>(); */
		/*-this.additionalText = new TreeMap<Integer, String>();*/
	}

	/*-	public GumInserts(String category, String subCategory, String numbersFromTo, TreeMap<Integer, Integer> numbers, TreeMap<Integer, String> additionalText) {
	
			for (Map.Entry<Integer, Integer> entry : numbers.entrySet()) {
				Integer number = entry.getKey(); // номер на картинката
				Integer howManyTimes = entry.getValue(); // колко бройки имам
	
				String text = additionalText.get(number); // допълнителен текст
	
				addNumberAndDetails(number, howManyTimes, text);
			}
			this.setCategory(category);
			this.setSubCategorySeries(subCategory);
			this.setNumbersFromTo(numbersFromTo);
		}
	*/

	// MIGRATED DATA
	// numbers = "51(2),52-54,55(3;additional explanation),56(2;*)"
	public GumInserts(String category, String subCategory, String numbersFromTo, String numbers) {
		/*- changed with Factory */
		/*- this.numbersAndCounts = new TreeMap<Integer, Integer>();*/
		/*- this.additionalText = new TreeMap<Integer, String>();*/
		String[] items = numbers.split(",");// връща масив от един елемент с ""

		if (items.length == 1 && items[0].toString() == "") {
			items = new String[0];
		}
		this.setIsNumericRepresentation(haveNumericRepresentation(items));

		if (this.getIsNumericRepresentation()) {

			itemsCountsComments = FactoryItemsEnumeration
					.getItemEnumerationType(Integer.TYPE); /*- да подам един ITEM за определяне! */

			for (int i = 0; i < items.length; i++) {
				String item = items[i].trim();
				String[] intervals = item.split("-");

				if (intervals.length == 2 && isNumeric(intervals[0])) { /*- format is 14-19*/

					int iMin = Integer.parseInt(intervals[0].trim());
					int iMax = Integer.parseInt(intervals[1].trim());

					for (int itemFromInterval = iMin; itemFromInterval <= iMax; itemFromInterval++) {
						this.addNumberAndDetails(itemFromInterval, 1, "");
					}
				} else if (startsWithNumber(item)) {
					// или 1)има само едно число,
					// или 2)между запетайките има само число или нещо в скоби

					int counts = 1;
					String text = "";
					int leftBracket = item.indexOf("(");
					int rightBracket = item.indexOf(")");
					int number;

					if (leftBracket > -1 && rightBracket > -1) {
						number = Integer.parseInt(item.substring(0, leftBracket).trim());
						String additionalInfo = item.substring(leftBracket + 1, rightBracket);
						int semiColon = item.indexOf(";");

						if (semiColon > -1) {// count and text is present
							counts = Integer.parseInt(item.substring(leftBracket + 1, semiColon));
							text = item.substring(semiColon + 1, rightBracket);
						} else {// either count or text
							if (isNumeric(additionalInfo))
								counts = Integer.parseInt(additionalInfo);
							else
								text = additionalInfo;
						}
					} else
						number = Integer.parseInt(item.trim());
					this.addNumberAndDetails(number, counts, text);
				}
			}
		} else {
			itemsCountsComments = FactoryItemsEnumeration.getItemEnumerationType(String.class);
			for (int i = 0; i < items.length; i++) {
				String item = items[i];

				int counts = 1;
				String text = "";
				int leftBracket = item.indexOf("(");
				int rightBracket = item.indexOf(")");
				String labelInsteadNumber;

				if (leftBracket > -1 && rightBracket > -1) {
					labelInsteadNumber = item.substring(0, leftBracket).trim();
					String additionalInfo = item.substring(leftBracket + 1, rightBracket);
					int semiColon = item.indexOf(";");

					if (semiColon > -1) {// count and text is present
						counts = Integer.parseInt(item.substring(leftBracket + 1, semiColon));
						text = item.substring(semiColon + 1, rightBracket);
					} else {// either count or text
						if (isNumeric(additionalInfo))
							counts = Integer.parseInt(additionalInfo);
						else
							text = additionalInfo;
					}
				} else
					labelInsteadNumber = item.trim();
				this.addNumberAndDetails(labelInsteadNumber, counts, text);
			}
		}
		// if (!this.isEmpty()) //there are no numbers in this collection
		{
			this.setCategory(category);
			this.setSubCategorySeries(subCategory);
			this.setNumbersFromTo(numbersFromTo);
		}
	}

	private boolean haveNumericRepresentation(String[] items) {
		int i = 0;
		int itemsLen = items.length;
		boolean isNumberic = true;

		while (i < itemsLen && isNumberic) {
			String item;
			int pos = items[i].indexOf("(");
			if (pos == -1) {
				pos = items[i].indexOf("-");
			}

			if (pos == -1) {
				item = items[i].trim();
			} else {
				item = items[i].substring(0, pos).trim();
			}

			isNumberic = isNumeric(item);
			i++;
		}
		;
		return isNumberic;
	}

	/*-	public GumInserts(ResultSet items, ResultSet itemsDescription) {
	 		this.numbersAndCounts = new TreeMap<Integer, Integer>();
			this.additionalText = new TreeMap<Integer, String>();
			// колекция от навързани guminserts... да направя нов клас
			// ArrayList<GumInserts> wholeCollection = new ArrayList<GumInserts>();
			// или в сървлета да нашибам арейлиста и да с и работя с нея (по-добре)
			int item, fromCollection, countOfThisItem;
			// int numberOfColumns = items.getMetaData().getColumnCount();
	
			try {
				while (items.next()) {
					item = items.getInt("item");
					fromCollection = items.getInt("fromCollection");
					countOfThisItem = items.getInt("countOfThisItem");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			// addNumber(rs.getInt("item"), 1, text);
		}*/

	/////// to use T number instead of this stupid overloading....
	private void addNumberAndDetails(int number, int howManyTimes, String text) {
		Integer count = itemsCountsComments.getCounts(number); /*-this.numbersAndCounts.get(number);*/
		if (count == null) {
			count = 0;
		}
		// this.numbersAndCounts.put(number, count + howManyTimes);
		itemsCountsComments.putCounts(number, count + howManyTimes);

		if (!text.isEmpty()) {
			// this.additionalText.put(number, text);
			itemsCountsComments.putComment(number, text);
		}

		if (this.getIsNumericRepresentation() == null) {
			this.setIsNumericRepresentation(true);
		}
	}

	private void addNumberAndDetails(String item, int howManyTimes, String text) {
		Integer count = itemsCountsComments.getCounts(item); /*-this.numbersAndCounts.get(number);*/
		if (count == null) {
			count = 0;
		}
		// this.numbersAndCounts.put(number, count + howManyTimes);
		itemsCountsComments.putCounts(item, count + howManyTimes);

		if (!text.isEmpty()) {
			// this.additionalText.put(number, text);
			itemsCountsComments.putComment(item, text);
		}

		if (this.getIsNumericRepresentation() == null) {
			this.setIsNumericRepresentation(false);
		}
	}

	private static boolean isNumeric(String str) {
		for (char c : str.toCharArray()) {
			if (!Character.isDigit(c))
				return false;
		}
		return true;
	}

	private static boolean startsWithNumber(String str) {
		char[] c = str.toCharArray();

		if (c.length > 0 && !Character.isDigit(c[0])) {
			return false;
		}
		return true;
	}

	// public Map<Integer, Integer> getNumbersAndCounts() {
	// public AbstractItemsEnumeration<T> getNumbersAndCounts() {
	public Map<?, Integer> getNumbersAndCounts() {
		// return this.numbersAndCounts;
		// return (AbstractItemsEnumeration<T>)
		// this.itemsCountsComments.getNumbersAndCounts();
		return this.itemsCountsComments.getNumbersAndCounts();
	}

	// public void setNumbersAndCounts(Map<Integer, Integer> data) {
	// this.numbersAndCounts = data;
	// }

	public void addNumberAndCount(int number, int count) {
		// this.numbersAndCounts.put(number, count);

		if (this.itemsCountsComments == null)
			this.itemsCountsComments = FactoryItemsEnumeration.getItemEnumerationType(Integer.class);

		itemsCountsComments.putCounts(number, count);
	}

	public void addNumberAndCount(String item, int count) {
		if (this.itemsCountsComments == null)
			this.itemsCountsComments = FactoryItemsEnumeration.getItemEnumerationType(String.class);

		this.itemsCountsComments.putCounts(item, count);
	}

	// public Map<Integer, String> getAdditionalText() {
	public Map<?, String> getAdditionalText() {
		// return this.additionalText;
		return this.itemsCountsComments.getAdditionalText();
	}

	// public void addAdditionalText(int number, String text) {
	// this.additionalText.put(number, text);
	// }

	public void addAdditionalText(int number, String comment) {
		this.itemsCountsComments.putComment(number, comment);
	}

	public void addAdditionalText(String item, String comment) {
		this.itemsCountsComments.putComment(item, comment);
	}

	public String getSubCategorySeries() {
		return subCategorySeries;
	}

	public void setSubCategorySeries(String subCategorySeries) {
		this.subCategorySeries = subCategorySeries;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	// // конвертиране на ... нещо си - може да потрябва
	// public Map<Integer, Integer> convertData(ResultSet rs) {
	// return this.numbersAndCounts;
	// }

	public String getNumbersFromTo() {
		return numbersFromTo;
	}

	public void setNumbersFromTo(String numbersFromTo) {
		this.numbersFromTo = numbersFromTo;
	}

	public Boolean getIsNumericRepresentation() {
		return isNumericRepresentation;
	}

	public void setIsNumericRepresentation(Boolean isNumericRepresentation) {
		this.isNumericRepresentation = isNumericRepresentation;
	}

	public String compactList() {

		if (this.itemsCountsComments == null)
			return "";

		int i = 0;
		int iMax = this.itemsCountsComments.getNumbersAndCounts().size();
		String result = "";

		if (this.getIsNumericRepresentation()) {
			int[] onlyNumbers = numbersToArr();

			while (i < iMax) {
				int j = 1;
				while ((i + j < iMax) && onlyNumbers[i + j - 1] == onlyNumbers[i + j] - 1
						&& this.itemsCountsComments.getCounts(onlyNumbers[i + j - 1]) == 1
						&& this.itemsCountsComments.getComment(onlyNumbers[i + j - 1]) == null) {
					j++;
				}

				/*-номерът с коментар да не е в интервала х-у, а да е отделен със запетая */
				if (j > 1 && (this.itemsCountsComments.getComment(onlyNumbers[i + j - 1]) != null
						|| this.itemsCountsComments.getCounts(onlyNumbers[i + j - 1]) > 1))
					j--;

				if (j > 2)
					result += onlyNumbers[i] + "-" + onlyNumbers[i + j - 1];
				else if (j == 2)
					result += onlyNumbers[i] + "," + onlyNumbers[i + j - 1];
				else
					result += onlyNumbers[i + j - 1];

				int currentCount = this.itemsCountsComments.getCounts(onlyNumbers[i + j - 1]);
				String currentText = this.itemsCountsComments.getComment(onlyNumbers[i + j - 1]);

				if (currentCount > 1 && currentText != null) { //
					result += "(" + currentCount + ";" + this.itemsCountsComments.getComment(onlyNumbers[i + j - 1])
							+ ")";
				} else if (currentCount > 1) {
					result += "(" + currentCount + ")";
				} else if (currentText != null) {
					result += "(" + currentText + ")";
				}

				result += ",";
				i += j;
			}

		} else {
			String[] onlyNumbersAsLabels = labelsToArr();

			while (i < iMax) {
				int currentCount = this.itemsCountsComments.getCounts(onlyNumbersAsLabels[i]);
				String currentText = this.itemsCountsComments.getComment(onlyNumbersAsLabels[i]);

				result += onlyNumbersAsLabels[i];

				if (currentCount > 1 && currentText != null) { //
					result += "(" + currentCount + ";" + this.itemsCountsComments.getComment(onlyNumbersAsLabels[i])
							+ ")";
				} else if (currentCount > 1) {
					result += "(" + currentCount + ")";
				} else if (currentText != null) {
					result += "(" + currentText + ")";
				}

				result += ",";

				i++;
			}
		}

		if ("".equals(result)) {
			return result;
		} else {
			return result.substring(0, result.length() - 1);
		}
	}

	private int[] numbersToArr() {
		int i = 0;
		int iMax = this.itemsCountsComments.getNumbersAndCounts().size();
		int[] onlyNumbers = new int[iMax];
		for (Object key : this.itemsCountsComments.getNumbersAndCounts().keySet()) {

			onlyNumbers[i] = (Integer) key;
			i++;
		}
		return onlyNumbers;
	}

	private String[] labelsToArr() {
		int i = 0;
		int iMax = this.itemsCountsComments.getNumbersAndCounts().size();
		String[] onlyLabels = new String[iMax];
		for (Object key : this.itemsCountsComments.getNumbersAndCounts().keySet()) {

			onlyLabels[i] = (String) key;
			i++;
		}
		return onlyLabels;
	}

	public boolean isEmpty() {
		return this == null && this.getCategory().isEmpty() && this.getSubCategorySeries().isEmpty()
				&& this.itemsCountsComments.getNumbersAndCounts().isEmpty()
				&& this.itemsCountsComments.getAdditionalText().isEmpty();
	}
}
