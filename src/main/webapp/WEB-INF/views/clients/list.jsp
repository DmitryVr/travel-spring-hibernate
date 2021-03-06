<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="hotelResults">

    <div class="numbertyr">
        <spring:message code="menu.tourist"/> <span class="badge">${clients.size()}</span>
    </div>

    <c:url var="clientsUrl" value="/clients"/>
    <table id="loadTable" class="table table-hover">
        <thead>
        <tr>
            <th><spring:message code="page.fullname"/></th>
            <th><spring:message code="page.phone"/></th>
            <th>E-mail</th>
            <th><spring:message code="page.added"/></th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${clients}" var="client">
            <tr id="tr_${client.idClient}" onclick="get_open(${client.idClient})" style="cursor: pointer;" >
                <td>${client.nameRu}</td>
                <td>${client.phoneMobile}</td>
                <td>${client.mail}</td>
                <td><fmt:formatDate  value="${client.regDate}" pattern="dd.MM.yyyy"/></td>
            </tr>
        </c:forEach>
        <c:if test="${empty clients}">
            <tr>
                <td colspan="5">Клиенты не найдены</td>
            </tr>
        </c:if>
        </tbody>

    </table>

    <div class="buttonGroup">
        <ul class="pager">
            <c:if test="${searchCriteria.page > 0}">
                <li><a id="prevResultsLink"  class="ajaxLinkClient"
                       href="${clientsUrl}?searchString=${searchCriteria.searchString}&pageSize=${searchCriteria.pageSize}&page=${searchCriteria.page - 1}"><< ${searchCriteria.page}</a></li>
            </c:if>
            <c:if test="${not empty clients && fn:length(clients) == searchCriteria.pageSize}">
                <li><a id="moreResultsLink" class="ajaxLinkClient"
                       href="${clientsUrl}?searchString=${searchCriteria.searchString}&pageSize=${searchCriteria.pageSize}&page=${searchCriteria.page + 1}">${searchCriteria.page +1} >> ${searchCriteria.page + 2}</a></li>
            </c:if>
        </ul>
    </div>

</div>