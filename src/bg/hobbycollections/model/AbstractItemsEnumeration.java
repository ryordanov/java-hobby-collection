package bg.hobbycollections.model;

import java.util.Map;

public abstract class AbstractItemsEnumeration<T> {
	Map<T, Integer> numbersAndCounts = null; /*- = new TreeMap<Integer / String, Integer>(); // item:count */
	Map<T, String> additionalText = null; /*- = new TreeMap<Integer / String, String>(); // item:comment */

	// public Integer getCounts(T key) {
	// return numbersAndCounts.get(key);
	// }

	public Integer getCounts(int number) {
		return numbersAndCounts.get(number);
	}

	public Integer getCounts(String item) {
		return numbersAndCounts.get(item);
	}
	
//	public void putCounts(T item, Integer value) {
//		numbersAndCounts.put(item, value);
//	}
	
	public void putCounts(Integer item, Integer value) {
		
		numbersAndCounts.put((T) item, value);
	}
	
	public void putCounts(String item, Integer value) {
		numbersAndCounts.put((T)item, value);
	}
	
	
	//////////////////////////////////////////////
	// public String getComment(T key) {
	// return additionalText.get(key);
	// }

	public String getComment(int number) {
		return additionalText.get(number);
	}

	public String getComment(String item) {
		return additionalText.get(item);
	}
	///////////////////////////////////////////////////

//	public void putComment(T item, String value) {
//		additionalText.put(item, value);
//	}
	
	public void putComment(Integer item, String value) {
		additionalText.put((T) item, value);
	}
	
	public void putComment(String item, String value) {
		additionalText.put((T)item, value);
	}

	public Map<T, String> getAdditionalText() {
		return additionalText;
	}

	public Map<T, Integer> getNumbersAndCounts() {
		return numbersAndCounts;
	}

	public void setNumbersAndCounts(Map<T, Integer> numbersAndCounts) {
		this.numbersAndCounts = numbersAndCounts;
	}

}
