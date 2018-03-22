<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<header>
	<s:if test="#session.user">
            Utilisateur connecté :
            <s:property value="#session.user.pseudo" />

		<s:a action="logout"><s:text name="header.deconn" /></s:a>
	</s:if>
	<s:else>
		<s:a action="login"><s:text name="header.conn" /></s:a>
	</s:else>
</header>

<s:actionerror />
<s:actionmessage />
