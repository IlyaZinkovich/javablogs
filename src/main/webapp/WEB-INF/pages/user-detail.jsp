<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>${user.name}</h1>

<c:forEach var="blog" items="${user.blogs}">
  <h1>${blog.name}</h1>
  <p>${blog.url}</p>
  <table>
    <thead>
      <tr>
        <th>Title</th>
        <th>Link</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="item" items="${blog.items}">
        <tr>
          <td>${item.title}</td>
          <td>${item.link}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</c:forEach>