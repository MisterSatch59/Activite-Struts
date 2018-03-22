<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="_include/head.jsp"%>
	</head>
	
	<body>
	    <%@ include file="_include/header.jsp"%>
		
		<h2><s:text name="index.welcome" /></h2>
		<s:if test="#session.user">
			<s:a action="listChannel">
				<s:text name="index.title.channelList" />
			</s:a>
		</s:if>
	
		<footer>
			<s:a action="index">
				<s:param name="request_locale">en</s:param>
		            [English]
		        </s:a>
			<s:a action="index">
				<s:param name="request_locale">fr</s:param>
		            [Français]
		        </s:a>
		</footer>
	</body>
</html>
