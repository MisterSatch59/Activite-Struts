<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>
	
	<body>
		<%@ include file="../_include/header.jsp"%>
		
		<h2><s:property value="#session.actualChannelName" /></h2>
		
		<ul>
			<s:iterator value="listMessage">
				<li>
					<s:property value="author.pseudo" /> : 
					<s:property value="message" />
				</li>
			</s:iterator>
		</ul>
		<s:a action="messagesChannel"><s:text name="messages.actualize" /></s:a>
		
	</body>
</html>