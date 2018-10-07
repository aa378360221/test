<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>许·夜</title>
	<link rel="shortcut icon" type="image/x-icon" href="/static/images/web-icon.png" media="screen" />
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<script src="/static/js/jquery-3.2.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
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
							<p><i class="layui-icon layui-icon-speaker"></i>公告：<span>欢迎来到许夜的轻博客</span></p>
						</h4>
					</div>
						<c:forEach items="${articles}" var="article">
						<div class="item">
							<div class="item-box  layer-photos-demo1 layer-photos-demo">
								<span><a href="/article?id=${article.id}" style="font-size: 30px;color: #1e9fff;">${article.title}</a></span>
								<h5>发布于：<span>${article.localTime}</span></h5>
								<h4>&nbsp;&nbsp;${article.desci}</h4>
							</div>
							<div class="comment count">
									<a href="${pageContext.request.contextPath}/article?id=${article.id}" style="font-size: 20px"><i class="layui-icon layui-icon-chat" style="color: #1E9FFF;font-size: 20px"></i>评论</a>
								<a href="javascript:;" class="like" style="font-size: 20px" onclick="likeNumAdd(${article.id})"><i class="layui-icon layui-icon-praise" style="color: #007bff;font-size: 20px"></i>&nbsp;点赞(${article.likeNum})</a>
							</div>
						</div>
						</c:forEach>
				<div style="text-align: center" >
					<ul class="pagination">
					<li class="page-item <c:if test="${pageInfo.pageNum < 2}">disabled</c:if> ">
							<a class="page-link" href="/home/zhuye?page=${pageInfo.prePage}" >上一页</a>
						</li>
					<li class="page-item <c:if  test="${pageInfo.pageNum > (pageInfo.pages-1)}">disabled</c:if> ">
							<a class="page-link" href="/home/zhuye?page=${pageInfo.nextPage}" >下一页</a>
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
				<span><a href="http://www.layui.com" target="_blank">layui.com</a></span> 
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
		<script>
			var flag = true;
			var prevId = [];
			function likeNumAdd(id) {
			    for(var i=0;i<prevId.length;i++){
			        if(prevId[i]==id){
			            flag = false;
					}
				}
			    if(flag) {
                    var articleId = id;
                    prevId[prevId.length] = articleId;
                    $.ajax({
                        type: "POST",//方法类型
                        dataType: "json",//预期服务器返回的数据类型
                        url: "/home/likeNum?articleId=" + articleId,//url
                    })
                }
                flag = true;
            }
		</script>
</body>
</html>