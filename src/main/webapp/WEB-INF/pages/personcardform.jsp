<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="personCard.title"/></title>
    <meta name="menu" content="PersonCardMenu"/>
    <style type="text/css">

    </style>
</head>
<div style="min-width: 1000px;">

    <div class="col-sm-10">
        <h3><fmt:message key="personCard.title"/></h3>
        <spring:bind path="personCard.*">
            <c:if test="${not empty status.errorMessages}">
                <div class="alert alert-danger alert-dismissable">
                    <a href="#" data-dismiss="alert" class="close">&times;</a>
                    <c:forEach var="error" items="${status.errorMessages}">
                        <c:out value="${error}" escapeXml="false"/><br/>
                    </c:forEach>
                </div>
            </c:if>
        </spring:bind>

        <form:form commandName="personCard" method="post" action="personcardform" id="personCardForm" autocomplete="off"
                   cssClass="well" onsubmit="return validatePersonCard(this)">

            <div class="form-group">
                <button type="submit" class="btn btn-primary saveBtn" name="save" onclick="bCancel=false">
                    <i class="icon-ok icon-white"></i> <fmt:message key="button.save"/>
                </button>

                <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
                    <i class="icon-remove"></i> <fmt:message key="button.back"/>
                </button>
                <c:if test="${personCard.healthIndex!=null && personCard.healthIndex>10}">
                    <a class="btn btn-primary"
                       href="<c:url value='/anketa'><c:param name="id" value="${personCard.id}"/></c:url>">
                        <i class="icon-plus icon-white"></i> <fmt:message key="anketa.view"/>
                    </a>
                </c:if>
            </div>

            <c:if test="${personCard.healthIndex>10}">
                <div class="row">
                    <div class="col-sm-6">
                        <p style="font-size: 50px; color: green"><fmt:message key="healthIndex"/></p>
                    </div>
                    <div class="col-sm-2">
                        <div class="prg-cont rad-prg" id="indicatorContainer"></div>
                    </div>
                </div>
            </c:if>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.nAmbCard"/>
                    <form:input cssClass="form-control" path="nAmbCard"/>
                    <form:errors path="nAmbCard" cssClass="help-block"/>
                </div>
                <div class="col-sm-4">
                    <form:hidden id="healthIndex" path="healthIndex"/>
                    <form:hidden path="id"/>
                    <input type="hidden" name="from" value="<c:out value="${param.from}"/>"/>
                    <appfuse:label styleClass="control-label" key="personCard.fullName"/>
                    <form:input path="fullName" cssClass="form-control"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.dateOfFill"/>
                    <form:input path="dateOfFill" cssClass="form-control datepicker" id="dateOfFill"
                                autocomplete="false"/>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.dateOfBirth"/>
                    <form:input path="dateOfBirth" cssClass="form-control datepicker" id="dateOfBirth"
                                autocomplete="false"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.age"/>
                    <form:input path="age" cssClass="form-control" id="age" readonly="true"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.region"/>
                    <form:select path="region" cssClass="form-control" id="region">
                        <form:option value="" label=""/>
                        <form:options items="${regionList}" itemValue="id" itemLabel="name"/>
                    </form:select>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.height"/>
                    <form:input cssClass="form-control" path="height"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.massBody"/>
                    <form:input cssClass="form-control" path="massBody"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.bmi"/>
                    <form:input cssClass="form-control" path="bmi" id="bmi" readonly="true"/>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.sad"/>
                    <form:input cssClass="form-control" path="sad" id="sad"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.dad"/>
                    <form:input cssClass="form-control" path="dad" id="dad"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.pulse"/>
                    <form:input cssClass="form-control" path="pulse" id="pulse"/>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.adp"/>
                    <form:input cssClass="form-control" path="adp" id="adp" readonly="true"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.ads"/>
                    <form:input cssClass="form-control" path="ads" id="ads" readonly="true"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.waistCircum"/>
                    <form:input cssClass="form-control" path="waistCircum" id="waistCircum"/>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.hipCircum"/>
                    <form:input cssClass="form-control" path="hipCircum" id="hipCircum"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.waistHip"/>
                    <form:input cssClass="form-control" path="waistHip" id="waistHip" readonly="true"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.zdv"/>
                    <form:input cssClass="form-control" path="zdv" id="zdv"/>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.staticBalance"/>
                    <form:input cssClass="form-control" path="staticBalance" id="staticBalance"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="personCard.sex"/>
                    <form:select path="sex" cssClass="form-control" id="sex">
                        <form:option value="" label=""/>
                        <form:option value="1"><fmt:message key="mujik"/></form:option>
                        <form:option value="2"><fmt:message key="jenshina"/></form:option>
                    </form:select>
                </div>
            </div>
            <br/>

            <h3><fmt:message key="blood.title"/></h3>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.hgb"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.hgb" id="hgb"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.rbc"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.rbc" id="rbc"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.wbc"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.wbc" id="wbc"/>
                </div>

            </div>
            <br/>

            <div class="row">
                <div class="col-sm-3">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.soe"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.soe" id="soe"/>
                </div>
                <div class="col-sm-3">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.pti"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.pti" id="pti"/>
                </div>
                <div class="col-sm-3">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.xolesterin"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.xolesterin" id="xolesterin"/>
                </div>
                <div class="col-sm-3">
                    <appfuse:label styleClass="control-label" key="bloodAnalyze.saxar"/>
                    <form:input cssClass="form-control" path="bloodAnalyze.saxar" id="saxar"/>
                </div>
            </div>
            <br>

            <h3><fmt:message key="mochi.title"/></h3>

            <div class="row">
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="urinalisis.udves"/>
                    <form:input cssClass="form-control" path="urinalisis.udves" id="urinalisis.udves"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="urinalisis.leyk"/>
                    <form:input cssClass="form-control" path="urinalisis.leyk" id="urinalisis.leyk"/>
                </div>
                <div class="col-sm-4">
                    <appfuse:label styleClass="control-label" key="urinalisis.erit"/>
                    <form:input cssClass="form-control" path="urinalisis.erit" id="urinalisis.erit"/>
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-3">
                    <b><fmt:message key="urinalisis.belok"/>&nbsp;</b>
                    <label class="radio-inline">
                        <form:radiobutton path="urinalisis.belok" value="1"/><fmt:message key="otvet.da"/>
                    </label>
                    <label class="radio-inline">
                        <form:radiobutton path="urinalisis.belok" value="0"/><fmt:message key="otvet.net"/>
                    </label>
                </div>
                <div class="col-sm-3">
                    <b><fmt:message key="urinalisis.saxar"/>&nbsp;</b>
                    <label class="radio-inline">
                        <form:radiobutton path="urinalisis.saxar" value="1"/><fmt:message key="otvet.da"/>
                    </label>
                    <label class="radio-inline">
                        <form:radiobutton path="urinalisis.saxar" value="0"/><fmt:message key="otvet.net"/>
                    </label>
                </div>

                <div class="col-sm-6">
                    <b><fmt:message key="personCard.label"/>&nbsp;</b>
                    <label class="radio-inline">
                        <form:radiobutton path="label" value="1"/><fmt:message key="result.bolnoy"/>
                    </label>
                    <label class="radio-inline">
                        <form:radiobutton path="label" value="2"/><fmt:message key="result.zdaroviy"/>
                    </label>
                    <label class="radio-inline">
                        <form:radiobutton path="label" value="3"/><fmt:message key="result.tretiy"/>
                    </label>
                </div>
            </div>


            <div class="row">
                <%@ include file="/WEB-INF/pages/subtestTexas.jsp" %>

                <div class="col-sm-6 has-success">
                    <appfuse:label styleClass="control-label" key="testTexas.total"/>
                    <form:input path="testTexas.total" id="total" cssClass="form-control" readonly="true"/>
                </div>
                <br/>

                <%@ include file="/WEB-INF/pages/subtableTest.jsp" %>
                <br/>

                <div class="col-sm-6 has-success">
                    <appfuse:label styleClass="control-label" key="testTexas.biologicAge"/>
                    <form:input path="testTexas.biologicAge" id="biologicAge" cssClass="form-control" readonly="true"/>
                </div>

                <div class="col-sm-6 has-success">
                    <appfuse:label styleClass="control-label" key="testTexas.dbv"/>
                    <form:input path="testTexas.dbv" id="dbv" cssClass="form-control" readonly="true"/>
                </div>

                <br/>
                <br/>
                <%@ include file="/WEB-INF/pages/subtestPsix.jsp" %>
            </div>

            <br/>

            <div class="form-group">
                <button type="submit" class="btn btn-primary saveBtn" name="save" onclick="bCancel=false">
                    <i class="icon-ok icon-white"></i> <fmt:message key="button.save"/>
                </button>

                <c:if test="${param.from == 'list' and param.method != 'Add'}">
                    <button type="submit" class="btn btn-default" name="delete"
                            onclick="bCancel=true;return confirmMessage(msgDelConfirm)">
                        <i class="icon-trash"></i> <fmt:message key="button.delete"/>
                    </button>
                </c:if>

                <button type="submit" class="btn btn-default" name="cancel" onclick="bCancel=true">
                    <i class="icon-remove"></i> <fmt:message key="button.cancel"/>
                </button>
            </div>
        </form:form>
    </div>
