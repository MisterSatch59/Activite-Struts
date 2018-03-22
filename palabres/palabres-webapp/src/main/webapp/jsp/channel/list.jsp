<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>
	
	<body>
		<%@ include file="../_include/header.jsp"%>
		
		<h2>
			<s:text name="channel.list.title" />
		</h2>
	
		<ul>
			<s:iterator value="listChannel">
				<li><s:a action="messagesChannel">
						<s:param name="channelName" value="name" />
						<s:property value="name" />
					</s:a></li>
			</s:iterator>
		</ul>
	
		<p>
			<s:a action="createChannel">
				<s:text name="channel.list.createChannel" />
			</s:a>
	</body>
</html>