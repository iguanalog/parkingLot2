<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate>
    <h1>Create a new user</h1>
</t:pageTemplate>
<form class="needs-validation" novalidate method="POST"
      action="${pageContext.request.contextPath}/AddUser">

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="username">Username</label>
            <input type="text"
                   class="form-control"
                   id="username"
                   name="username"
                   placeholder=""
                   value=""
                   required>
            <div class="invalid-feedback">
                Username is required.
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="email">Email</label>
            <input type="email"
                   class="form-control"
                   id="email"
                   name="email"
                   placeholder=""
                   value=""
                   required>
            <div class="invalid-feedback">
                Email is required.
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="password">Password</label>
            <input type="password"
                   class="form-control"
                   id="password"
                   name="password"
                   placeholder=""
                   value=""
                   required>
            <div class="invalid-feedback">
                Password is required.
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="user_groups">Groups</label>
            <div id="user_groups">
                <c:forEach var="user_group" items="${userGroups}" varStatus="status">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox"
                               id="user_group_${status.index}"
                               name="user_groups" value="${user_group}" />
                        <label class="form-check-label" for="user_group_${status.index}">
                            ${user_group}
                        </label>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <hr class="mb-4">

    <button class="btn btn-primary btn-lg btn-block"
            type="submit">
        Save
    </button>
</form>



