<%@ page import="org.openlab.notes.NoteItem" %>
<!DOCTYPE html>
<html>
	<head>
	 	<g:setProvider library="prototype"/>
		<meta name="layout" content="${params.bodyOnly?'body':'main'}" />
		<g:set var="entityName" value="${message(code: 'noteItem.label', default: 'NoteItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-noteItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:remoteLink params="${[bodyOnly: true]}" update="body" class="create" action="create"><g:message code="New note" args="[entityName]" /></g:remoteLink></li>
			</ul>
		</div>
		<div id="list-noteItem" class="content scaffold-list" role="main">
			<h1><g:message code="Note list" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="filter" class="boxShadow">
                <h2>Filter options:</h2>
                <div style="padding:15px;"/>
	                <g:formRemote update="body" name="filterList" url="[controller: 'noteItem', action:'list']">
	                    <g:hiddenField name="bodyOnly" value="${true}"/>
	                    Results per page: <g:select name="max" value="${params.max?:10}" from="${10..100}" class="range"/>
	                    <g:submitButton name="Filter"/>
	                </g:formRemote>
                </div>
            </div>
			<table>
					<tr>
				<thead>
					<th>Title</th>
					<th>State</th>
					<th>Created</th>
					<th>Creator</th>
					<th>Last modified</th>
					<th>Last modifier</th>
					<th>Supervisor</th>
					
<%--					<g:sortableColumn property="title" title="${message(code: 'noteItem.title.label', default: 'Title')}" />--%>
						
					
<%--						<g:sortableColumn property="note" title="${message(code: 'noteItem.note.label', default: 'Note')}" />--%>
					
<%--						<g:sortableColumn property="status" title="${message(code: 'noteItem.status.label', default: 'Status')}" />--%>
<%--					<g:sortableColumn property="dateCreated" title="${message(code: 'noteItem.dateCreated.label', default: 'Date Created')}" />--%>
<%--						<g:sortableColumn property="timeSpent" title="${message(code: 'noteItem.timeSpent.label', default: 'Time Spent')}" />--%>
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${noteItemInstanceList}" status="i" var="noteItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:remoteLink params="${[bodyOnly: true]}" update="body" action="show" id="${noteItemInstance.id}">${fieldValue(bean: noteItemInstance, field: "title")}</g:remoteLink></td>
					
<%--						<td>${fieldValue(bean: noteItemInstance, field: "note")}</td>--%>
					
						<td>${fieldValue(bean: noteItemInstance, field: "status")}</td>
					
<%--						<td>${fieldValue(bean: noteItemInstance, field: "timeSpent")}</td>--%>
					
						<td>${fieldValue(bean: noteItemInstance, field: "dateCreated")}</td>
						<td>${fieldValue(bean: noteItemInstance, field: "creator.userRealName")}</td>
						<td>${fieldValue(bean: noteItemInstance, field: "lastUpdate")}</td>
						<td>${fieldValue(bean: noteItemInstance, field: "lastModifier.userRealName")}</td>
						<td>${fieldValue(bean: noteItemInstance, field: "supervisor.userRealName")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
<%--			<div class="pagination">--%>
<%--				<util:remotePaginate controller="noteItem" action="list" total="${noteItemInstanceTotal}" />--%>
<%--				<g:paginate total="${noteItemInstanceTotal}" />--%>
<%--			</div>--%>
			<div class="pagination">
				<g:remotePaginate total="${noteItemInstanceTotal?:0}" params="${params}"/>
			</div>
		</div>
	</body>
</html>
