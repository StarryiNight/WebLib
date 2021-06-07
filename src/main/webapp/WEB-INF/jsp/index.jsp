<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书馆登录界面</title>
    <style>
    *{
  outline: none;
  /* 让输入框被选中后没有默认框框 */
  user-select: none;
  /* 用户不能选中文本，整体性更强 */
}

body{
  margin: 0;
  padding: 0;
  /* 让页面外围没有一圈内边距 */

  background: url(lib/wallpaper.png);
  /* 尽量使用相对位置或图床链接 */
  background-size: cover;
  background-attachment: fixed;
}

form{
  background-color: rgba(255, 255, 255, .3);
  width: 400px;
  height: 400px;
  border-radius: 30px;

  /* 一种水平+垂直的居中定位方式 */
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  /* 这个比上次人工队计算宽高一半要好 */

  /* 注入灵魂 */
  backdrop-filter: blur(3px);
  border-left: 2px solid rgba(255, 255, 255, .3);
  border-top: 2px solid rgba(255, 255, 255, .3);
  box-shadow: 2px 2px 10px rgba(0, 0, 0, .2);
  text-align: center;

}

h1{
  margin: 20px;

  font-weight: 400;
  /* 毛玻璃的话，标题比扁平 字重小一点为好 */
  font-size: 88px;
  font-family: "Berlin Sans FB";
}
.tt{
  color: white;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, .2);
  opacity: 0.9;
}

input{
  border: none;
  width: 80%;
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
/* 而placeholder要单独设置属性 */
::placeholder{
  color: white;
  opacity: 0.8;
}

.btn{
  width: 240px;
  font-size: 34px;
  font-weight: bold;
  margin-top: 10px;
  cursor: pointer;
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

    </style>
</head>
<body>
<form action="">
<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h1 class="panel-title">图书馆</h1>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">账号</label>
            <input type="text" class="form-control" id="id" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <div class="checkbox text-left">
            <label>
                <input type="checkbox" id="remember">记住密码
            </label>
        </div>

        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-primary  btn-block">登陆
        </button>
    </div>
</div>
    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("提示:账号只能为数字");
                }
                else {
                    $("#info").text("");
                }
            }
        )
        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#id').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus();
        $("#loginButton").click(function () {
            var id =$("#id").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');
            if (id == '') {
                $("#info").text("提示:账号不能为空");
            }
            else if( passwd ==''){
                $("#info").text("提示:密码不能为空");
            }
            else if(isNaN( id )){
                $("#info").text("提示:账号必须为数字");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            $("#info").text("提示:账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="admin_main.html";
                        } else if (data.stateCode.trim() === "2") {
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="reader_main.html";

                        }
                    }
                });
            }
        })

    </script>
</div>
</form>
</body>
</html>