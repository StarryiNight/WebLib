<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>阅览室${detial.room_id}</title>
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
<body>
<div id="header"></div>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="roomlist.html"</script>
</c:if>

<div style="position: relative;top: 15%">
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
<div class="panel panel-default" style="position:relative;top: 10px;width: 50%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            阅览室 ${detial.room_id}
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>座位</th>
                <th>当前是否可用</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${seats}" var="seat">
                                       <tr>
                                           <td><c:out value="${seat.seat_id}"></c:out></td>
                                           <c:set var="flag" value="false"/>
                                           <c:forEach var="used" items="${usedSeats}">
                                               <c:if test="${used.seat_id eq seat.seat_id}">
                                                   <c:set var="flag" value="true"/>
                                               </c:if>
                                           </c:forEach>
                                           <c:if test="${flag}">
                                                 <td>不可用<td>
                                           </c:if>
                                           <c:if test="${not flag}">
                                               <td>可用<td>
                                           </c:if>
                                           <td><a href="reader_moment_list.html?seat_id=<c:out value="${seat.seat_id}"></c:out>">
                                               <button type="button" class="btn btn-success btn-xs">详情</button>
                                           </a></td>

                                       </tr>
                                   </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</center>
</body>
</html>
