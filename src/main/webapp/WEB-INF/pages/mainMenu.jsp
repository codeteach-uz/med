<%@ include file="/common/taglibs.jsp" %>

<head>
    <style type="text/css">
        .nav>li>a:hover {
            text-decoration: none;
            background-color: #3bacd1;
        }


        .btn-large {
            font-size: 22.5px;
        }

        .panelL {
            width:100%;

        }

        .panelL img {
            width:	100%;
            height: 165px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow:0 0 5px rgba(0, 0, 0, .35);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.075);
            box-shadow: 0 0 5px rgba(0, 0, 0, .35);
        }

        .center-block {
            display: block;
            margin-right: auto;
            margin-left: auto;
        }
    </style>

</head>
<header>
    <div class="panelL">
        <img src="<c:url value="/images/zzz.png"/> "/>
    </div>
</header>

<div class="row">
    <div class="span4" style="padding: 40px"></div>
    <div class="span4">
        <div class="well center-block" style="max-width:450px">
            <ul class="nav nav-list">

                <li style="padding: 5px">
                    <a class="btn btn-large btn-primary active" href="<c:url value='/personcards'/>">
                        <i class="icon-white icon-pencil"></i>
                        <fmt:message key='personCard.subtitle'/>
                    </a>
                </li>
                <li style="padding: 5px">
                    <a class="btn btn-large btn-primary active" href="<c:url value='personcardform?method=Add&from=list'/>">
                        <i class="icon-white icon-edit"></i>
                        Добавить ПК
                    </a>
                </li>

                <li style="padding: 5px">
                    <a class="btn btn-large btn-primary active" href="<c:url value='/personcards'/>">
                        <i class="icon-white icon-pencil"></i>
                        <fmt:message key='anketa.view'/>
                    </a>
                </li>

                <li style="padding: 5px">
                    <a class="btn btn-large btn-primary active" href="<c:url value='/logout'/>">
                        <i class="icon-white icon-off"></i>
                        <fmt:message key='user.logout'/>
                    </a>
                </li>

            </ul>
        </div>
    </div>
    <div class="span4"></div>
</div>















