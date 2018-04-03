<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<header>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<s:a action="index" class="navbar-brand">Palabres</s:a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<s:if test="#session.user">
						<li><a class="inactive">Utilisateur connecté : <s:property value="#session.user.pseudo" /></a></li>
						<li><s:a action="logout"><s:text name="header.deconn" /></s:a></li>
					</s:if>
					<s:else>
						<li><s:a action="login"><s:text name="header.conn" /></s:a></li>
					</s:else>
					
				</ul>
			</div>
		</div>
	</nav>

</header>

<s:actionerror />
<s:actionmessage />
