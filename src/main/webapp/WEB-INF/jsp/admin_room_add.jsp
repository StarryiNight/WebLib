<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加阅览室</title>
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

        input{
          border: none;
          width: 10%;
          font-size: 22px;
          padding: 10px;
          margin-bottom: 32px;
          border-radius: 16px;
          background-color: transparent;

          /* 注入灵魂 */
          backdrop-filter: blur(3px);
          border-left: 2px solid rgba(255, 255, 255, .3);
          border-top: 2px solid rgba(255, 255, 255, .3);
          box-shadow: 2px 2px 2px rgba(0, 0, 0, .2);

          text-shadow: 2px 2px 2px rgba(0, 0, 0, .2);
          font-family: "Berlin Sans FB";
          color: white;
          /* 只能控制输入的文本的颜色 */
        }
        input:focus{
          border: none;
          background-color: rgba(255, 255, 255, .1);
          /* 注入灵魂 */
          text-shadow: 1px 1px 2px rgba(0, 0, 0, .2);
          border-right: 2px solid rgba(255, 255, 255, .3);
          border-bottom: 2px solid rgba(255, 255, 255, .3);
          box-shadow:inset 2px 2px 2px rgba(0, 0, 0, .2);
        }
        * {
                    padding:0;
                    margin:0;
                    outline: none;
                      /* 让输入框被选中后没有默认框框 */
                      user-select: none;
                      /* 用户不能选中文本，整体性更强 */
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
<div class="col-xs-6 col-md-offset-3" style="padding-top: 100px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">添加阅览室</h3>
        </div>
        <div class="panel-body">
            <form action="room_add_do.html" method="post" id="roomedit" >
                <div class="input-group" style="padding-top: 20px;">
                   <span  class="input-group-addon">阅览室ID</span>
                           <input  type="text" class="form-control" name="room_id" id="room_id" >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">位置</span>
                            <input  type="text" class="form-control" name="location" id="location" >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">座位数量</span>
                           <input  type="text" class="form-control" name="seat_sum" id="seat_sum" >
                </div>
                 <center>
                <input style="align-items: center" type="submit" value="添加" class="btn btn-success btn-sm"
                       class="text-left">
                 </center>
               <script>
                       $("#roomedit").submit(function () {
                       if ($("#room_id").val() == '' || $("#location").val() == '' || $("#seat_sum").val() == '' ) {
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
