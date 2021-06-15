<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>预定日志</title>
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
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            预定日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>读者证号</th>
                <th>座位</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>签到时间</th>
                <th>状态</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allRecord}" var="alog">
                <tr>
                    <td><c:out value="${alog.reader_id}"></c:out></td>
                    <td><c:out value="${alog.seat_id}"></c:out></td>
                    <td><fmt:formatDate value="${alog.start_time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                     <td><fmt:formatDate value="${alog.end_time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                     <td><fmt:formatDate value="${alog.sign_time}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                     <c:set var="flag" value="false"/>
                     <c:set var="flag2" value="false"/>
                     <c:forEach var="exceed" items="${exceedRecord}">
                             <c:if test="${exceed.record_id eq alog.record_id}">
                                   <c:set var="flag" value="true"/>
                             </c:if>
                         </c:forEach>
                         <c:forEach var="unSign" items="${unSignedRecord}">
                             <c:if test="${unSign.record_id eq alog.record_id}">
                                 <c:set var="flag2" value="true"/>
                              </c:if>
                         </c:forEach>
                         <c:if test="${flag}">
                           <td><font style="color: red">超期</font></td>
                             </c:if>
                             <c:if test="${not flag}">
                             <c:if test="${flag2}">
                               <td><font style="color: blue">未签到</font></td>
                             </c:if>
                             </c:if>
                             <c:if test="${not flag}">
                                  <c:if test="${not flag2}">
                                        <td><font style="color: green">完成</font></td>
                                  </c:if>
                             </c:if>
                    <td>
                    <td><a href="updaterecord.html?record_id=<c:out value="${alog.record_id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                        <a href="deleterecord.html?record_id=<c:out value='${alog.record_id}'></c:out>">
                            <c:if test="${flag}">
                                <button type="button" class="btn btn-danger btn-xs">删除</button>
                            </c:if>
                            <c:if test="${empty alog.sign_time}">
                                <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>
                            </c:if>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>