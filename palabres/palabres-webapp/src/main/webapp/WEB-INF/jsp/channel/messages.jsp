<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>

	<body class="corps container" onload="auto()">
		<%@ include file="../_include/header.jsp"%>

		<div class="jumbotron">
			<div class="row">
				<h2>
					<s:property value="channelName" />
				</h2>

				<table id="listMessages" class="table-bordered table-striped table-condensed col-xs-12">

				</table>
			</div>

			<div class="row">
				<input name="newMessage" type="text" placeholder="Message..." class="input-md col-md-10"/>
				<button onclick="sendMessage()" class="btn btn-primary col-md-2"> <s:text name="messages.send" /></button>
			</div>

			
			<div class="row">
				<div class="col-xs-12 text-center">
					<button onclick="reloadListMessages()" class="btn btn-primary"><span class="glyphicon glyphicon-retweet"></span> <s:text name="messages.actualize" /></button>
				</div>
			</div>
			<div  class="row">
				<div class="col-xs-12 text-center">
					<input name="autoRefresh" onclick="auto()" type="checkbox" checked/>
					<label for="autoRefresh"><s:text name="messages.autoActualize" /></label>
				</div>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
			function auto(){
				if( $("input[name=autoRefresh]").is(":checked") ){
					reloadListMessages();
					setTimeout(auto,5000);
				}
			}		

			function reloadListMessages() {
				var longueur = $('#listMessages > *').length.toString();

				// URL de l'action AJAX
				var url = "<s:url action="ajax_getListMessages"/>";

				// Paramètres de la requête AJAX
				var params = {
					channelName: "${channelName}", channelActualLengh: longueur
				};

				// Action AJAX en POST
				jQuery.post(
					url,
					params,
					function (data) {
						var $listMessages = jQuery("#listMessages");
						jQuery.each(data, function (key, val) {
							$listMessages.append(
								jQuery("<tr><td>")
								.append(val.author.pseudo)
								.append("</td><td>")
								.append(val.message)
								.append("</td></tr>")
							);
						});
					}
				)
				.fail(function () {
					alert("Une erreur s'est produite.");
				});
			}
			
			function sendMessage() {
				var longueur = $("#listMessages > *").length.toString();
				var message = $("input[name=newMessage]").val();

				// URL de l'action AJAX
				var url = "<s:url action="ajax_newMessage"/>";

				// Paramètres de la requête AJAX
				var params = {
					channelName: "${channelName}", channelActualLengh: longueur, message: message
				};

				// Action AJAX en POST
				jQuery.post(
					url,
					params,
					function (data) {
						var $listMessages = jQuery("#listMessages");
						jQuery.each(data, function (key, val) {
							$listMessages.append(
								jQuery("<tr><td>")
								.append(val.author.pseudo)
								.append("</td><td>")
								.append(val.message)
								.append("</td></tr>")
							);
						});
					}
				)
				.fail(function () {
					alert("Une erreur s'est produite.");
				});
				
				$("input[name=newMessage]").val("");
			}
		</script>
	</body>
</html>