
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/bootstrap4.0.min.css" >
    <script src="/js/jquery-3.2.1.min.js" ></script>
    <script src="/js/jquery.slim.min.js" ></script>
    <script src="/js/bootstrap4.0.min.js"></script>
</head>
<body>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
<div class="container">
    <form action="/admin/article/edit/do" method="post">
        <input type="hidden" value="${article.id}" name="id">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题" value="${article.title}">
        </div>
        <div class="form-group">
            <label for="catalogId">栏目</label>
            <select class="form-control" id="catalogId" name="catalogId">
                <option value="0" <c:if test="${article.catalogId==0}">selected="selected"</c:if>>学习</option>
                <option value="1" <c:if test="${article.catalogId==1}">selected="selected"</c:if>>生活</option>
            </select>
        </div>
        <div class="form-group">
            <label for="keywords">关键字</label>
            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键字" value="${article.keywords}">
        </div>
        <div class="form-group">
            <label for="desci">简介</label>
            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介">${article.desci}</textarea>
        </div>
        <div class="form-group">
            <span>内容</span>
                <div id="editor">
                </div>
            <textarea id="content" name="content" style="width:100%; height:200px;"></textarea>

        </div>
            <input type="submit"/> </form>
    <script  src="/js/wangEditor.min.js"></script>
    <script type="text/javascript"></script>
            <script type="text/javascript">
                var E = window.wangEditor;
                var editor = new E('#editor');
                var $content = $('#content');
                editor.customConfig.onchange = function (text) {
                    // 监控变化，同步更新到 textarea
                    $content.val(text)
                }
                editor.create()
                // 初始化 textarea 的值,注意需要加单引号
                $content.val(editor.txt.text('${article.content}'));

            </script>
        </div>
</body>
</html>