<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="currentPage" value="${pageContext.request.servletPath}" />

<header data-bs-theme="dark">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}">
                Parking Lot
            </a>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">

                    <li class="nav-item">
                        <a class="nav-link ${currentPage == '/about.jsp' ? 'active' : ''}"
                           href="${pageContext.request.contextPath}/about.jsp">
                            About
                        </a>
                    </li>

                    <li class="nav-item">
                        <c:if test="${pageContext.request.isUserInRole('READ_CARS')}">
                            <a class="nav-link ${currentPage == '/cars.jsp' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/Cars">
                                Cars
                            </a>
                        </c:if>
                    </li>

                    <li class="nav-item">
                        <c:if test="${pageContext.request.isUserInRole('READ_USERS')}">
                            <a class="nav-link ${currentPage == '/users.jsp' ? 'active' : ''}"
                               href="${pageContext.request.contextPath}/Users">
                                Users
                            </a>
                        </c:if>
                    </li>

                </ul>

                <ul class="navbar-nav">
                    <c:choose>
                        <c:when test="${pageContext.request.remoteUser == null}">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</header>
