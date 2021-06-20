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
        #mainPanel {
            margin: auto;
            width: 1000px;
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
