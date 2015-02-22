<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="taglib.jsp"%>
<h1>${user.name}</h1>

<script type="text/javascript">
  $(document).ready(function() {
    $('.nav-tabs a:first').tab('show');
    $(".triggerRemove").click(function(e) {
      e.preventDefault();
      $("#removeBlogModal .removeBtn").attr("href", $(this).attr("href"));
      $("#removeBlogModal").modal();
    });
  });
</script>

<br/><br/>

<div role="tabpanel">
  <ul class="nav nav-tabs" role="tablist">
    <c:forEach var="blog" items="${user.blogs}">
      <li>
        <a href="#blog_${blog.id}" data-toggle="tab"><c:out value="${blog.name}"/></a>
      </li>
    </c:forEach>
  </ul>
  <div class="tab-content">
    <c:forEach var="blog" items="${user.blogs}">
      <div role="tabpanel" class="tab-pane" id="blog_${blog.id}">
        <h1><c:out value="${blog.name}"/></h1>
        <p><c:out value="${blog.url}"/>
          <a href="<spring:url value="/blog/remove/${blog.id}.html"/>" class="btn btn-danger triggerRemove">Remove</a>
        </p>
        <table class="table table-bordered table-hover table-striped">
          <thead>
          <tr>
            <th>Title</th>
            <th>Link</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${blog.items}">
            <tr>
              <td><c:out value="${item.title}"/></td>
              <td><c:out value="${item.link}"/></td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </c:forEach>
  </div>
</div>

<div class="modal fade" id="removeBlogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="removeBlogModalLabel">Blog removal</h4>
      </div>
      <div class="modal-body">
        Do you really want to remove this blog?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>