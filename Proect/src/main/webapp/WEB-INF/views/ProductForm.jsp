<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Form for Products</title>
</head>
<body>
	<center>

		<div style="color: #A0522D; font-size: 40px">Registration Form
			for Products</div>

		<form:form id="registerForm" modelAttribute="product" method="get"
			action="registerProduct">

			<table width="470px" height="250px" bgcolor="#F4A460">

				<c:if test="${!empty product.name}">

					<tr>
						<td><form:label path="id">Product ID:</form:label></td>
						<td><form:input path="id" value="${product.id}"
								readonly="true" /></td>
					</tr>
				</c:if>

				<tr>
					<td><form:label path="name">Product Name</form:label></td>
					<td><form:input path="name" /> <sf:errors path="name" /></td>
				</tr>
				<tr>
					<td><form:label path="price">Product Price</form:label></td>
					<td><form:input path="price" /> <sf:errors path="price" /></td>
				</tr>
				<tr>
					<td><form:label path="quantity">Product Quantity</form:label></td>
					<td><form:input path="quantity" /> <sf:errors path="quantity" />
					</td>
				</tr>
				<tr>

					<c:if test="${!empty product.name}">
						<td></td>
						<td><input type="submit" value="Update Product" /></td>

					</c:if>

					<c:if test="${empty product.name}">
						<td></td>
						<td><input type="submit" value="Add Product" /></td>

					</c:if>

				</tr>
			</table>
		</form:form>

		<a href="listAdmin">Click Here to see Products List</a>

	</center>
</body>
</html>
