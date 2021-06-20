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
            $('#header').load('reader_header.html');
        })

             var name = window.location.search;
             var newName = name.slice(1,11)
    </script>
    <style type="text/css">
        html,body{
            height:100%;
        }
         body {
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(45deg, #f17C58, #e94584, #24AADB, #27DBB1, #FFDC18, #FF3706);
                    background-size: 600% 100%;
                    animation: gradient 16s linear infinite;
                    animation-direction: alternate;
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
    <script>
    var name = window.location.search;
    var newName = name.slice(1,13)
    </script>
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

<center>
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
                        <c:forEach var="exceed" items="${exceedMoment}">
                             <c:if test="${exceed.moment_id eq alog.moment_id}">
                                   <c:set var="flag2" value="true"/>
                             </c:if>
                         </c:forEach>
                         <c:if test="${flag2}">
                           <td><font style="color: red">已经过时</font></td>
                         </c:if>

                             <c:if test="${not flag2}">
                             <c:if test="${flag}">
                               <td><font style="color: red">无法预定</font></td>
                             </c:if>
                             </c:if>

                             <c:if test="${not flag2}">
                             <c:if test="${not flag}">
                                  <td><font style="color: green">可以预定</font></td>
                             </c:if>
                             </c:if>
                      <td>

                         <c:if test="${not flag2}">
                         <c:if test="${not flag}">
                            <td><a href="record_add_do.html?moment_id=<c:out value="${alog.moment_id}"></c:out>"><button type="button" class="btn btn-primary btn-xs">预定</button></a></td>
                             <script>

                                                var a = document.getElementsByTagName('a')[0];
                                                var url = a.getAttribute('href');

                                                url = url + '&&' + newName;
                                                a.setAttribute('href', url);

                                            </script>
                         </c:if>
                         </c:if>
                         <c:if test="${flag2}">
                             <td><button type="button" class="btn btn-default btn-xs" disabled="disabled">预定</button></td>
                         </c:if>
                         <c:if test="${not flag2}">
                         <c:if test="${flag}">
                             <td><button type="button" class="btn btn-default btn-xs" disabled="disabled">预定</button></td>
                         </c:if>
                         </c:if>

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