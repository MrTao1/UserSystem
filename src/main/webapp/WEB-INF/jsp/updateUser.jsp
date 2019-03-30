<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" +request.getServerName() + ":" +request.getServerPort() +path +"/";
%>
<html>
<head>
    <title>修改用户</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
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

    <form action="" name="userForm">
        <input type="hidden" name="userId" value="${user.userId}"/>
        用户名字：<input type="text" name="userName" value="${user.userName}">
        用户邮箱：<input type="text" name="userEmail" value="${user.userEmail}">
        用户密码：<input type="password" name="userPassword" value="${user.userPassword}">
        确认密码：<input type="password" name="userPassword1" value="${user.userPassword1}">
        <input type="button" value="提交" onclick="updateUser()"/>
    </form>
    <script type="text/javascript">
        function updateUser(){
            var form = document.forms[0];
            form.action = "<%=basePath %>user/updateUser";
            form.method = "post" ;
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
