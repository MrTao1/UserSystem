<% String appPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>用户列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
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
    <h1 class="text-center"><small>用户列表信息页面</small></h1>
    <hr/>
    <br/>
    <form class="form-inline" action="<%=basePath%>/user/queryByPage" method="post">
        <div class="form-group">
            <label>用户姓名：</label>
            <input type="text" class="form-control" name="userName"/>
        </div>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        <div class="form-group">
            <label>用户邮箱</label>
            <input type="text" class="form-control" name="userEmail"/>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <input type="submit" value="查询" class="form-control btn btn-info"/>
            &nbsp;&nbsp;
            <input type="reset" value="重置" class="form-control btn btn-danger"/>
        </div>
    </form>
    <br/>
    <hr/>
    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${path}/user/toAddUser">新增</a>
        </div>
    </div>
    <div class ="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户名字</th>
                    <th>用户邮箱</th>
                    <th>用户密码</th>
                    <th>用户创建时间</th>
                    <th>用户更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${requestScope.get('page').beanList}" varStatus="status">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.userEmail}</td>
                        <td>${user.decryptUserPassword}</td>
                        <td>${user.userCreateTime}</td>
                        <td>${user.userUpdateTime}</td>
                        <td>
                            <a href="${path}/user/toUpdateUser?id=${user.userId}">更改</a>
                            <a href="<%=appPath%>/user/del/${user.userId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <form class="userForm" method="post" action="<%=basePath %>/user/queryByPage">
        <div class="row">
            <div class="form-inline">
                <c:set value="${requestScope.get('page')}" var="page"/>
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${page.totalCount}</b>条记录，共<b>${page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize" onchange="this.form.submit()">
                        <option value="10"
                                <c:if test="${page.pageSize == 10}">selected</c:if> >10
                        </option>
                        <option value="20"
                                <c:if test="${page.pageSize == 20}">selected</c:if> >20
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>

                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/user/queryByPage?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.pageCode > 2}">
                            <a href="<%=basePath%>/user/queryByPage?pageCode=${requestScope.page.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>
                            <c:set var="end" value="${requestScope.page.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.page.totalPage}">
                                <c:set var="begin" value="${requestScope.page.totalPage -4}"/>
                                <c:set var="end" value="${requestScope.page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.pageCode}">
                            <li>
                                <a href="<%=basePath%>/user/queryByPage?pageCode=${i}&pageSize=${requestScope.page.pageSize}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                            <a href="<%=basePath%>/user/queryByPage?pageCode=${requestScope.page.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/queryByPage?pageCode=${requestScope.page.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
</html>