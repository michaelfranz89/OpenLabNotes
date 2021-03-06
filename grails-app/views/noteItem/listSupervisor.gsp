
<%@ page import="org.openlab.notes.NoteItem" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="${params.bodyOnly?'body':'main'}" />
		<g:set var="entityName" value="${message(code: 'noteItem.label', default: 'NoteItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-noteItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-noteItem" class="content scaffold-list" role="main">
			<h1>Notes to sign as supervisor</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="title" title="${message(code: 'noteItem.title.label', default: 'Title')}" />
						<th><g:message code="noteItem.creator.label" default="Creator" /></th>
					
						<th><g:message code="noteItem.lastModifier.label" default="Last Modifier" /></th>
					
						<g:sortableColumn property="lastUpdate" title="${message(code: 'noteItem.lastUpdate.label', default: 'Last Update')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'noteItem.dateCreated.label', default: 'Date Created')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${noteItemInstanceList}" status="i" var="noteItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:remoteLink params="${[bodyOnly: true]}" update="body" action="show" id="${noteItemInstance.id}">${fieldValue(bean: noteItemInstance, field: "title")}</g:remoteLink></td>

						<td>${fieldValue(bean: noteItemInstance, field: "creator")}</td>
					
						<td>${fieldValue(bean: noteItemInstance, field: "lastModifier")}</td>
					
						<td><g:formatDate date="${noteItemInstance.lastUpdate}" /></td>
					
						<td><g:formatDate date="${noteItemInstance.dateCreated}" /></td>
					


					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${noteItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
