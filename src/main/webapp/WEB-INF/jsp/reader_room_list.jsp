<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
<body >

<div id="header"></div>

<div style="padding: 20px 550px 10px">
    <form method="post" action="reader_querybook_do.html" class="form-inline" id="searchform">
        <div class="input-group">
            <input type="text" placeholder="输入阅览室ID" class="form-control" id="search" name="searchWord"
                   class="form-control">
            <span class="input-group-btn">
                <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>
<div style="position: relative;top: 10%">
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
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部阅览室
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>阅览室ID</th>
                <th>位置</th>
                <th>座位数量</th>
                <th>可用座位数量</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${rooms}" var="room">
                <tr>
                    <td><c:out value="${room.room_id}"></c:out></td>
                    <td><c:out value="${room.location}"></c:out></td>
                    <td><c:out value="${room.seat_sum}"></c:out></td>
                    <td><c:out value="${room.seat_available}"></c:out></td>
                    <td><a href="reader_room_seats.html?room_id=<c:out value="${room.room_id}"></c:out>">
                        <button type="button" class="btn btn-success btn-xs">详情</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
