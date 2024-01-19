<%@ include file="/common/taglibs.jsp" %>

<head>
  <title><fmt:message key="personCard.title"/></title>
  <meta name="menu" content="PersonCardMenu"/>
</head>

<c:if test="${not empty searchError}">
  <div class="alert alert-danger alert-dismissable">
    <a href="#" data-dismiss="alert" class="close">&times;</a>
    <c:out value="${searchError}"/>
  </div>
</c:if>

<div class="col-sm-10">
  <h2><fmt:message key="personCard.subtitle"/></h2>

  <form method="get" action="${ctx}/personcards" id="searchForm" class="form-inline">
    <div id="search" class="text-right">
        <span class="col-sm-9">
            <input type="text" size="20" name="q" id="query" value="${param.q}"
                   placeholder="<fmt:message key="search.enterTerms"/>" class="form-control input-sm">
        </span>
      <button id="button.search" class="btn btn-default btn-sm" type="submit">
        <i class="icon-search"></i> <fmt:message key="button.search"/>
      </button>
    </div>
  </form>

  <div id="actions" class="btn-group">
    <a class="btn btn-primary" href="<c:url value='/personcardform?method=Add&from=list'/>">
      <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/></a>

   <%-- <a class="btn btn-default" href="<c:url value='/home'/>">
      <i class="icon-ok"></i> <fmt:message key="button.cancel"/></a>--%>
  </div>

  <display:table name="personCardList" cellspacing="0" cellpadding="0" requestURI=""
                 id="personCards" pagesize="25" class="table table-condensed table-striped table-hover">
    <display:column property="nAmbCard" escapeXml="true" titleKey="personCard.nAmbCard"
                    style="width: 25%"/>
    <display:column property="fullName" escapeXml="true" titleKey="personCard.fullName" style="width: 45%"
                    url="/personcardform?from=list" paramId="id" paramProperty="id"/>
    <display:column property="age" titleKey="personCard.age" style="width: 15%"/>
    <display:column property="label" titleKey="personCard.label"  style="width: 15%"/>

    <display:setProperty name="paging.banner.item_name"><fmt:message key="userList.user"/></display:setProperty>
    <display:setProperty name="paging.banner.items_name"><fmt:message key="userList.users"/></display:setProperty>

    <display:setProperty name="basic.msg.empty_list" value=""/>
    <display:setProperty name="paging.banner.no_items_found" value=""/>
    <display:setProperty name="paging.banner.no_items_found" value=""/>
    <display:setProperty name="paging.banner.one_item_found" value=""/>
    <display:setProperty name="paging.banner.all_items_found" value=""/>
  </display:table>
</div>
