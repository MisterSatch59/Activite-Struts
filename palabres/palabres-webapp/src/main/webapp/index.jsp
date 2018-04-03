<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/jsp/_include/head.jsp"%>
	</head>
	
	<body class="corps container">
		<%@ include file="/WEB-INF/jsp/_include/header.jsp"%>
	
		<div class="jumbotron">
			<div class="row">
				<h2>
					<s:text name="index.welcome" />
				</h2>
				<p>
					<s:text name="index.message" />
				</p>
				<p><s:text name="index.message2" /><s:a action="login"><s:text name="index.here" /></s:a>.</p>
				
				<s:if test="#session.user">
					<div class="col-md-offset-4 col-md-4">
						<s:a action="listChannel" class="btn btn-primary"><span class="glyphicon glyphicon-send"></span> <s:text name="index.title.channelList" /></s:a>
					</div>
				</s:if>
			</div>
		</div>

		<footer>
			<p>
				<s:a action="index">
					<s:param name="request_locale">en</s:param>
					<img alt="[English]" src="img/en.png">
				</s:a>
				<s:a action="index">
					<s:param name="request_locale">fr</s:param>
					<img alt="[Français]" src="img/fr.png">
				</s:a>
			</p>
		</footer>
	</body>
</html>
