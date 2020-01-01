<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>工单信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>工单信息</legend>
</fieldset>

<form class="layui-form" action="" id="courseform">
    <div class="layui-form-item">
        <c:forEach items="${workOrders}" var="workOrder">
            <div>
                <label class="layui-form-label">工单编号</label>
                <div class="layui-input-block">
                    <input type="text" name="workorderid" value="${workOrder.workorderid}"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" value="${workOrder.name}" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div>
                <label class="layui-form-label">问题类型</label>
                <div class= "layui-input-inline">
                    <select name="questionType">
                        <option value="零部件损坏" ${workOrder.questionType.equals("零部件损坏")?"selected":""}>零部件损坏</option>
                        <option value="冰箱通电不能工作" ${workOrder.questionType.equals("冰箱通电不能工作")?"selected":""}>冰箱通电不能工作</option>
                        <option value="其他问题" ${workOrder.questionType.equals("其他问题")?"selected":""}>其他问题</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">问题描述</label>
                <div class="layui-input-block">
            <textarea name="desc" id="question" class="layui-textarea">
                    ${workOrder.question}
            </textarea>
                </div>
            </div>
        </c:forEach>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">图片信息</label>
            <div class="layui-input-block" id="image">
                <c:forEach items="${workOrders}" var="work">
                    <c:if test="${work.image!=null}">
                        <img src="${pageContext.request.contextPath}/upload/${work.image}" style="width: 60px;height: 80px">
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn btn-colse" lay-submit lay-filter="formDemo">确定</button>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block" style="color:red;">
            <div class="ajaxerrordiv"></div>
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ext.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
        $ = layui.$;

        $(".btn-close").click(function(){
            //关闭父窗口
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        });
    });
</script>

</body>

</html>