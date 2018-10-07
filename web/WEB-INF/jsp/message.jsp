<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>许·夜</title>
	<link rel="stylesheet" href="/static/css/bootstrap4.0.min.css" >
	<script src="/static/js/jquery.slim.min.js" ></script>
	<script src="/static/js/popper.min.js" ></script>
	<script src="/static/js/bootstrap4.0.min.js"></script>
	<script src="/static/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="/static/js/layui/css/layui.css">
	<link rel="stylesheet" href="/static/js/static/css/mian.css">
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
					  <li class="layui-nav-item"><a href="/home/zhuye">首页</a></li>
					  <li class="layui-nav-item  layui-this"><a href="/home/message">留言</a></li>
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
			<div class="container container-message">
				<div class="contar-wrap" id="contar-wrap">
					<form class="layui-form"  id="form1">
						<div style="font-size: 40px;color: #00F7DE"><b><i>博客尚未完善，期待您宝贵的意见！</i></b></div>
						<br>
						<div class="layui-form-item layui-form-pane">
							<input type=s"text" name="name" required lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" id="name">
							<br>
							<textarea  class="layui-textarea"  name="content"style="resize:none" placeholder="请输入您宝贵的留言" id="content" ></textarea>
						</div>
						<p style="text-align: right;color: red;position: absolute" id="info"></p>
						<div class="item-btn">
							<button class="layui-btn layui-btn-normal" type="button" id="item-btn" onclick="login()">提交</button>
						</div>
					</form>
					<c:forEach items="${messages}" var="message">
					<div id="LAY-msg-box">
						<div class="info-box">
							<div class="info-item">
								<img class="info-img" src="/static/js/static/images/info-img.png">
								<div>
									<span style="font-size: 20px;color:#3F3F3F ">${message.name} </span>
									<br/>
									<span style="font-size: 10px;color:#92B8B1;margin-left:440px;margin-right: 25px  ">发布于: ${message.date}</span><br>
									<span style="font-size: 15px;color:#3F3F3F ">${message.content} </span>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<div style="text-align: center;width:2000px; " >
						<ul class="pagination justify-content-center" style="margin-right: 1200px">
							<li class="page-item <c:if test="${pageInfo.pageNum==1}">disabled</c:if> ">
								<a class="page-link" href="/home/message?page=1" >首页</a>
							</li>
							<li class="page-item <c:if test="${pageInfo.pageNum < 2}">disabled</c:if> ">
								<a class="page-link" href="/home/message?page=${pageInfo.prePage}" >上一页</a>
							</li>
							<c:forEach begin="1" end="${pageInfo.pages}" step="1" var="pageNo">
								<li class="page-item <c:if test="${pageInfo.pageNum==pageNo}">active</c:if>"><a class="page-link" href="/home/message?page=${pageNo}">${pageNo}</a></li>
							</c:forEach>
							<li class="page-item <c:if  test="${pageInfo.pageNum > (pageInfo.pages-1)}">disabled</c:if> ">
								<a class="page-link" href="/home/message?page=${pageInfo.nextPage}" >下一页</a>
							</li>
							<li class="page-item  <c:if test="${pageInfo.pageNum==pageInfo.pages}">disabled</c:if> ">
								<a class="page-link" href="/home/message?page=${pageInfo.pages}">最后一页</a>
							</li>
						</ul>
					</div>
					<div id="test1" class="paging"></div>
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
	</div>
		<script src="/static/js/layer.js"></script>
		<script type="text/javascript">
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
                        url: "/home/message/add" ,//url
                        data: $('#form1').serialize(),
                        success : function(data) {
                            layer.msg('评论成功，等待刷新！');
                            setTimeout(function(){
                                window.location.reload();//刷新当前页面.
                            },2000)
                        },
                        error : function() {
                            layer.msg('评论成功，等待刷新！');
                            setTimeout(function(){
                                window.location.reload();//刷新当前页面.
                            },2000)
                        }
                    })
                }};
		</script>

</body>
