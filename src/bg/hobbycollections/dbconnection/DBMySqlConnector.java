package bg.hobbycollections.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import bg.hobbycollections.model.AbstractItemsEnumeration;
import bg.hobbycollections.model.GumInserts;

public class DBMySqlConnector implements IConnector {
	final String DBUrl = "jdbc:mysql://localhost:3306/";
	final String DBname = "hobbycollections";
	final String DBusername = "root";
	final String DBpassword = "";

	private Connection conn = null;
	private Statement stmt = null;

	public DBMySqlConnector()/* implements AutoCloseable */ {
		openConnection();
	}

	private void openConnection() {
		try {
			// new com.mysql.jdbc.Driver();
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*- conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase?user=testuser&password=testpassword");*/
			conn = DriverManager.getConnection(DBUrl + /* DBname + */ "?useUnicode=true&characterEncoding=utf-8",
					DBusername, DBpassword);
			stmt = conn.createStatement();

			createDatabaseIfNotExists();
			conn.setCatalog(DBname);
			stmt = conn.createStatement();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getDefaultQuery() {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery("SELECT * FROM subcategories");
			while (rs.next()) {
				String id = rs.getString("id");
				String label = rs.getString("label");
				System.out.println("ID: " + id + ", Label of the serie: " + label);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/*-	
		  //insert i prepared statement
		  //http://www.vogella.com/tutorials/MySQLJava/article.html String
		  insertNewUserSQL = "INSERT INTO " + studentsTable +  " VALUES (?, ?, ?, ?, ?, ?, ?)"; 
		  PreparedStatement pstmt =	  conn.prepareStatement(insertNewUserSQL); 
		  pstmt.setString(1, userName);
		  //... repeat this step until the last parameter .... pstmt.setString(7,  email); 
		  pstmt.executeUpdate();
		 */

	private int executeUpdate(String sql) {
		int result = 0;

		// before update checks if connection is open
		try {
			if (conn.isClosed()) {
				openConnection();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		// try to executeUpdate the sql command
		try {
			result = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("Couldn't executeUpdate sql command: " + sql + e.toString());
		}
		return result;
	}

	public ResultSet executeQuery(String sql) {
		ResultSet rs = null;
		// before Query checks if connection is open
		try {
			if (conn.isClosed()) {
				openConnection();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		// try to executeQuery the sql command
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("Couldn't executeQuery sql command: " + sql);
		}
		return rs;
	}

	////// makes each time new statement - for resultset in while loop
	public ResultSet executeQueryWithNewStatment(String sql) {
		ResultSet rs = null;
		// before Query checks if connection is open
		try {
			if (conn.isClosed()) {
				openConnection();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		// try to executeQuery the sql command
		try {
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			System.out.println("Couldn't executeQuery sql command: " + sql);
		}
		return rs;
	}
	//////

	public void closeConnection() {
		// if connection is open try to close the connection
		try {
			if (stmt != null) {
				stmt.close();
			}
			if (!conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("Failed to close database connection");
		}
	}

	public void createDatabaseIfNotExists() {
		String sql = "CREATE DATABASE IF NOT EXISTS `hobbycollections` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;";
		executeUpdate(sql);

	}

	public void createTableCategories() {
		String sql = "CREATE TABLE IF NOT EXISTS `categories` (" + " `id` int(2) unsigned NOT NULL AUTO_INCREMENT,"
				+ " `label` varchar(50) NOT NULL COMMENT 'турбо, би-биб, ...',"
				+ " `type` int(2) unsigned NOT NULL COMMENT 'parent'," + " PRIMARY KEY (`id`)," + " KEY `type` (`type`)"
				+ " ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Съхранява различните видове от даден тип' AUTO_INCREMENT=0 ;";
		executeUpdate(sql);
	}

	public void createTableItems() {
		String sql = "CREATE TABLE IF NOT EXISTS `items` (" + "`id` int(11) unsigned NOT NULL AUTO_INCREMENT,"
				+ " `item` int(4) unsigned DEFAULT NULL,"
				+ " `fromCollection` int(3) unsigned NOT NULL COMMENT 'parent is subcategory id',"
				+ " `countOfThisItem` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Бройки от конкретния номер картинки, списания...',"
				+ " PRIMARY KEY (`id`)," + " UNIQUE KEY `itemfromcollection` (`item`,`fromCollection`)"
				+ " ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
		executeUpdate(sql);
	}

	public void createTableItemslabels() {
		String sql = "CREATE TABLE IF NOT EXISTS `itemslabels` (" + "`id` int(11) unsigned NOT NULL AUTO_INCREMENT,"
				+ " `label` varchar(30) DEFAULT NULL COMMENT 'label на картинки, които нямат номерация',"
				+ " PRIMARY KEY (`id`)" + ") ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
		executeUpdate(sql);
	}

	public void createTableItemsdescription() {
		String sql = "CREATE TABLE IF NOT EXISTS `itemsdescription` ("
				+ "  `id` int(3) unsigned NOT NULL AUTO_INCREMENT," + "  `item_id` int(11) unsigned NOT NULL,"
				+ "  `description` varchar(50) DEFAULT NULL COMMENT 'описание на повреда, специфичност към номера...',"
				+ "  PRIMARY KEY (`id`)" + ") ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
		executeUpdate(sql);
	}

	public void createTableSubcategories() {
		String sql = "CREATE TABLE IF NOT EXISTS `subcategories` (" + "  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,"
				+ "  `label` varchar(50) DEFAULT NULL COMMENT 'турбо: класик, спорт',"
				+ "  `parentCategory` int(2) unsigned NOT NULL COMMENT 'Турбо, би-биб...',"
				+ "  `numbersFromTo` varchar(8) DEFAULT NULL COMMENT '101-200 примерно'," + "  PRIMARY KEY (`id`),"
				+ "  `isNumericRepresentation` tinyint(2) unsigned DEFAULT NULL COMMENT 'имат ли картинките/марките номера',"
				+ "  KEY `parentCategory` (`parentCategory`)"
				+ ") ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
		executeUpdate(sql);
	}

	public void createTableTypeofcollection() {
		String sql = "CREATE TABLE IF NOT EXISTS `typeofcollection` ("
				+ "  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,"
				+ "  `type` varchar(30) NOT NULL COMMENT 'картинки, списания, марки...'," + "  PRIMARY KEY (`id`)"
				+ ") ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Съхранява типа на колекцията' AUTO_INCREMENT=0 ;";
		executeUpdate(sql);

		String sql_insert = "INSERT INTO `typeofcollection` (`id`, `type`) VALUES" + "(1, 'Картинки от дъвки'),"
				+ "(2, 'Списания');";
		executeUpdate(sql_insert);
	}

	public void initializeDatabase() {
		// db.createDatabaseHobbycollections();
		this.createTableTypeofcollection();
		this.createTableCategories();
		this.createTableSubcategories();
		this.createTableItems();
		this.createTableItemslabels();
		this.createTableItemsdescription();

		this.truncateTable("items");
		this.truncateTable("itemslabels");
		this.truncateTable("itemsdescription");
		this.truncateTable("categories");
		this.truncateTable("subcategories");
	}

	/*-
	 private void createDatabaseAndTables() {
		 String sql = "CREATE DATABASE IF NOT EXISTS `hobbycollections` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; CREATE TABLE IF NOT EXISTS `categories` ( `id` int(2) unsigned NOT NULL AUTO_INCREMENT, `label` varchar(30) NOT NULL COMMENT 'турбо, би-биб, ...', `type` int(2) unsigned NOT NULL COMMENT 'parent', PRIMARY KEY (`id`), KEY `type` (`type`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Съхранява различните видове от даден тип' AUTO_INCREMENT=29 ;CREATE TABLE IF NOT EXISTS `items` ( `id` int(11) unsigned NOT NULL AUTO_INCREMENT, `item` int(4) unsigned DEFAULT NULL, `fromCollection` int(3) unsigned NOT NULL COMMENT 'parent is subcategory id', `countOfThisItem` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Бройки от конкретния номер картинки, списания...', PRIMARY KEY (`id`), UNIQUE KEY `itemfromcollection` (`item`,`fromCollection`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1610 ;CREATE TABLE IF NOT EXISTS `itemsdescription` ( `id` int(3) unsigned NOT NULL AUTO_INCREMENT, `item_id` int(11) unsigned NOT NULL, `description` varchar(50) DEFAULT NULL COMMENT 'описание на повреда, специфичност към номера...', PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;CREATE TABLE IF NOT EXISTS `subcategories` ( `id` int(2) unsigned NOT NULL AUTO_INCREMENT, `label` varchar(30) DEFAULT NULL COMMENT 'турбо: класик, спорт', `parentCategory` int(2) unsigned NOT NULL COMMENT 'Турбо, би-биб...', `numbersFromTo` varchar(8) DEFAULT NULL COMMENT '101-200 примерно', PRIMARY KEY (`id`), KEY `parentCategory` (`parentCategory`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;CREATE TABLE IF NOT EXISTS `typeofcollection` ( `id` int(2) unsigned NOT NULL AUTO_INCREMENT, `type` varchar(20) NOT NULL COMMENT 'картинки, списания, марки...', PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Съхранява типа на колекцията' AUTO_INCREMENT=3 ;";
	 }*/

	/////////////////////////
	@Override
	public ArrayList<GumInserts> getWholeCollection() {

		ArrayList<GumInserts> wholeCollection = new ArrayList<GumInserts>();
		GumInserts gi = null;

		try {
			ResultSet typeOfCollection = this.executeQueryWithNewStatment("SELECT * FROM typeofcollection");
			while (typeOfCollection.next()) {
				int tId = typeOfCollection.getInt("id");
				// String tType = typeOfCollection.getString("type");

				ResultSet mainCategories = this
						.executeQueryWithNewStatment("SELECT * FROM categories WHERE type=" + tId);
				while (mainCategories.next()) {
					int cId = mainCategories.getInt("id");
					String cLabel = mainCategories.getString("label");

					ResultSet subCategories = this
							.executeQueryWithNewStatment("SELECT * FROM subcategories WHERE parentCategory=" + cId);
					while (subCategories.next()) {
						int sId = subCategories.getInt("id");
						String sLabel = subCategories.getString("label");
						String sNumbersFromTo = subCategories.getString("numbersFromTo");
						Boolean sIsNumericRepresentation = (subCategories.getInt("isNumericRepresentation") != 0);

						gi = new GumInserts(cLabel, sLabel, sNumbersFromTo,
								sIsNumericRepresentation);/*- making a single gum row */
						// System.out.println(cLabel + ":" + sLabel);

						String simpleQuery = simplifyQueryTest(gi, sId, sIsNumericRepresentation);//////////////////

						ResultSet items = this
								.executeQueryWithNewStatment("SELECT * FROM items WHERE fromCollection=" + sId);
						while (items.next()) {
							int iId = items.getInt("id");
							int iItem = items.getInt("item");
							int iCountOfThisItem = items.getInt("countOfThisItem");

							if (sIsNumericRepresentation) {
								gi.addNumberAndCount(iItem, iCountOfThisItem);
							} else {
								ResultSet itemsAsLabels = this
										.executeQueryWithNewStatment("SELECT * FROM itemslabels WHERE id=" + iItem);
								if (itemsAsLabels.next()) {
									// int iLabelId =
									// itemsAsLabels.getInt("id");
									String iLabel = itemsAsLabels.getString("label");
									gi.addNumberAndCount(iLabel, iCountOfThisItem);
								}
							}

							ResultSet itemsDescription = this
									.executeQueryWithNewStatment("SELECT * FROM itemsdescription WHERE item_id=" + iId);
							while (itemsDescription.next()) {
								// int dId = itemsDescription.getInt("id");
								String dDescription = itemsDescription.getString("description");
								if (sIsNumericRepresentation) {
									gi.addAdditionalText(iItem, dDescription);
								} else {
									ResultSet itemsAsLabels = this
											.executeQueryWithNewStatment("SELECT * FROM itemslabels WHERE id=" + iItem);
									if (itemsAsLabels.next()) {
										String iLabel = itemsAsLabels.getString("label");
										gi.addAdditionalText(iLabel, dDescription);
									}
								}
							}
						}
						if (!gi.isEmpty())
							wholeCollection.add(gi);
						else
							System.out.println("Empty GumInserts object has not been inserted");
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return wholeCollection;
	}

	////////////////////////

	private String simplifyQueryTest(GumInserts gi, int sId, boolean sIsNumericRepresentation) {
		/*-
		SELECT news.id, users.username, news.title, news.date, news.body, COUNT(comments.id)
		FROM news
			LEFT JOIN users
		ON news.user_id = users.id
			LEFT JOIN comments
		ON comments.news_id = news.id
		GROUP BY news.id
		*/

		String sql = "SELECT `items`.`id`, `items`.`item`, `items`.`countOfThisItem`, `itemslabels`.`id`, `itemslabels`.`label`, " + //
				"`itemsdescription`.`id`, `itemsdescription`.`item_id`, `itemsdescription`.`description` " + //
				"FROM `items` " + //
				"LEFT JOIN `itemslabels` " + //
				"ON items.item = `itemslabels`.`id` " + //
				"LEFT JOIN `itemsdescription` " + //
				"ON `items`.`id` = `itemsdescription`.`item_id` " + //
				"WHERE `items`.`fromCollection`= " + sId + " " + //
				"GROUP BY `items`.`id`" ; //

		ResultSet items = this.executeQueryWithNewStatment(sql);
		try {
			while (items.next()) {
				int iId = items.getInt("items.id");
				int iItem = items.getInt("items.item");
				int iCountOfThisItem = items.getInt("items.countOfThisItem");

				int lLabelId = items.getInt("itemslabels.id");
				String lLabel = items.getString("itemslabels.label");

				int dId = items.getInt("itemsdescription.id");
				int dItemId = items.getInt("itemsdescription.item_id");
				String dDescription = items.getString("itemsdescription.description");
				System.out.println(iId + ":" + iItem + ":" + iCountOfThisItem + ":" + lLabelId + ":" + lLabel + ":" + 
						dId + ":" + dItemId + ":" + dDescription );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	////////////////////

	public Integer insertCategoryByLabel(String labelCategory) {
		final int TYPE_OF_COLLECTION = 1; /*- картинки...да вкарам колона с типове  ексела? */
		labelCategory = escapeStrings(labelCategory);
		Integer dbItemId = -1;

		ResultSet items = this.executeQuery("SELECT * FROM categories WHERE label = " + labelCategory);

		try {
			if (!items.next()) {

				Integer affectedRows = this.executeUpdate("INSERT INTO categories (label, type) VALUES ("
						+ labelCategory + ", " + TYPE_OF_COLLECTION + " )");

				if (affectedRows == 1) {
					ResultSet newItem = this.executeQuery("SELECT * FROM categories WHERE label = " + labelCategory);
					if (newItem.next())
						dbItemId = newItem.getInt("id");
				}
				return dbItemId;
			} else {
				dbItemId = items.getInt("id");
				return dbItemId;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbItemId;
	}

	public Integer insertSubcategoryByLabel(String labelSubcategory, int parentCategory, String numbersFromTo,
			boolean isNumericRepresentation) {
		String makeNewLabel = escapeStrings(labelSubcategory); // + "[" +
																// numbersFromTo
																// + "]"
		labelSubcategory = escapeStrings(labelSubcategory);
		numbersFromTo = escapeStrings(numbersFromTo);
		Integer dbItemId = -1;

		ResultSet items = this.executeQuery("SELECT * FROM subcategories WHERE label = " + makeNewLabel
				+ " AND parentCategory = " + parentCategory);

		try {
			if (!items.next()) {
				Integer affectedRows = this.executeUpdate(
						"INSERT INTO subcategories (label, parentCategory, numbersFromTo, isNumericRepresentation ) VALUES ("
								+ makeNewLabel + ", " + parentCategory + ", " + numbersFromTo + ", "
								+ isNumericRepresentation + " )");

				if (affectedRows == 1) {
					ResultSet newItem = this.executeQuery("SELECT * FROM subcategories WHERE label = " + makeNewLabel
							+ " AND parentCategory = " + parentCategory);
					if (newItem.next())
						dbItemId = newItem.getInt("id");
				}
				return dbItemId;
			} else {
				dbItemId = items.getInt("id");
				return dbItemId;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbItemId;
	}

	// 1) проверка дали вече картината я има в базата и да увелича бройката-done
	// 2) да може да се променя само текста? _нов метод да е
	public Integer insertItems(int subCategoryId, Map<?, Integer> numbersInSerie, boolean isNumericRepresentation) {
		if (subCategoryId < 0)
			return subCategoryId;

		String insertNumbersToDB = "";
		int affectedRowsDB = 0;

		if (isNumericRepresentation) {// only numbers

			for (Entry<?, Integer> entry : numbersInSerie.entrySet()) {
				Integer item = (Integer) entry.getKey();
				Integer countOfThisItem = entry.getValue();

				insertNumbersToDB += "(" + item + ", " + subCategoryId + ", " + countOfThisItem + ") ,";
			}
		} else { // only labels

			insertItemsAsLabels(numbersInSerie);

			for (Entry<?, Integer> entry : numbersInSerie.entrySet()) {

				String item = escapeStringsSingleQuote((String) entry.getKey());
				Integer countOfThisItem = entry.getValue();

				ResultSet items = this.executeQuery("SELECT * FROM itemslabels WHERE label = '" + item + "'");
				try {
					if (items.next()) {
						int dbItemId = items.getInt("id");
						insertNumbersToDB += "(" + dbItemId + ", " + subCategoryId + ", " + countOfThisItem + ") ,";

					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		if (insertNumbersToDB.length() > 0) {
			insertNumbersToDB = insertNumbersToDB.substring(0, insertNumbersToDB.length() - 1);

			/*- In MySQL there is a composite unique key: itemfromcollection(item,fromcollection) */

			affectedRowsDB = this.executeUpdate(
					"INSERT INTO items (item, fromCollection, countOfThisItem ) VALUES " + insertNumbersToDB
							+ "ON DUPLICATE KEY UPDATE countOfThisItem = countOfThisItem + VALUES(countOfThisItem)");
		}

		return affectedRowsDB;
	}

	/*-INSERT INTO Table2(Id, Name) SELECT DISTINCT Id, Name FROM Table1*/
	public Integer insertItemsAsLabels(Map<?, Integer> numbersInSerie) { /*-always ? will be STRING !!!*/
		String insertNumbersToDB = "";
		int affectedRowsDB = 0;

		for (Entry<?, Integer> entry : numbersInSerie.entrySet()) {
			String item = escapeStringsSingleQuote(
					(String) entry.getKey()); /*- items without numbers to be stored in DB labels in new table  */
			insertNumbersToDB += "('" + item + "') ,";
		}

		if (insertNumbersToDB.length() > 0) {
			insertNumbersToDB = insertNumbersToDB.substring(0, insertNumbersToDB.length() - 1);

			affectedRowsDB = this.executeUpdate("INSERT INTO itemslabels (label) VALUES " + insertNumbersToDB);
			/*-	+ "ON DUPLICATE KEY UPDATE item = 'item'");*/
		}
		return affectedRowsDB;
	}

	public Integer insertComments(int subCategoryId, Map<?, String> additionalTextMap,
			boolean isNumericRepresentation) {
		if (subCategoryId < 0) {
			return subCategoryId;
		}
		String insertTextToDB = "";
		int affectedRowsDB = 0;

		if (isNumericRepresentation) {

			ResultSet rs = this.executeQuery("SELECT * FROM items WHERE fromCollection = " + subCategoryId);
			try {
				while (rs.next()) {
					int id = rs.getInt("id");
					int item = rs.getInt("item");

					if (additionalTextMap.containsKey(item)) {
						String comment = additionalTextMap.get(item);
						insertTextToDB += "(" + id + ", " + escapeStrings(comment) + ") ,";
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			ResultSet rs = this.executeQuery("SELECT * FROM items WHERE fromCollection = " + subCategoryId);
			try {
				while (rs.next()) {
					int id = rs.getInt("id");
					int item = rs.getInt("item");

					ResultSet rsLabels = this
							.executeQueryWithNewStatment("SELECT * FROM itemslabels WHERE id = " + item);
					if (rsLabels.next()) {
						String label = rsLabels.getString("label");

						if (additionalTextMap.containsKey(label)) {
							String comment = additionalTextMap.get(label);
							insertTextToDB += "(" + id + ", " + escapeStrings(comment) + ") ,";
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (insertTextToDB.length() > 0) {
			insertTextToDB = insertTextToDB.substring(0, insertTextToDB.length() - 1);

			affectedRowsDB = this
					.executeUpdate("INSERT INTO itemsdescription (item_id, description ) VALUES " + insertTextToDB);
		}

		return affectedRowsDB;
	}

	public void truncateTable(String tableName) {
		executeUpdate("TRUNCATE TABLE " + tableName + ";");
	}

	private static final String escapeStrings(String text) {

		return text = "\"" + text.replace("\"", "\\\"") + "\"";
	}

	private static final String escapeStringsSingleQuote(String text) {

		return text.replace("'", "\\\'");
	}

}
