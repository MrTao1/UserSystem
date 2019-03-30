<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("path",request.getContextPath());
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>首頁</title>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
            font-size: 18px;
        }
        h3{
            width:180px;
            height:38px;
            margin:100px auto;
            text-align:center;
            background:deepskyblue;
            border-radius: 4px;
        }
    </style>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<html>
<body>
<h1 class="text-center">基于SSM框架的用户管理系统：简单实现增、删、改、查。</h1>
<hr/>
<form action="<%=basePath%>/user/login" method="post" class="form-inline text-center">
    <label>username:</label>
    <input type="text" class="form-control" name="userName"/>
    <br/>
    <br/>
    <label>password:</label>
    <input type="password" class="form-control" name="userPassword"/>
    <br/>
    <br/>
    <input type="submit" value="点击登录进入管理页面" class="btn btn-default"/>
</form>
</body>
</html>
