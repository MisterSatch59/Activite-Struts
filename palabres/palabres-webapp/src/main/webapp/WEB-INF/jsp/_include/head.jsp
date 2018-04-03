<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
	margin-top: 70px;
	/*Permet au bloc-page de débuter sous la barre de nav*/
	margin-right: 10px;
	margin-left: 10px;
}

.btn-custom {
	background-color: hsl(147, 48%, 58%) !important;
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#e0f4e9",
		endColorstr="#60c78e");
	background-image: -khtml-gradient(linear, left top, left bottom, from(#e0f4e9),
		to(#60c78e));
	background-image: -moz-linear-gradient(top, #e0f4e9, #60c78e);
	background-image: -ms-linear-gradient(top, #e0f4e9, #60c78e);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0f4e9),
		color-stop(100%, #60c78e));
	background-image: -webkit-linear-gradient(top, #e0f4e9, #60c78e);
	background-image: -o-linear-gradient(top, #e0f4e9, #60c78e);
	background-image: linear-gradient(#e0f4e9, #60c78e);
	border-color: #60c78e #60c78e hsl(147, 48%, 49.5%);
	color: #333 !important;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.56);
	-webkit-font-smoothing: antialiased;
}

.btn-custom2 {
	background-color: hsl(252, 48%, 58%) !important;
	background-repeat: repeat-x;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#e4e0f4",
		endColorstr="#7560c7");
	background-image: -khtml-gradient(linear, left top, left bottom, from(#e4e0f4),
		to(#7560c7));
	background-image: -moz-linear-gradient(top, #e4e0f4, #7560c7);
	background-image: -ms-linear-gradient(top, #e4e0f4, #7560c7);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e4e0f4),
		color-stop(100%, #7560c7));
	background-image: -webkit-linear-gradient(top, #e4e0f4, #7560c7);
	background-image: -o-linear-gradient(top, #e4e0f4, #7560c7);
	background-image: linear-gradient(#e4e0f4, #7560c7);
	border-color: #7560c7 #7560c7 hsl(252, 48%, 49.5%);
	color: #333 !important;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.56);
	-webkit-font-smoothing: antialiased;
}
</style>

<title><s:text name="head.title" /></title>
<s:head />
