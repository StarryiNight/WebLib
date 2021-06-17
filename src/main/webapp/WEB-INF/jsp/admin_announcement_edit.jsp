<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑 ${detail.id}</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
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

<div id="header" style="padding-bottom: 80px"></div>

<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑 ${detail.id}</h3>
        </div>
        <div class="panel-body">
            <form action="announcement_edit_do.html?announcementId=${detail.id}" method="post" id="editannouncement" >

                <div class="input-group">
                    <span  class="input-group-addon">标识码</span>
                    <input type="text" class="form-control" name="id" id="ide" value="${detail.id}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">标题</span>
                    <input type="text" class="form-control" name="title" id="title" value="${detail.title}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">内容</span>
                    <input type="text" class="form-control" name="article" id="article"  value="${detail.article}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">时间</span>
                    <input type="text" class="form-control" name="time" id="time"  value="${detail.time}" >
                </div>

                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#editannouncement").submit(function () {
                        if($("#id").val()==''||$("#title").val()==''||$("#article").val()==''||$("#time").val()==''){
                            alert("请填入完整公告信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
