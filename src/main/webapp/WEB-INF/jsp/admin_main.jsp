<%@ page contentType="text/html;charset=UTF-8"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理主页</title>

    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
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

<div style="padding: 70px 550px 10px">
    <form   method="post" action="querybook.html" class="form-inline"  id="searchform">
        <div class="input-group">
           <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord" class="form-control">
            <span class="input-group-btn">
                            <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val=$("#search").val();
            if(val==''){
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
            全部公告
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>编号</th>
                <th>题目</th>
                <th>时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${announcements}" var="announcement">
            <tr>
                <td><c:out value="${announcement.id}"></c:out></td>
                <td><c:out value="${announcement.title}"></c:out></td>
                <td><c:out value="${announcement.time}"></c:out></td>
                <td><a href="admin_announcement_detail.html?id<c:out value="${announcement.id}"></c:out>">
                    <button type="button" class="btn btn-success btn-xs">详情</button>
                </a></td>
                <td><a href="updatebook.html?bookId=<c:out value="${announcement.id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                <td><a href="deletebook.html?bookId=<c:out value="${announcement.id}"></c:out>"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
