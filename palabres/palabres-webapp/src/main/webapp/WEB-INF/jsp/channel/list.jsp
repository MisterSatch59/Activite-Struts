<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>
	
	<body class="corps container">
		<%@ include file="../_include/header.jsp"%>
		
		<div class="jumbotron">
			<div class="row">
				<h2>
					<s:text name="channel.list.title" />
				</h2>
					<s:iterator value="listChannel">
						<s:a action="messagesChannel" class="btn btn-block btn-lg btn-custom"><span class="glyphicon glyphicon-play"></span>
							<s:param name="channelName" value="name" /><s:property value="name" />
						</s:a>
				</s:iterator>
				
				<h2>
					<s:text name="channel.list.create.title" />
				</h2>
				<s:a action="createChannel" class="col-md-offset-4 col-md-4 btn btn-lg btn-custom2">
					<span class="glyphicon glyphicon-pencil"></span>
					<s:text name="channel.list.createChannel" />
				</s:a>
			</div>
		</div>
	</body>
</html>