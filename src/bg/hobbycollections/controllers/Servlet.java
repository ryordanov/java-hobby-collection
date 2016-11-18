package bg.hobbycollections.controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bg.hobbycollections.dbconnection.DBMySqlConnector;
import bg.hobbycollections.dbconnection.XLSConnector;
import bg.hobbycollections.model.GumInserts;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Hobby")
public class Servlet extends HttpServlet {
	ArrayList<GumInserts> wholeCollection = null;
	GumInserts gi = null;

	@Override
	public void init() throws ServletException {
		/*- probably is better to make Factory - if there is no DB, to use xls */
		// XLSConnector connector = new XLSConnector();
		DBMySqlConnector connector = new DBMySqlConnector();
		wholeCollection = connector.getWholeCollection();
		super.init();
	}

	HttpSession session;
	private static final long serialVersionUID = 1L;
	public static final String HTML_START = "<head>"
			+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">" + "<title>Сървлет</title>"
			+ "</head><body>";

	public static final String HTML_END = "</body></html>";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append(HTML_START + "<h2>:::списък на картинки!:::</h2><br/>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		response.getWriter().append(HTML_END);

		int i = 0;
		for (GumInserts gum : wholeCollection) {
			//request.setAttribute("gi" + ++i, gum);
			
			request.getSession().setAttribute("gumInserts" + ++i, gum);
		}
		//request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// response.sendRedirect("login.jsp");
	}

}
