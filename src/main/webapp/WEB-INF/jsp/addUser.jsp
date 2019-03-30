<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" +request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>新增用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    基于SSM框架的用户管理系统：简单实现增、删、改、查。
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增用户</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="" name="userForm">
        用户名字：<input type="text" name="userName"><br><br><br>
        用户邮箱：<input type="text" name="userEmail"><br><br><br>
        用户密码：<input type="password" name="userPassword"><br><br><br>
        确认密码：<input type="password" name="userPassword1"><br><br><br>
        <div style="color: #ffcd61">${message}</div>
        <input type="button" value="添加" onclick="addUser()">
    </form>
    <script type="text/javascript">
        function addUser(){
            var form = document.forms[0];
            form.action = "<%=basePath %>user/addUser";
            form.method = "post";

            var userPassword = document.getElementsByName('userPassword')[0].value;
            var userPassword1 = document.getElementsByName('userPassword1')[0].value;
            if(userPassword != userPassword1){
                alert('两次密码输入不一致！');
                document.forms[0].reset();
                return;
            }

            form.submit();
        }
    </script>
</div>
