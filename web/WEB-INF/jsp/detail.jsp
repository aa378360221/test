<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>许·夜</title>
    <script src="/static/js/jquery-3.2.1.min.js"></script>
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
<div class="container-wrap">
    <div class="container container-message container-details container-comment" style="margin-right: 1000px">
        <div class="contar-wrap" style="width: 1200px;margin-left: 0px">
            <h4 class="item-title">
                <p><i class="layui-icon layui-icon-speaker"></i>公告：<span>博客尚未完善，如有问题，请联系我，感谢您宝贵的意见！</span></p>
            </h4>
            <div class="item">
                <div class="item-box  layer-photos-demo1 layer-photos-demo">
                    <div style=" text-align: center">
                    <span style="font-size: 50px;color: #1e9fff;">${article.title}</span><br>
                    </div>
                    <h4 style="margin-left: 800px;color: #01AAED">作者：许夜&nbsp;&nbsp;&nbsp;&nbsp;发布于：<span>${article.localTime}</span></h4>
                    <span style="font-size: 25px;color: #449d44;">简介：${article.desci}</span>
                    <br><br><div style="text-align: center"><span style="font-size: 30px;color: #0062cc">正文</span></div><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;<p>${article.content}</p>
                    <hr class="layui-bg-red">
                    <div class="count layui-clear">
                        <span class="pull-left" style="font-size: 20px">阅读 <em>${article.click}</em></span>
                        <span class="pull-right like" style="font-size: 20px" onclick="likeNumAdd(${article.id})"><em>点赞&nbsp;<i class="layui-icon layui-icon-praise" style="font-size: 20px;color: #1e9fff"></i><span id="likeNum">${article.likeNum}</span></em></span>
                    </div>
                </div>
            </div>
            <div>
                <a href="javascript:;" class="pull-left" style="font-size: 30px;color: #009688">最新评论</a>
                <a href="#goComment" class="pull-right" style="font-size: 30px;color: #1E9FFF"><i class="layui-icon layui-icon-chat" style="font-size: 30px;color: #1E9FFF"></i>
                写评论</a>
                <br/><br/><br/>
            </div>
            <c:forEach items="${comments}" var="comment">
                <hr class="layui-bg-blue">
            <div id="LAY-msg-box">
                <div class="info-item">
                    <img class="info-img" src="/static/js/static/images/info-img.png">

                    <div>
                        <span style="font-size: 20px;color:#3F3F3F ">${comment.name} </span>
                        <br/>
                        <span style="font-size: 10px;color:#92B8B1;margin-left:920px;margin-right: 25px  ">发布于: ${comment.date}</span>
                        <span style="font-size: 15px;color:#3F3F3F ">${comment.content} </span>
                    </div>
                </div>
            </div>
            </c:forEach>
            <div ></div>
            <div id="goComment"></div>
            <form class="layui-form" id="form1" name="form1">
                <div class="layui-form-item layui-form-pane">
                    <input type="text" name="name" required lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" id="name">
                    <br>
                    <textarea  class="layui-textarea" name="content" style="resize:none" placeholder="抱歉，富文本框尚为完善，请期待，目前只能输入文字。" id="content"></textarea>
                </div>
                <p style="text-align: right;color: red;position: absolute" id="info"></p>
                <div class="item-btn">
                    <button class="layui-btn layui-btn-normal" type="button" id="item-btn" onclick="login()">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<div class="footer">
    <p>
        <span>&copy; 2018</span>
        <span><a href="http://www.layui.com" target="_blank">许夜</a></span>
        <span>MIT license</span>
    </p>
    <p><span>人生就是一场修行</span></p>
</div>
<script src="/static/js/layui/layui.js"></script>
<script>
    layui.config({
        base: '/static/js/static/js/'
    }).use('blog');
</script>
<script type="text/javascript">
    var flag = true;
    function login() {
        if($("#content").val()==''&&$("#name").val()==''){
            $("#info").text("提示:请输入评论内容,昵称");
        }
        else if($("#name").val().length >10) {
            $("#info").text("提示:您的昵称过长，请修改");
        }
        else if ($("#content").val()==''){
            $("#info").text("提示:请输入评论内容");
        }
        else if($("#name").val()==''){
            $("#info").text("提示:请输入昵称");
        }
        else {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/api/comment/add?articleId=${article.id}" ,//url
            data: $('#form1').serialize(),
            error : function() {
                layer.msg('评论成功，等待刷新！');
                setTimeout(function(){
                    window.location.reload();//刷新当前页面.
                },2000)
            }
            })
    }};
    function likeNumAdd(id) {
        if(flag) {
            var articleId = id;
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/home/likeNum?articleId=" + articleId,//url
            })
        }
        flag = false;
    }
</script>
</body>
</html>