<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
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
<body>
<div id="header"></div>

</body>
</html>
