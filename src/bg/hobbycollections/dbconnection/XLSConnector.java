package bg.hobbycollections.dbconnection;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import bg.hobbycollections.model.GumInserts;

public class XLSConnector implements IConnector {
	/*-private final String excelFilePath = "C:\\Users\\ryordanov\\Documents\\Downloads\\javaRosen\\eclipse-jee-mars-R-win32\\projects\\HobbyCollections\\bg.xlsx";*/
	private String excelFilePath = "\\projects\\HobbyCollections\\bg.xlsx";
	private FileInputStream inputStream;
	private Workbook workbook;
	private final int SHEET_I_HAVE = 1;
	private final int COLUMN_WITH_NUMBERS = 3;
	private ArrayList<GumInserts> wholeCollection = new ArrayList<GumInserts>();

	public XLSConnector() {
		try {
			excelFilePath = new File(".").getAbsolutePath().toString().replace("\\eclipse\\.", excelFilePath);

			this.inputStream = openXlsFile(this.excelFilePath);
			this.workbook = openWorkbook(this.inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public XLSConnector(String xlsFilename) {
		try {
			this.inputStream = openXlsFile(xlsFilename);
			this.workbook = openWorkbook(this.inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<GumInserts> getWholeCollection() {
		Sheet currentSheet = this.workbook.getSheetAt(SHEET_I_HAVE);
		Iterator<Row> iterator = currentSheet.iterator();

		int i = 0;
		while (iterator.hasNext()) {
			Row currentRow = iterator.next();
			i++;
			Cell cellWithNumbers = currentRow.getCell(COLUMN_WITH_NUMBERS);// cellIterator.next();

			// Iterator<Cell> cellIterator = currentRow.cellIterator();
			// while (cellIterator.hasNext()) {

			//if (i > 70)
			//	System.out.println("");
			if (cellWithNumbers != null) {

				currentRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
				currentRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);

				String category = currentRow.getCell(0).getStringCellValue();
				String subCategory = currentRow.getCell(1).getStringCellValue();
				String numbersFromTo = currentRow.getCell(2).getStringCellValue();
				String numbers = cellWithNumbers.getStringCellValue();

				switch (cellWithNumbers.getCellType()) {
				case Cell.CELL_TYPE_STRING:
				case Cell.CELL_TYPE_BLANK:
					GumInserts gum = new GumInserts(category, subCategory + "[" + numbersFromTo + "]", numbersFromTo,
							numbers);
					if (!gum.isEmpty())
						wholeCollection.add(gum);
					break;
				// case Cell.CELL_TYPE_BOOLEAN:
				// System.out.print(cell.getBooleanCellValue());
				// break;
				// case Cell.CELL_TYPE_NUMERIC:
				// System.out.print(cell.getNumericCellValue());
				// break;
				}
			}

		}
		return wholeCollection;
	}

	private FileInputStream openXlsFile(String excelFilePath) throws FileNotFoundException {
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
		return inputStream;
	}

	private Workbook openWorkbook(FileInputStream inputStream) throws IOException {
		Workbook workbook = new XSSFWorkbook(inputStream);
		return workbook;

	}

	public String printRow(int rowNumber) {
		Sheet currentSheet = this.workbook.getSheetAt(SHEET_I_HAVE);
		Row currentRow = currentSheet.getRow(rowNumber);
		Cell cell = currentRow.getCell(COLUMN_WITH_NUMBERS);
		String result = "";

		if (cell != null) {
			currentRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
			currentRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
			
			String category = currentRow.getCell(0).getStringCellValue();
			String subCategory = currentRow.getCell(1).getStringCellValue();
			String numbersFromTo = currentRow.getCell(2).getStringCellValue();
			String numbers = cell.getStringCellValue();

			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_STRING:
			case Cell.CELL_TYPE_BLANK:

				result += category + " : " + subCategory + "[" + numbersFromTo + "]" + " : " + numbersFromTo + " : "
						+ numbers;

				break;
			}
		}
		return result;
	}
}
