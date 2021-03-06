<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pretius" tagdir="/WEB-INF/tags" %>
<%@ page %>

<!DOCTYPE html>
<html>
<head>
	<pretius:bootstrapHeadContent pageTitle="System raportowania Pretius"/>

	<style>
		body {
			padding-top: 50px;
		}
	</style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
				aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'/>">System raportowania Pretius</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			</ul>
			<form class="navbar-form navbar-right" action="<c:url value='/logout'/>" method="post">
				<input type="submit" class="btn btn-default" value="Wyloguj się"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		</div>
	</div>
</nav>

<div class="container">

	<table class="table table-bordered table-hover table-striped table-condensed">
		<caption>
			Liczba godzin przepracowanych na projektach klientów podzielona per projekt i miesiąc w którym został ten
			czas poświęcony
		</caption>
		<thead>
		<tr>
			<th>Nazwa klienta</th>
			<th>Nazwa projektu</th>
			<th>Liczba godzin w miesiącu</th>
			<th>Miesiąc z rokiem</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="reportRow" items="${reportRows}">
			<tr>
				<td><c:out value="${reportRow.clientName}"/></td>
				<td><c:out value="${reportRow.projectName}"/></td>
				<td><c:out value="${reportRow.totalHoursWorked}"/></td>
				<td><c:out value="${reportRow.yearMonth}"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>

<pretius:bootstrapFooter/>
</body>
</html>
