<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="login.title"/></title>
    <meta name="menu" content="Login"/>
</head>
<body id="login">

<form method="post" id="loginForm" action="<c:url value='/j_security_check'/>"
    onsubmit="saveUsername(this);return validateForm(this)" class="form-signin" autocomplete="off">
    <h2 class="form-signin-heading">
        <fmt:message key="login.heading"/>
    </h2>
<c:if test="${param.error != null}">
    <div class="alert alert-danger alert-dismissable">
        <fmt:message key="errors.password.mismatch"/>
    </div>
</c:if>
    <input type="text" name="j_username" id="j_username" class="form-control"
           placeholder="<fmt:message key="label.username"/>" required tabindex="1">
    <input type="password" class="form-control" name="j_password" id="j_password" tabindex="2"
           placeholder="<fmt:message key="label.password"/>" required>

    <button type="submit" class="btn btn-lg btn-primary btn-block" name="login" tabindex="4">
        <fmt:message key='button.login'/>
    </button>
</form>


<c:set var="scripts" scope="request">
<%@ include file="/scripts/login.js"%>
</c:set>
</body>