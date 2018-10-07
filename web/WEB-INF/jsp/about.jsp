<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>许·夜</title>
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
    <div class="container">
        <div class="contar-wrap" >
            <h4 class="item-title">
                <p><i class="layui-icon layui-icon-speaker"></i>公告：<span>这是关于我的介绍</span></p>
            </h4>
        </div>
        <div class="layui-card">
            <br>
            <div class="layui-card-header"><span style="font-size: 35px;color:#4b5a75">简介</span></div>
            <br>
            <div class="layui-card-body" >
                <span style="font-size: 20px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本博客是用于练手的项目，尚未完善，后续会完善，前端页面使用的是bootstrap+layui搭建，还有个后台管理页面，
                因为关系到本人的博客内容，所以暂不开放，敬请谅解！<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需要源码的可以跟我联系，后台用的是SSM框架完成，
                后续会修改成Spring boot版本。文本框内容后续也会增加，并且还会加入标签分类等功能。<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式：马化腾 1178794144（QQ小号），欢迎探讨交流！<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果有会写前端页面的高手，希望合作一起开发的，可以联系我，本人对前端不是很熟悉，该博客的大部分时间都花在的页面上。<br>
                </span><br><br>
                <hr class="layui-bg-cyan">
                <br><br>
                <span style="font-size: 35px;color:#28a745">时间线</span>
                <hr class="layui-bg-cyan">
                <ul class="layui-timeline">
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h2 class="layui-timeline-title">2018年6月18日</h2>
                            <br>
                            <span style="font-size: 20px">
                                该博客测试版本发布了。
                            </span>
                            <br>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h2 class="layui-timeline-title">2018年5月20日</h2>
                            <br>
                            <span style="font-size: 20px">该博客的后台部分已经完成，敬请期待！</span>
                            <br>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h2 class="layui-timeline-title">2018年5月10日</h2>
                            <br>
                            <span style="font-size: 20px">
                                正式启动该博客项目！
                            </span>
                            <br>
                        </div>
                    </li>
                    <li class="layui-timeline-item">
                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                        <div class="layui-timeline-content layui-text">
                            <h2 class="layui-timeline-title">过去</h2>
                            <br>
                            <span style="font-size: 20px">
                                本人是一名大四的学生
                            </span>
                            <br>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
</div>

<div class="footer">
    <p>
        <span>&copy; 2018</span>
        <span><a href="http://www.layui.com" target="_blank">坑爹的许夜3</a></span>
        <span>MIT license</span>
    </p>
    <p><span>人生就是一场修行</span></p>
</div>
<script src="/static/js/layui/layui.js"></script>
<script>
</script>
</body>
</html>