<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>投诉工单信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>
<!--数据查询-->
<form class="layui-form">
    <div class="layui-inline">
        <label class="layui-form-label">工单编号</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off" placeholder="请输入工单编号"  class="layui-input" id="inputWorkorderid" value="">
        </div>
    </div>
    <a class="layui-btn mgl-20" data-type="reload" id="queryBtn">查询</a>
<%--    <a class="layui-btn mgl-20 layui-btn-normal" data-type="add" id="addBtn">添加</a>--%>
</form>
<!--用户数据表格-->
<table class="layui-hide" id="courselist" lay-filter="courselist"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;
console.log(table+"-------");
        table.render({
            elem: '#courselist'
            ,url:'${pageContext.request.contextPath}/complaints/find'
            ,title: '投诉工单信息列表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'complaintsid', title:'投诉编号', width:100}
                ,{field:'workorderid', title:'工单编号', width:120}
                ,{field:'userId', title:'用户编号', width:120,hidden:true}
                ,{field:'name', title:'用户账号', width:120}
                ,{field:'phone', title:'用户手机号', width:160}
                ,{field:'images', title:'图片', width:120}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('courselist', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            },
            getCheckData: function(){ //获取选中数据
                layer.open({
                    type: 1,
                    title: '批量处理',
                    area: '460px',
                    offset: '100px',
                    content: $("#addRecordBox"),
                    end: function() {
                        $("#addRecordBox").find('input').val("")
                    }
                });
            },
            toedit:function (winTitle,workId) {
                console.log(workId);
                layer.open({
                    type: 2,
                    title: '修改员工信息',
                    shadeClose: false,
                    shade: 0.5,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['1000px', '600px'],
                    content: '${pageContext.request.contextPath}/staff/toedit/'+workId
                });
            },
            toedit1:function (winTitle,workId) {
                layer.open({
                    type: 2,
                    title: '添加员工信息',
                    shadeClose: false,
                    shade: 0.5,
                    maxmin: true, //开启最大化最小化按钮
                    area: ['1000px', '600px'],
                    content: '${pageContext.request.contextPath}/staff/toadd/'
                });
            }
        };

        $('#queryBtn').on('click', function(){
            //执行重载
            table.reload('courselist', {
                elem: '#courselist'
                ,url:'${pageContext.request.contextPath}/complaints/selectComplaints/'+$('#inputWorkorderid').val().toString()
                ,title: '投诉工单信息列表'
                ,method:'GET'
                ,cols:  [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field:'complaintsid', title:'投诉编号', width:100}
                    ,{field:'workorderid', title:'工单编号', width:120}
                    ,{field:'userId', title:'用户编号', width:120,hidden:true}
                    ,{field:'name', title:'用户账号', width:120}
                    ,{field:'phone', title:'用户手机号', width:160}
                    ,{field:'images', title:'图片', width:120}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });
        });

        $("#addBtn").click(function () {
            active.toedit1("添加员工信息",0);
        });

        //监听行工具事件
        table.on('tool(courselist)', function(obj){
            var data = obj.data;
            //console.log(obj)

            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    var  id = data[0,"workId"] ;
                    layer.close(index);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/staff/todelete/"+id,
                        method:'DELETE',
                        dataType:"json",
                        success:function (msg) {
                            if(msg.msgkey=="delSuccess") {
                                alert(msg.message);
                                table.reload('courselist');
                            }
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                var  id1 = data[0,"workId"]
                active.toedit("徐州工程学院教学工作量核算系统-修改课程信息",id1);
            }
        });
    });
</script>

</body>

</html>