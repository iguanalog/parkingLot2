<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Users">
  <h1>Users of the application</h1>

  <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
    <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary btn-lg">Create user</a>
  </c:if>

  <form method="POST" action="${pageContext.request.contextPath}/Users">
    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
      <button class="btn btn-danger" type="submit">Delete Users</button>
    </c:if>

    <div class="container text-center mt-3">
      <c:forEach var="user" items="${users}">
        <div class="row mb-2 align-items-center">
          <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
            <div class="col-auto">
              <input type="checkbox" name="user_ids" value="${user.id}" aria-label="Select user ${user.username}" />
            </div>
          </c:if>

          <div class="col">
            ${user.username}
          </div>
          <div class="col">
            ${user.email}
          </div>
        </div>
      </c:forEach>
    </div>
  </form>
</t:pageTemplate>