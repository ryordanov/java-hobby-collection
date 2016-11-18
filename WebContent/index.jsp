<%@page import="bg.hobbycollections.model.GumInserts"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ct" uri="http://hobbycollections.bg/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Колекция от хобити (collection)</title>
</head>
<body>


	<table border="1">
		<%
			int i = 0;
			for (Enumeration e = session.getAttributeNames(); e.hasMoreElements();) {
				String attribName = (String) e.nextElement();
				GumInserts currentGum = (GumInserts) session.getAttribute(attribName);
		%>

		<tr>
			<%="<td>" + ++i + "</td><td>" + currentGum.getCategory() + "</td><td>"
						+ currentGum.getSubCategorySeries() + "</td><td>" + currentGum.getNumbersFromTo()
						+ "</td><td><font color='blue'> " + currentGum.compactList() + "</font></td>" %>
		</tr>
		<%
			}
		%>
	</table>
	<ct:ViewTags headerCaption="Картинки (inserts)"></ct:ViewTags>
	<form action="Hobby" method="post">
		<br>category ID: <input type="text" name="categoryId" /> <br>subcategory
		ID:<input type="text" name="subcategoryId" /> <br> <input
			type="submit" />
	</form>


	<table border="1">
		<thead>
			<tr>
				<td>item</td>
				<td>fromCollection</td>
				<td>description</td>
				<td>countOfThisItem</td>
			</tr>
		</thead>
		<c:if test="${not empty gumInserts}">
			<tbody>
				<c:forEach var="s" items="${gumInserts}">
					<tr>
						<td>${s.numbersAndCounts}</td>
						<td>${s.subCategorySeries}</td>
						<td>${s.additionalText}</td>
						<td>${s.numbersFromTo}</td>
					</tr>
				</c:forEach>
			</tbody>
		</c:if>
	</table>
</body>
</html>