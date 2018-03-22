<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="_include/head.jsp"%>
	</head>
	
	<body>
	    <%@ include file="_include/header.jsp"%>
	
		<h2><s:text name="login.title" /></h2>
	
		<s:form action="login">
			<s:textfield name="pseudo" key="login.label" requiredLabel="true" />
			<s:submit key="login.submit" />
		</s:form>
	</body>
</html>