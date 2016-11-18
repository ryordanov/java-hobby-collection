package bg.hobbycollections.model;

import java.util.TreeMap;

public class ItemsStringEnumeration extends AbstractItemsEnumeration<String> {
	public ItemsStringEnumeration() {
		// TODO Auto-generated constructor stub
		numbersAndCounts = new TreeMap<String, Integer>(); // item:count
		additionalText = new TreeMap<String, String>(); // item:comment
	}
}
