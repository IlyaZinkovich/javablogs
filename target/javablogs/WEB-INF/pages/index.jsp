<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp"%>
<h1>Latest new from the java world</h1>
<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <th>Date</th>
        <th>Item</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${items}">
        <tr>
            <td>
                <c:out value="${item.publishedDate}"/>
                <br />
                <c:out value="${item.blog.name}"/>
            </td>
            <td><strong><a href="<c:out value='${item.link}'/>" target="_blank">
                <c:out value='${item.title}'/>
            </a></strong>
                <br />
                    ${item.description}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>