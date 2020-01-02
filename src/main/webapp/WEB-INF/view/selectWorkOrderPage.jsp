<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>

<head>
    <meta charset="utf-8">
    <title>课程信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>
<!--数据查询-->
<form class="layui-form">
    <div class="layui-input-inline">
        <input type="text" autocomplete="off" placeholder="请输入员工姓名"  class="layui-input" id="kcm" value="">
    </div>
    <a class="layui-btn mgl-20" data-type="reload" id="queryBtn">查询</a>
<%--    <a class="layui-btn mgl-20 layui-btn-normal" data-type="add" id="addBtn">添加</a>--%>
</form>
<!--用户数据表格-->
<table class="layui-hide" id="courselist" lay-filter="courselist"></table>

<script type="text/html" id="barDemo">
<%--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#courselist'
            ,url:'${pageContext.request.contextPath}/workOrder/selectWorkOrder'
            ,title: '工单进度信息表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'workId', title:'工单编号', width:100,hidden:true}
                ,{field:'workorderid', title:'工单编号', width:120}
                ,{field:'userid', title:'用户账户编号', width:120}
                ,{field:'orderId', title:'订单编号', width:120}
                ,{field:'question', title:'问题描述', width:120}
                ,{field:'staffid', title:'员工编号', width:160}

                ,{field:'aftersalecardid', title:'保修卡编号', width:120}
                ,{field:'phone', title:'手机号', width:120}
                ,{field:'questionType', title:'问题类型', width:120}
                ,{field:'questionDate', title:'用户发起时间', width:120}
                ,{field:'paymethod', title:'支付方式', width:160}

                ,{field:'payment', title:'支付金额', width:120}
                ,{field:'status', title:'是否需要派人上门维修', width:120}
                ,{field:'appointment', title:'预约处理时间', width:120}
                ,{field:'checkResult', title:'检查后的结果', width:120}
                ,{field:'consumables', title:'是否需要耗材', width:160}
                ,{field:'consumableId', title:'耗材编号', width:160}
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
            // getCheckData: function(){ //获取选中数据
            //     layer.open({
            //         type: 1,
            //         title: '批量处理',
            //         area: '460px',
            //         offset: '100px',
            //         content: $("#addRecordBox"),
            //         end: function() {
            //             $("#addRecordBox").find('input').val("")
            //         }
            //     });
            // },
            <%--toedit:function (winTitle,workId) {--%>
            <%--    layer.open({--%>
            <%--        type: 2,--%>
            <%--        title: '添加员工信息',--%>
            <%--        shadeClose: false,--%>
            <%--        shade: 0.5,--%>
            <%--        maxmin: true, //开启最大化最小化按钮--%>
            <%--        area: ['1000px', '600px'],--%>
            <%--        content: '${pageContext.request.contextPath}/courseinfo/toedit/'+workId--%>
            <%--    });--%>
            <%--}--%>
        };

        $('#queryBtn').on('click', function(){
            active.reload();
        });

        $("#addBtn").click(function () {
            active.toedit("修改员工信息",0);
        });

        //监听行工具事件
        table.on('tool(courselist)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                active.toedit("修改员工信息",data.id);
            }
        });
    });
</script>

</body>

</html>