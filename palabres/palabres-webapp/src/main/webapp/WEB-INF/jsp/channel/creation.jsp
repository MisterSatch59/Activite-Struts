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

			<form class="form-horizontal" action="createChannel">
				<fieldset>
					<legend><s:text name="creation.title" /></legend>
	
					<div class="form-group">
						<label class="col-md-4 control-label" for="id"><s:text name="creation.channel.name" /></label>
						<div class="col-md-4">
							<s:textfield class="form-control input-md" id="id" name="channelName" requiredLabel="true" />
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-md-offset-4 col-md-4">
							<s:submit class="btn btn-primary" value="Valider" />
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</body>
</html>