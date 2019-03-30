<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<br/>
<br/>
<br/>
<center><h2>${message}</h2></center>
<br/>
<center>
    <a href="<%=basePath%>/">
        <button type="button" class="btn btn-primary btn-lg">点击我返回登录</button>
    </a>
</center>
</body>
</html>