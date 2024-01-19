<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="home.title"/></title>
    <meta name="menu" content="Home"/>
</head>
<body class="home">

<h2><fmt:message key="home.heading"/></h2>
<%--<p><fmt:message key="home.message"/></p>--%>
<img src="/images/healthcare.png" style="align-content: center; text-align: center"/>
<ul class="glassList">
    <li>
        <a href="<c:url value='/personcards'/>"><fmt:message key="personCard.title"/></a>
    </li>
    <%--<li>
        <a href="<c:url value='/fileupload'/>"><fmt:message key="menu.selectFile"/></a>
    </li>--%>
</ul>
</body>
