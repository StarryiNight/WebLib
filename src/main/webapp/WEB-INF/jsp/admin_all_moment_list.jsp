<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>时刻表</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
    <style type="text/css">
        html,body{
            height:100%;
        }
        body{
            margin: 0;
            padding: 0;
            font-family: "montserrat";
            background-image: linear-gradient(125deg,#2c3e50,#27ae60,#2980b9,#e74c3c,#8e44ad);
            background-size: 400%;
            animation: bganimation 15s infinite;
        }
        @keyframes bganimation {
            0%{
                background-position: 0% 50%;
            }
            50%{
                background-position: 100% 50%;
            }
            100%{
                background-position: 0% 50%;
            }
        }
    </style>
</head>
<body >
<div id="header"></div>

<div style="position: relative;padding-top: 100px">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>
<center >
<div class="panel panel-default" style="width: 60%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            时刻表
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>

                <th>开始时间</th>
                <th>结束时间</th>

                <th>状态</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allMoments}" var="alog">
                <tr>

                    <td><fmt:formatDate value="${alog.start_moment}" pattern=" HH:mm:ss"/></td>
                     <td><fmt:formatDate value="${alog.end_moment}" pattern=" HH:mm:ss"/></td>

                     <c:set var="flag" value="false"/>
                     <c:set var="flag2" value="false"/>
                     <c:forEach var="used" items="${usedMoments}">
                             <c:if test="${used.moment_id eq alog.moment_id}">
                                   <c:set var="flag" value="true"/>
                             </c:if>
                         </c:forEach>

                         <c:if test="${flag}">
                           <td><font style="color: red">无法预定</font></td>
                             </c:if>
                             <c:if test="${not flag}">

                               <td><font style="color: green">可以预定</font></td>

                             </c:if>

                    <td>
                    <td><a href="updatemoment.html?moment_id=<c:out value="${alog.moment_id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                        <a href="deletemoment.html?moment_id=<c:out value='${alog.moment_id}'></c:out>">

                                <td><a href="deletemoment.html?moment_id=<c:out value="${alog.moment_id}"></c:out>"><button type="button" class="btn btn-danger btn-xs">删除</button></td>

                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</center>
</body>
</html>