</div>

<script src="<c:url value='/scripts/jquery-1.9.1.min.js'/>"></script>
<script src="<c:url value='/scripts/bootstrap-datepicker.js'/>"></script>
<script src="<c:url value='/scripts/js/jquery.inputmask.js'/>"></script>
<script src="<c:url value='/scripts/js/jquery.inputmask.numeric.extensions.js'/>"></script>
<script src="<c:url value='/scripts/js/jquery.inputmask.custom.extensions.js'/>"></script>
<script src="<c:url value='/scripts/js/jquery.inputmask.date.extensions.js'/>"></script>
<script src="<c:url value='/scripts/js/jquery.inputmask.extensions.js'/>"></script>
<script src="<c:url value='/scripts/radialindicator.js'/>"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('.saveBtn').click(function () {
            var label = $('input:radio[name=label]:checked').val();
            if (label==null || label==''){
                alert("Iltimos, Klasni belgilang!!!");
                return false;
            }
        });

        var healthIndex = $("#healthIndex").val();

        $('#indicatorContainer').radialIndicator({
            barColor: {
                0: '#FF0000',
                33: '#FFFF00',
                66: '#0066FF',
                100: '#33CC33'
            },
            initValue: healthIndex,
            percentage: true
        });

        $('input').keydown(function (e) {
            var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
            if (key == 13) {
                e.preventDefault();
                var inputs = $(this).closest('form').find(':input:visible');
                inputs.eq(inputs.index(this) + 1).focus();
            }
        });

        $('.datepicker').datepicker({
            format: "dd.mm.yyyy",
            autoclose: true
        });

        $(".datepicker").inputmask("d.m.y", {"placeholder": "__.__.____"});

        $('#dateOfBirth').blur(function () {
            var today = new Date();
            var dd = Number(today.getDate());
            var mm = Number(today.getMonth() + 1);
            var yyyy = Number(today.getFullYear());
            var myBD = $('#dateOfBirth').val();
            var myBDM = Number(myBD.split(".")[1]);
            var myBDD = Number(myBD.split(".")[0]);
            var myBDY = Number(myBD.split(".")[2]);
            var age = yyyy - myBDY;
            if (mm < myBDM) {
                age = age - 1;
            }
            else if (mm == myBDM && dd < myBDD) {
                age = age - 1;
            }


            $('#age').val(age);
        });

        $('#massBody').blur(function () {
            var massBody = $('#massBody').val();
            var height = $('#height').val();
            if (massBody == '' || height == '') {
                alert('vvedite massa ili rost');
                return false;
            }
            massBody = parseFloat(massBody);
            height = parseFloat(height);
            var bmi = massBody / (height / 100 * height / 100);
            if (!isNaN(bmi)) {
                $('#bmi').val(Math.round(bmi));
            }
            var vves = massBody - height + 100;
            var vval;
            if (vves >= 9) {
                vval = 3;
            } else if (vves >= 4.5 && vves < 9) {
                vval = 2;
            } else if (vves >= 2.3 && vves < 4.5) {
                vval = 1;
            } else {
                vval = 0;
            }
            if (!isNaN(vval)) {
                $('#answer3').val(vval);
            }

        });

        $('#dad').blur(function () {
            var dad = $('#dad').val();
            var sad = $('#sad').val();
            if (dad == '' || sad == '') {
                alert('vvedite DAD ili SAD');
                return false;
            }
            dad = parseFloat(dad);
            sad = parseFloat(sad);
            $('#adp').val(sad - dad);
            $('#ads').val((sad + dad) / 2);

            var ans5 = null;
            if (sad > 160) {
                ans5 = 4;
            } else if (sad >= 140 && sad <= 160) {
                ans5 = 2;
            } else if (sad < 140) {
                ans5 = 0;
            }
            if (ans5 != null) {
                $('#answer5').val(ans5);
            }

        });

        $('#sex').change(function () {
            var sexSelected = $("#sex option:selected").val();
            var age = $('#age').val();
            var vvoz = 0;
            if (sexSelected != '') {
                if (sexSelected == 1) {
                    if (age >= 60) {
                        vvoz = 4;
                    } else if (age < 60 && age >= 45) {
                        vvoz = 3;
                    } else if (age < 45 && age >= 30) {
                        vvoz = 2;
                    }
                } else if (sexSelected == 2) {
                    if (age >= 60) {
                        vvoz = 3;
                    } else if (age < 60 && age >= 45) {
                        vvoz = 2;
                    } else if (age < 45 && age >= 30) {
                        vvoz = 1;
                    }
                }
                $('#answer9').val(vvoz);
            }

        });

        $('#hipCircum').blur(function () {
            var waistCircum = $('#waistCircum').val();
            var hipCircum = $('#hipCircum').val();
            if (waistCircum == '' || hipCircum == '') {
                alert('vvedite Okrujnost Talii ili Beder');
                return false;
            }
            waistCircum = parseFloat(waistCircum);
            hipCircum = parseFloat(hipCircum);
            var hw = Math.round(100 * waistCircum / hipCircum) / 100;
            if (!isNaN(hw)) {
                $('#waistHip').val(hw);
            }

        });


        $('#xolesterin').blur(function () {
            var xoles = $('#xolesterin').val();
            var temp = null;
            if (xoles == '') {
                alert('vvedite Xolesterin');
                return false;
            }
            if (xoles > 6.2) {
                temp = 3;
            } else if (xoles <= 6.2 && xoles >= 5.2) {
                temp = 2;
            } else if (xoles < 5.2) {
                temp = 0;
            }

            if (temp != null) {
                $('#answer6').val(temp);
            }

        });


    });

</script>
<c:set var="scripts" scope="request">
    <script type="text/javascript">
        // This is here so we can exclude the selectAll call when roles is hidden
        function onFormSubmit(theForm) {
            return validatePersonCard(theForm);
        }
    </script>
</c:set>

<v:javascript formName="personCard" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value="/scripts/validator.jsp"/>"></script>

