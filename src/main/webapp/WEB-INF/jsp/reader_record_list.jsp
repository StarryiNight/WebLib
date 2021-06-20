<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>预定信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
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


        @keyframes gradient {
            0%{
                background-position: 0%
            }
            100%{
                background-position: 100%;
            }
        }

    </style>
</head>
<body>
<div id="header"></div>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="recordlist.html"</script>
</c:if>

<div style="position: relative;top: 5%">
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


<div class="panel panel-default" style="position:relative;top: 80px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            预定信息
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>读者号</th>
                <th>座位</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>签到时间</th>
                 <th>状态</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${allRecord}" var="alog">
                            <tr>
                                <td><c:out value="${alog.reader_id}"></c:out></td>
                                <td><c:out value="${alog.seat_id}"></c:out></td>
                                <td><fmt:formatDate value="${alog.start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                 <td><fmt:formatDate value="${alog.end_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                 <td><fmt:formatDate value="${alog.sign_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                 <c:set var="flag" value="false"/>
                                 <c:set var="flag2" value="false"/>
                                 <c:set var="flag3" value="false"/>
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
                                     <c:forEach var="allUnSign" items="${allUnSignedTime}">
                                          <c:if test="${allUnSign.record_id eq alog.record_id}">
                                              <c:set var="flag3" value="true"/>
                                          </c:if>
                                     </c:forEach>
                                     <c:if test="${flag}">
                                       <td><font style="color: red">超期</font></td>
                                         </c:if>
                                         <c:if test="${not flag}">
                                         <c:if test="${flag2}">
                                         <c:if test="${not flag3}">
                                           <td><font style="color: blue">未签到</font></td>
                                         </c:if>
                                         </c:if>
                                         </c:if>
                                         <c:if test="${not flag}">
                                         <c:if test="${not flag2}">
                                          <c:if test="${flag3}">
                                             <td><font style="color: red">未到时</font></td>
                                          </c:if>
                                          </c:if>
                                          </c:if>
                                           <c:if test="${not flag}">
                                             <c:if test="${not flag2}">
                                           <c:if test="${not flag3}">
                                              <td><font style="color: green">完成</font></td>
                                           </c:if>
                                           </c:if>
                                           </c:if>

                                <td>
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
                                                                          <c:forEach var="allUnSign" items="${allUnSignedTime}">
                                                                              <c:if test="${allUnSign.record_id eq alog.record_id}">
                                                                                    <c:set var="flag3" value="true"/>
                                                                              </c:if>
                                                                          </c:forEach>
                                                                       <c:if test="${flag2}">
                                                                       <c:if test="${not flag}">
                                                                           <td><a href="record_sign_do.html?record_id=<c:out value="${alog.record_id}"></c:out>">
                                                                               <button type="button" class="btn btn-primary btn-xs">签到</button>
                                                                           </a></td>
                                                                       </c:if>
                                                                       </c:if>
                                                                       <c:if test="${not flag}">
                                                                                                                <c:if test="${not flag2}">
                                                                                                                 <c:if test="${flag3}">
                                                                           <td><a href="record_sign_do.html?record_id=<c:out value="${alog.record_id}"></c:out>">
                                                                               <button type="button" class="btn btn-default btn-xs">未到时</button>
                                                                           </a></td>
                                                                       </c:if>
                                                                       </c:if>
                                                                       </c:if>
                                                                       <c:if test="${not flag2}">
                                                                       <c:if test="${flag}">
                                                                               <td>
                                                                                   <button type="button" class="btn btn-default btn-xs">已超期</button>
                                                                               </td>
                                                                       </c:if>
                                                                       </c:if>
                                                                     <c:if test="${not flag2}">
                                                                         <c:if test="${not flag}">
                                                                         <c:if test="${not flag3}">
                                                                                 <td>
                                                                                     <button type="button" class="btn btn-default btn-xs">已签到</button>
                                                                                 </td>
                                                                                 </c:if>
                                                                         </c:if>
                                                                         </c:if>

                                   </tr>
                                   </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
