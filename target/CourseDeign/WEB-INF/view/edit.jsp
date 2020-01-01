<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>修改员工信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>

    <blockquote class="layui-elem-quote layui-text" style="background-color: #33DF83;color:white;">
        本模块实现员工信息的维护，在员工信息更新时,务必确保数据的准确性和合法性。
    </blockquote>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>员工信息</legend>
    </fieldset>

    <form class="layui-form" action="" id="courseform">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">员工编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="workId" lay-verify="required" autocomplete="off" class="layui-input" value="${staff.workId}" readonly>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">员工类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="type" lay-verify="required" autocomplete="off" class="layui-input" value="${staff.type}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">员工姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input"  value="${staff.name}" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|number" autocomplete="off" class="layui-input" value="${staff.phone}" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select name="sex">
                        <option value="男" ${staff.sex=="男"?"selected":""}>男</option>
                        <option value="女" ${staff.sex=="女"?"selected":""}>女</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input type="text" name="age" lay-verify="required" autocomplete="off" class="layui-input" value="${staff.age}" >
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select name="roleId">
                        <option value="2" ${staff.roleId=="2"?"selected":""}>客服人员</option>
                        <option value="3" ${staff.roleId=="3"?"selected":""}>技术人员</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="ajaxsavebtn">保存</button>
                <button class="layui-btn layui-btn-primary btn-close">关闭</button>
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

            //监听提交
            form.on('submit(savebtn)', function(data) {
                var form = document.getElementById('courseform');
                form.action = "${pageContext.request.contextPath}/courseinfo/valid";
                form.method = "post";
                form.submit();
            });

            //监听提交
            form.on('submit(ajaxsavebtn)', function(data) {
                //layui把表单中的数据封装到data
                var json = JSON.stringify(data.field);
                $(".ajaxerrordiv").html();
                //发起ajax请求
                $.ajax({
                    url:"${pageContext.request.contextPath}/staff/update/",
                    type:"post",
                    data:json,
                    contentType:"application/json",
                    beforeSend:function(XMLHttpRequest){
                        //请求发送前
                        progressLoad("系统正在执行数据提交操作，请稍后...")
                    },
                    success:function(result){
                        progressClose();
                        //请求发送成功后
                        var msgkey =result.msgkey;
                        var message =result.message;
                        console.log(result);
                        if(msgkey=="vailderror"){
                            var errorMsg="";
                            $.each(result.data,function(index,value) {
                                console.log("3333333333333");
                                errorMsg+= value.defaultMessage;
                            });
                          $(".ajaxerrordiv").html(errorMsg);
                        }else{
                            //成功后
                            // 关闭当前窗体
                            alert("提交成功");
                            progressClose();
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index); //再执行关闭
                            window.parent.location.reload();
                        }
                    },
                    complete:function(XMLHttpRequest,result){
                        //请求发送完成
                        console.log("fasong");
                        console.log(XMLHttpRequest)
                    },
                    error:function(XMLHttpRequest,textStatus){
                        //请求发送失败
                        console.log(XMLHttpRequest)
                    }
                });
                //将layui表单域值转换为JSON串：JSON.stringify(data.field)
                return false;
            });

            $(".btn-close").click(function(){
                //关闭父窗口
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            });
        });
    </script>

</body>

</html>