<%--
  Created by IntelliJ IDEA.
  User: timy7
  Date: 11/24/2025
  Time: 8:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate>
    <h1>Add a new car</h1>
</t:pageTemplate>
<form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddCar">
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="license_plate">License Plate</label>
            <input type="text" class="form-control" id="license_plate" name="license_plate" placeholder="" value="" required>
            <div class="invalid-feedback">
                License Plate is required.
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="parking_spot">Parking Spot</label>
            <input type="text" class="form-control" id="parking_spot" name="parking_spot" placeholder="" value="" required>
            <div class="invalid-feedback">
                Parking Spot is required.
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="owner_id">Owner</label>
            <select class="form-select" name="owner_id" id="owner_id" required="">
                <option value="">Choose...</option>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <option value="${user.id}">
                        ${user.username}
                    </option>
                </c:forEach>
            </select>
            <div class="invalid-feedback">
                License Plate is required.
            </div>
        </div>
        <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
    </div>
</form>

</body>
</html>
