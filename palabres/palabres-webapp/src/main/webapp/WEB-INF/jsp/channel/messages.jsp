<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
				<h2><s:property value="channelName" /></h2>
				
				<table class="table-bordered table-striped table-condensed col-xs-12">
					<s:iterator value="listMessage">
						<tr>
							<td class="text-right"><s:property value="author.pseudo" /></td>
							<td><s:property value="message" /></td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<s:a action="messagesChannel" class="btn btn-primary"><span class="glyphicon glyphicon-retweet"></span><s:param name="channelName" value="channelName" /> <s:text name="messages.actualize" /></s:a>
				</div>
			</div>
		</div>
		
	</body>
</html>