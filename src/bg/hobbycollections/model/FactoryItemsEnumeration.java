package bg.hobbycollections.model;

public class FactoryItemsEnumeration {

	@SuppressWarnings("unchecked")
	public static <T> AbstractItemsEnumeration<T> getItemEnumerationType(Class<?> criteria) {
		if (criteria == Integer.class)
		//if ("numbers".equals(criteria))
			return  (AbstractItemsEnumeration<T>) new ItemsIntegerEnumeration();
		else 
			//criteria.getClass() == String.class
			return (AbstractItemsEnumeration<T>) new ItemsStringEnumeration();

	}
}
