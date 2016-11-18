package bg.hobbycollections.model;

import java.util.TreeMap;

public class ItemsIntegerEnumeration extends AbstractItemsEnumeration<Integer> {

	public ItemsIntegerEnumeration() {
		// TODO Auto-generated constructor stub
		numbersAndCounts = new TreeMap<Integer, Integer>(); // number:count
		additionalText = new TreeMap<Integer, String>(); // number:comment
	}
}
