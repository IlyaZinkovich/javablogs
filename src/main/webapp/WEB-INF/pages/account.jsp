<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="taglib.jsp"%>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#addBlogModal">
  Add blog
</button>

<form:form commandName="blog" cssClass="form-horizontal blogForm">
  <div class="modal fade" id="addBlogModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addBlogModalLabel">New blog</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">Name:</label>
            <div class="col-sm-10">
              <form:input path="name" cssClass="form-control"/>
              <form:errors path="name" />
            </div>
          </div>
          <div class="form-group">
            <label for="url" class="col-sm-2 control-label">Url:</label>
            <div class="col-sm-10">
              <form:input path="url" cssClass="form-control"/>
              <form:errors path="url" />
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <input type="submit" value="Save" class="btn btn-primary"/>
        </div>
      </div>
    </div>
  </div>
</form:form>

<script type="text/javascript">
  $(document).ready(function() {
    $('.nav-tabs a:first').tab('show');
    $(".triggerRemove").click(function(e) {
      e.preventDefault();
      $("#removeBlogModal .removeBtn").attr("href", $(this).attr("href"));
      $("#removeBlogModal").modal();
    });
  });
  $(".blogForm").validate(
          {
            rules: {
              name: {
                required : true,
                minlength : 1
              },
              url: {
                required : true,
                url: true
              }
            },
            highlight: function(element) {
              $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function(element) {
              $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            }
          }
  );
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
            <th>Date</th>
            <th>Item</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${blog.items}">
            <tr>
              <td><c:out value="${item.publishedDate}"/></td>
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