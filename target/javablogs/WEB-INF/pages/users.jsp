<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="taglib.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
    $(".triggerRemove").click(function(e) {
      e.preventDefault();
      $("#removeUserModal .removeBtn").attr("href", $(this).attr("href"));
      $("#removeUserModal").modal();
    });
  });
</script>

<table class="table table-bordered table-hover table-striped">
  <thead>
    <tr>
      <th>User name:</th>
      <th>Operations:</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${users}" var="user">
      <tr>
        <td>
          <a href="<spring:url value="/users/${user.id}.html" />">
            <c:out value="${user.name}"/>
          </a>
        </td>
        <td>
          <c:if test="${not user.name.equals('admin')}">
          <a href="<spring:url value="/users/remove/${user.id}.html" />" class="btn btn-danger triggerRemove">
              Remove
          </a>
          </c:if>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<div class="modal fade" id="removeUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="removeUserModalLabel">Blog removal</h4>
      </div>
      <div class="modal-body">
        Do you really want to remove this user?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>