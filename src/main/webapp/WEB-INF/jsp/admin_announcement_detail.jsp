<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> ${detail.title}</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/my.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
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

<div class="col-xs-6 col-md-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading" style="background-color: #00000082;padding: 20px 15px;">
            <h3 class="panel-title" style="font-size: 23px;text-align:center;">${detail.title}</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                                <tr>
                                    <td style="text-align:center;">${detail.time}</td>
                                </tr>
                <tr>
                    <td >${detail.article}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
