<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <style>
    .checkbox{
    margin-left: 30px !important ;
    }
    *{
      outline: none;
      /* 让输入框被选中后没有默认框框 */
    }

    body{
       margin: 0;
        padding: 0;
        /* 让页面外围没有一圈内边距 */
        /* 尽量使用相对位置或图床链接 */
        background-size: cover;
        background-attachment: fixed;
    }
    #remember{
    width: 50% !important ;
    }
    #login{
      background-color: rgba(255, 255, 255, .3);
      width: 400px;
      height: 450px;
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
    .Mywidth{
        width:40px !important;
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
    p {
        margin: -60px 40px 10px;
    }

    .zz{
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
<body background="img/wallpaper.png">
<c:if test="${!empty error}">
    <script>
            alert("${error}");
            window.location.href="login.html";
</script>
</c:if>
<div  id="login">

    <h1 class="tt">图 书 馆</h1>
        <input class="zz" type="text"  id="id" placeholder="用户名">
        <input class="zz" type="password"  id="passwd" placeholder="密码">
        <div class="checkbox text-left">
            <label>
                <input class="Mywidth" type="checkbox" id="remember">记住密码
            </label>
        </div>
        <p style="text-align: right;color: red;position: absolute" id="info"></p>
        <input class="zz" type="submit" id="loginButton" class="btn tt" value="登 录" >
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
                            window.location.href="admin_main.html";
                        } else if (data.stateCode.trim() === "2") {
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            window.location.href="reader_main.html";

                        }
                    }
                });
            }
        })

    </script>
</div>

</body>
</html>
