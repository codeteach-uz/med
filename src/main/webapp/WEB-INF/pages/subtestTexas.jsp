<br>
<br>

<p style="text-align:center;"><b><fmt:message key="testTexas.answer1a"/></b></p>
<br/>
<table class="table" style="width: 800px">
    <tr>
        <td><fmt:message key="testTexas.answer1b"/></td>
        <td><form:radiobutton path="testTexas.answer1" value="4"/><fmt:message key="otvet.da"/></td>
        <td><form:radiobutton path="testTexas.answer1" value="0"/><fmt:message key="otvet.net"/></td>
    </tr>
    <tr>
        <td>
            <b><fmt:message key="testTexas.answer2a"/></b><br/>
            <fmt:message key="testTexas.answer2b"/>
        </td>
        <td><form:radiobutton path="testTexas.answer2" value="0"/><fmt:message key="otvet.da"/></td>
        <td><form:radiobutton path="testTexas.answer2" value="4"/><fmt:message key="otvet.net"/></td>
    </tr>

    <tr>
        <td>
            <b><fmt:message key="testTexas.answer7a"/></b><br/>
            <fmt:message key="testTexas.answer7b"/>
        </td>
        <td><form:radiobutton path="testTexas.answer7" value="4"/><fmt:message key="otvet.da"/></td>
        <td><form:radiobutton path="testTexas.answer7" value="0"/><fmt:message key="otvet.net"/></td>
    </tr>
</table>
<div class="row">
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer3"/>
        <form:select path="testTexas.answer3" cssClass="form-control" id="answer3">
            <form:option value="" label=""/>
            <form:option value="3"><fmt:message key="testTexas.answer3.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer3.2"/></form:option>
            <form:option value="1"><fmt:message key="testTexas.answer3.3"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer3.4"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer4"/>
        <form:select path="testTexas.answer4" cssClass="form-control" id="answer4">
            <form:option value="" label=""/>
            <form:option value="4"><fmt:message key="testTexas.answer4.1"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer4.2"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer4.3"/></form:option>
            <%--<form:option value="1"><fmt:message key="testTexas.answer4.4"/></form:option>--%>
            <form:option value="1"><fmt:message key="testTexas.answer4.5"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer4.6"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer5"/>
        <form:select path="testTexas.answer5" cssClass="form-control" id="answer5">
            <form:option value="" label=""/>
            <form:option value="4"><fmt:message key="testTexas.answer5.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer5.2"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer5.3"/></form:option>
        </form:select>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer6"/>
        <form:select path="testTexas.answer6" cssClass="form-control" id="answer6">
            <form:option value="1"><fmt:message key="testTexas.answer6.3"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer6.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer6.2"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer6.4"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer8"/>
        <form:select path="testTexas.answer8" cssClass="form-control" id="answer8">
            <form:option value="" label=""/>
            <form:option value="4"><fmt:message key="testTexas.answer8.1"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer8.2"/></form:option>
            <form:option value="1"><fmt:message key="testTexas.answer8.3"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer8.4"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer9"/>
        <form:select path="testTexas.answer9" cssClass="form-control" id="answer9">
            <form:option value="" label=""/>
            <form:option value="4"><fmt:message key="testTexas.answer9.1"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer9.2"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer9.3"/></form:option>
            <form:option value="0"><fmt:message key="testTexas.answer9.4"/></form:option>
            <form:option value="-4"><fmt:message key="testTexas.answer9.5"/></form:option>
            <form:option value="-2"><fmt:message key="testTexas.answer9.6"/></form:option>
            <form:option value="1"><fmt:message key="testTexas.answer9.7"/></form:option>
            <%--<form:option value="0"><fmt:message key="testTexas.answer9.8"/></form:option>--%>
        </form:select>
    </div>
</div>
<div class="row">
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer11"/>
        <form:select path="testTexas.answer11" cssClass="form-control" id="answer11">
            <form:option value="" label=""/>
            <form:option value="0"><fmt:message key="testTexas.answer11.1"/></form:option>
            <form:option value="1"><fmt:message key="testTexas.answer11.2"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer12"/>
        <form:select path="testTexas.answer12" cssClass="form-control" id="answer12">
            <form:option value="" label=""/>
            <form:option value="1"><fmt:message key="testTexas.answer12.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer12.2"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer12.3"/></form:option>
            <form:option value="4"><fmt:message key="testTexas.answer12.4"/></form:option>
        </form:select>
    </div>
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer13"/>
        <form:select path="testTexas.answer13" cssClass="form-control" id="answer13">
            <form:option value="" label=""/>
            <form:option value="1"><fmt:message key="testTexas.answer12.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer12.2"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer12.3"/></form:option>
            <form:option value="4"><fmt:message key="testTexas.answer12.4"/></form:option>
        </form:select>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <appfuse:label styleClass="control-label" key="testTexas.answer14"/>
        <form:select path="testTexas.answer14" cssClass="form-control" id="answer14">
            <form:option value="" label=""/>
            <form:option value="1"><fmt:message key="testTexas.answer12.1"/></form:option>
            <form:option value="2"><fmt:message key="testTexas.answer12.2"/></form:option>
            <form:option value="3"><fmt:message key="testTexas.answer12.3"/></form:option>
            <form:option value="4"><fmt:message key="testTexas.answer12.4"/></form:option>
        </form:select>
    </div>
</div>

