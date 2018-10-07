<%--
  Created by IntelliJ IDEA.
  User: 许夜3
  Date: 2018/8/4
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>星·光</title>
    <link rel="shortcut icon" type="image/x-icon" href="/img/web-icon.png" media="screen" />
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/img/web-icon.png" media="screen" />
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/static/js/layui/css/layui.css">
    <link rel="stylesheet" href="/static/js/static/css/mian.css">
</head>
<body class="lay-blog">
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="/home/zhuye">
                <img src="/static/js/static/images/logo.png" alt="" class="logo-img">
                <img src="/static/js/static/images/logo-text.png" alt="" class="logo-text">
            </a>
        </h1>
        <form class="layui-form blog-seach pull-left" action="/home/search" method="post">
            <div class="layui-form-item blog-sewrap">
                <div class="layui-input-block blog-sebox">
                    <i class="layui-icon layui-icon-search"></i>
                    <input type="text" name="word" lay-verify="title" autocomplete="off"  class="layui-input">
                </div>
            </div>
        </form>
        <div class="blog-nav pull-right">
            <ul class="layui-nav pull-left">
                <li class="layui-nav-item layui-this"><a href="/home/zhuye">首页</a></li>
                <li class="layui-nav-item"><a href="/home/message">留言</a></li>
                <li class="layui-nav-item"><a href="/home/about">关于</a></li>
            </ul>
            <a href="/admin/index" class="personal pull-left">
                <i class="layui-icon layui-icon-username"></i>
            </a>
        </div>
        <div class="mobile-nav pull-right" id="mobile-nav">
            <a href="javascript:;">
                <i class="layui-icon layui-icon-more"></i>
            </a>
        </div>
    </div>
    <ul class="pop-nav" id="pop-nav">
        <li><a href="/home/zhuye">首页</a></li>
        <li><a href="/home/message">留言</a></li>
        <li><a href="/home/about">关于</a></li>
    </ul>
</div>

<div class="container-wrap" >
    <div class="container container-message" style="margin-left: 400px">
        <div class="contar-wrap" id="contar-wrap">
            <div class="layui-form" >
                <table class="layui-table" style="width: 1500px; ">
                    <colgroup>
                        <col width="400">
                        <col width="400">
                        <col width="400">
                        <col width="400">
                        <col width="400">
                        <col width="400">
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="font-size: 20px">id</th>
                        <th style="font-size: 20px" width="25%">标题</th>
                        <th style="font-size: 20px">发表时间</th>
                        <th style="font-size: 20px">点击量</th>
                        <th style="font-size: 20px">点赞数</th>
                        <th style="font-size: 20px">详情</th>
                    </tr>
                    </thead>
    </thead>
    <tbody>
    <c:forEach items="${articles}" var="article">
        <tr>
            <th scope="row" style="font-size: 20px">${article.id}</th>
            <td style="font-size: 20px">${article.title}</td>
            <td style="font-size: 20px">${article.localTime}</td>
            <td style="font-size: 20px">${article.click}</td>
            <td style="font-size: 20px">${article.likeNum}</td>
            <td style="font-size: 20px"><button type="button" class="btn btn-outline-info"><a href="/article?id=${article.id}"><span style="font-size: 20px">详情</span></a></button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
                <br/>
<div style="text-align: center;width: 1000px;margin-left: 200px">
    <ul class="pagination justify-content-center">
        <li class="page-item <c:if test="${pageInfo.pageNum==1}">disabled</c:if> ">
            <a class="page-link" href="/home/search/message?page=1" >首页</a>
        </li>
        <li class="page-item <c:if test="${pageInfo.pageNum < 2}">disabled</c:if> ">
            <a class="page-link" href="/home/search/message?page=${pageInfo.prePage}" >上一页</a>
        </li>
        <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="pageNo">
            <li class="page-item <c:if test="${pageInfo.pageNum==pageNo}">active</c:if>"><a class="page-link" href="/home/search/message?page=${pageNo}">${pageNo}</a></li>
        </c:forEach>
        <li class="page-item <c:if  test="${pageInfo.pageNum > (pageInfo.pages-1)}">disabled</c:if> ">
            <a class="page-link" href="/home/search/message?page=${pageInfo.nextPage}" >下一页</a>
        </li>
        <li class="page-item  <c:if test="${pageInfo.pageNum==pageInfo.pages}">disabled</c:if> ">
            <a class="page-link" href="/home/search/message?page=${pageInfo.pages}">最后一页</a>
        </li>
    </ul>
</div>
<div id="test1" class="paging"></div>
</div>
</div>
</div>
</div>
<div class="footer">
    <p>
        <span>&copy; 2018</span>
        <span><a href="http://www.layui.com" target="_blank">layui.com</a></span>
        <span>MIT license</span>
    </p>
    <p><span>人生就是一场修行</span></p>
</div>
</body>
</html>
