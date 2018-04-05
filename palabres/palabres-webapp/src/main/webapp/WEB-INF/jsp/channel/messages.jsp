<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../_include/head.jsp"%>
	</head>

	<body class="corps container" onload="init()">
		<%@ include file="../_include/header.jsp"%>

		<div class="jumbotron">
			<div class="row">
				<h2>
					<s:property value="channelName" />
				</h2>

				<table class="table-bordered table-striped table-condensed col-xs-12">
					<thead>
						<tr>
							<th class="active"></th>
							<th class="active text-center">Messages</th>
						</tr>
					</thead>
					<tbody id="listMessages">
					</tbody>
				</table>
			</div>

			<div class="row">
				<input name="newMessage" type="text" placeholder="Message..." class="input-md col-xs-10"/>
				<button onclick="sendMessage()" class="btn btn-primary col-xs-2"> <s:text name="messages.send" /></button>
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
			function init(){
				//var $listMessages = jQuery("#listMessages");
				//$listMessages.empty();
				auto();
			}
		
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
									jQuery("<tr>").append(
											jQuery("<td>").append(val.author.pseudo)
											).append(
													jQuery("<td>").append(val.message)
													)
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
									jQuery("<tr>").append(
											jQuery("<td>").append(val.author.pseudo)
											).append(
													jQuery("<td>").append(val.message)
													)
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