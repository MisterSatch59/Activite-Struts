<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>
	
	<body>
		<%@ include file="../_include/header.jsp"%>
		
		<h2><s:text name="creation.title" /></h2>
	
		<s:form action="createChannel">
			<s:textfield name="channelName" key="creation.channel.name" requiredLabel="true" />
			<s:submit key="creation.validate" />
		</s:form>
	</body>
</html>