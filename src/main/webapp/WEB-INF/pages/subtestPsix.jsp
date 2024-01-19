<h4><fmt:message key="psix.title"/></h4>
<table class="table" style="width: 800px">
  <thead>
  <tr>
    <th style="width: 30px;"><fmt:message key="Nsymbol"/></th>
    <th style="width: 530px;"><fmt:message key="utverjdeniya"/></th>
    <th style="width: 60px;"><fmt:message key="da.soglasen"/></th>
    <th style="width: 60px;"><fmt:message key="skoree.soglasen"/></th>
    <th style="width: 60px;"><fmt:message key="skoree.nesoglasen"/></th>
    <th style="width: 60px;"><fmt:message key="net.nesoglasen"/></th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>1</td>
    <td><fmt:message key="testPsix.ques1"/></td>
    <td><form:radiobutton path="testPsix.ques1" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques1" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques1" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques1" value="4"/>4</td>
  </tr>

  <tr>
    <td>2</td>
    <td><fmt:message key="testPsix.ques2"/></td>
    <td><form:radiobutton path="testPsix.ques2" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques2" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques2" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques2" value="4"/>4</td>
  </tr>

  <tr>
    <td>3</td>
    <td><fmt:message key="testPsix.ques3"/></td>
    <td><form:radiobutton path="testPsix.ques3" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques3" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques3" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques3" value="4"/>4</td>
  </tr>

  <tr>
    <td>4</td>
    <td><fmt:message key="testPsix.ques4"/></td>
    <td><form:radiobutton path="testPsix.ques4" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques4" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques4" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques4" value="4"/>4</td>
  </tr>

  <tr>
    <td>5</td>
    <td><fmt:message key="testPsix.ques5"/></td>
    <td><form:radiobutton path="testPsix.ques5" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques5" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques5" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques5" value="4"/>4</td>
  </tr>

  <tr>
    <td>6</td>
    <td><fmt:message key="testPsix.ques6"/></td>
    <td><form:radiobutton path="testPsix.ques6" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques6" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques6" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques6" value="4"/>4</td>
  </tr>

  <tr>
    <td>7</td>
    <td><fmt:message key="testPsix.ques7"/></td>
    <td><form:radiobutton path="testPsix.ques7" value="1"/>1</td>
    <td><form:radiobutton path="testPsix.ques7" value="2"/>2</td>
    <td><form:radiobutton path="testPsix.ques7" value="3"/>3</td>
    <td><form:radiobutton path="testPsix.ques7" value="4"/>4</td>
  </tr>
  </tbody>
</table>
<br/>
<div class="row">
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.averg"/>
    <form:input path="testPsix.averg" id="testPsix.averg" cssClass="form-control" readonly="true"/>
  </div>
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.urovenStress"/>
    <form:select path="testPsix.urovenStress" cssClass="form-control" id="urovenStress" readonly="true">
      <form:option value="" label=""/>
      <form:option value="1"><fmt:message key="testPsix.urovenStress.1"/></form:option>
      <form:option value="2"><fmt:message key="testPsix.urovenStress.2"/></form:option>
      <form:option value="3"><fmt:message key="testPsix.urovenStress.3"/></form:option>
    </form:select>
  </div>
</div>

<h4><fmt:message key="psix.usus"/></h4>
<div class="row">
  <div class="col-sm-4">
    <appfuse:label styleClass="control-label" key="testPsix.fizCase"/>
    <form:input cssClass="form-control" path="testPsix.fizCase" />
  </div>
  <div class="col-sm-4">
    <appfuse:label styleClass="control-label" key="testPsix.psixCase"/>
    <form:input path="testPsix.psixCase" cssClass="form-control" />
  </div>
  <div class="col-sm-4">
    <appfuse:label styleClass="control-label" key="testPsix.socialCase"/>
    <form:input path="testPsix.socialCase" cssClass="form-control" />
  </div>
</div>
<br/>
<div class="row">
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.ifs"/>
    <form:input path="testPsix.ifs" id="ifs" cssClass="form-control" readonly="true"/>
  </div>
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.ufs"/>
    <form:select path="testPsix.ufs" cssClass="form-control" id="ufs" readonly="true">
      <form:option value="" label=""/>
      <form:option value="1"><fmt:message key="testPsix.ufs.1"/></form:option>
      <form:option value="2"><fmt:message key="testPsix.ufs.2"/></form:option>
      <form:option value="3"><fmt:message key="testPsix.ufs.3"/></form:option>
      <form:option value="4"><fmt:message key="testPsix.ufs.4"/></form:option>
      <form:option value="5"><fmt:message key="testPsix.ufs.5"/></form:option>
      <form:option value="6"><fmt:message key="testPsix.ufs.6"/></form:option>
    </form:select>
  </div>
</div>
<br/>
<h4><fmt:message key="psix.aptitle"/></h4>
<div class="row">
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.ap"/>
    <form:input path="testPsix.ap" id="ap" cssClass="form-control" readonly="true"/>
  </div>
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="testPsix.apType"/>
    <form:select path="testPsix.apType" cssClass="form-control" id="apType" readonly="true">
      <form:option value="" label=""/>
      <form:option value="1"><fmt:message key="testPsix.apType.1"/></form:option>
      <form:option value="2"><fmt:message key="testPsix.apType.2"/></form:option>
      <form:option value="3"><fmt:message key="testPsix.apType.3"/></form:option>
      <form:option value="4"><fmt:message key="testPsix.apType.4"/></form:option>
    </form:select>
  </div>
  <div class="col-sm-4 has-success">
    <appfuse:label styleClass="control-label" key="personCard.score"/>
    <form:input path="score" id="score" cssClass="form-control"/>
  </div>
</div>
