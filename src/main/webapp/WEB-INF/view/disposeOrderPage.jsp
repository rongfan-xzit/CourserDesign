<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>订单信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>
    <!--数据查询-->
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" autocomplete="off" placeholder="请输入订单编号"  class="layui-input" id="kcm" value="">
        </div>
        <a class="layui-btn mgl-20" data-type="reload" id="queryBtn">查询</a>
    </form>
    <!--用户数据表格-->
    <table class="layui-hide" id="courselist" lay-filter="courselist"></table>

    <script type="text/html" id="barDemo">
        {{# if(d.status =='未处理'){ }}
        <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="chuli">处理</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        {{# }if(d.status =='已处理') { }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        {{# } }}
    </script>

    <script src="${pageContext.request.contextPath}/plugins/layui/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        layui.use('table', function(){
            var table = layui.table;
            // console.log(table.row.status+"--66666666");

            table.render({
                elem: '#courselist'
                ,url:'${pageContext.request.contextPath}/order/find'
                ,title: '订单信息表'
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field:'orderId', title:'订单编号', width:100}
                    ,{field:'userId', title:'用户编号', width:120}
                    ,{field:'goodsId', title:'商品编号', width:120}
                    ,{field:'time', title:'购买日期', width:120}
                    ,{field:'number', title:'购买数量', width:120}
                    ,{field:'money', title:'总金额', width:160}
                    ,{field:'status', title:'订单状态', width:160}
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
                toedit:function (winTitle,orderId) {
                    console.log(orderId);
                    layer.open({
                        type: 2,
                        title: '修改员工信息',
                        shadeClose: false,
                        shade: 0.5,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['1000px', '600px'],
                        content: '${pageContext.request.contextPath}/staff/toedit/'+orderId
                    });
                },
                toedit1:function (winTitle,orderId) {
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
                    ,url:'${pageContext.request.contextPath}/order/disposeOrderByOrderId/'+$('#kcm').val().toString()
                    ,title: '订单信息表'
                    ,method:'GET'
                    ,cols:  [[
                        {type: 'checkbox', fixed: 'left'}
                        ,{field:'orderId', title:'订单编号', width:100}
                        ,{field:'userId', title:'用户编号', width:120}
                        ,{field:'goodsId', title:'商品编号', width:120}
                        ,{field:'time', title:'购买日期', width:120}
                        ,{field:'number', title:'购买数量', width:120}
                        ,{field:'money', title:'总金额', width:160}
                        ,{field:'status', title:'订单状态', width:160}
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
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        var  orderId = data[0,"orderId"] ;
                        console.log(orderId+"---orderId")
                        layer.close(index);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/order/deleteByOrderId/"+orderId,
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
                }
               else if(obj.event === 'chuli'){
                    layer.confirm('确定处理此订单信息吗？', function(index){
                        var  orderId = data[0,"orderId"] ;
                        layer.close(index);
                        $.ajax({
                            url:"${pageContext.request.contextPath}/order/updateByOrderId/"+orderId,
                            method:'POST',
                            dataType:"json",
                            success:function (msg) {
                                if(msg.msgkey=="vailderror") {
                                    alert(msg.message);
                                    table.reload('courselist');
                                }
                            }
                        })
                    });
                }
                else if(obj.event === 'edit'){
                    var  id1 = data[0,"OrderId"]
                    active.toedit("徐州工程学院教学工作量核算系统-修改课程信息",id1);
                }
            });
        });
    </script>

</body>

</html>