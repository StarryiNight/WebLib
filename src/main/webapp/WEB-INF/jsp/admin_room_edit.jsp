<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑《 ${detail.room_id}》号阅览室</title>
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
            <h3 class="panel-title">编辑《 ${detail.room_id}》号阅览室</h3>
        </div>
        <div class="panel-body">
            <form action="room_edit_do.html?room_id=${detail.room_id}" method="post" id="addsroom" >

                <div class="input-group">
                    <span  class="input-group-addon">阅览室ID</span>
                    <input type="text" class="form-control" name="room_id" id="room_id" value="${detail.room_id}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">位置</span>
                    <input type="text" class="form-control" name="location" id="location" value="${detail.location}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">座位数量</span>
                    <input type="text" class="form-control" name="seat_sum" id="seat_sum"  value="${detail.seat_sum}" >
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#addseat").submit(function () {
                        if($("#room_id").val()==''||$("#location").val()==''||$("#seat_sum").val()==''){
                            alert("请填入完整阅览室信息！");
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
