<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="_include/head.jsp"%>
	</head>
	
	<body class="corps container">
	    <%@ include file="_include/header.jsp"%>

		<div class="jumbotron">

			<form class="form-horizontal" action="login">
				<fieldset>
					<legend><s:text name="login.title" /></legend>
	
					<div class="form-group">
						<label class="col-md-4 control-label" for="pseudo"><s:text name="login.label" /></label>
						<div class="col-md-4">
							<s:textfield class="form-control input-md" id="pseudo" name="pseudo" requiredLabel="true" />
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-md-offset-4 col-md-4">
							<s:submit id="singlebutton" name="singlebutton" class="btn btn-primary" key="login.submit" />
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</body>
</html>