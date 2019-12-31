<%@ page session="true" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="../ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="../ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="../plugins/layui/lay/modules/layer.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../plugins/layui/layui.all.js"  media="all">
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../plugins/layui/layui.all.js" media="all">
<%--    <link rel="stylesheet" href="../plugins/layui/lay/modules/layer.js">--%>
    <style>
        .page-settings {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
    </style>

    <script type="text/javascript">
        // zTree属性设置 setting
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    idKey: 'id',
                    pIdKey: 'parentid',
                    rootId: 0
                }
            },
            check: {
                enable: true // 除了设置此属性，还要导入jquery.ztree.excheck.js
            }
        }

        // 加载权限树
        function initZTree() {
            $.ajax({
                url: '../authority/getsyspermissiontree',
                dataType: 'json',
                type: 'GET',
                success: function(data) {
                    var zTreeObj = $.fn.zTree.init($("#ztreedemo"), setting, data);
                    zTreeObj.expandAll(true); // 展开全部的节点
                }
            });
        }

        // 加载角色数据
        function initRole() {
            $.ajax({
                url: '../authority/getsysrole',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    $.each(data, function(i, v) {
                        var row = $("#template").clone(true); // 克隆模板，同时注意事件监听失效
                        for(attr in v) {
                            row.find("#" + attr).html(v[attr]); // 数据的复制
                        }
                        $("#table-role > tbody").append(row); // 将数据添加到表格里面
                    });
                    $("#table-role > tbody > tr:eq(0)").remove(); // 删除模板
                },
                error: function() {
                    alert('数据加载失败...');
                }
            });
        }

        // 角色权限值的查看
        function admin_role_query(obj) {
            var role_id = $(obj).parents(".text-c").find("#roleid").text(); // 查找角色的ID
            var zTreeObj = $.fn.zTree.getZTreeObj("ztreedemo"); // 获取权限数的对象  <ul id="ztreedemo"></ul>
            let nodes = zTreeObj.transformToArray(zTreeObj.getNodes()); // 获取全部节点，将节点转换为数组

            $.ajax({
                url: '../authority/getsyspermissiontreebyroleid',
                type: 'GET',
                data: {'role_id': role_id},
                dataType: 'json',
                success: function(data) { // 此data就带有checked属性
                    for (let k = 0; k < nodes.length; k++)
                        zTreeObj.checkNode(nodes[k], false);

                    for(var i=0;i<data.length;i++) {
                        let item = zTreeObj.getNodeByParam("id",data[i].id);
                        zTreeObj.checkNode(item,true);
                    }
                    // if(data && nodes && data.length > 0 && nodes.length > 0) {
                    //     zTreeObj.removeChildNodes(nodes[0]); // 删除原来的权限树，删除根节点
                    //     zTreeObj.updateNode(nodes[0], true); // 删除权限后记得进行更新操作
                    //     zTreeObj = $.fn.zTree.init($("#ztreedemo"), setting, data); //加载新的数据
                    //     zTreeObj.expandAll(true); // 展开全部的节点
                    // }
                }
            })
        }

        // 权限分配：给对应角色分配权限
        function admin_role_settings(obj) {
            var zTreeObj = $.fn.zTree.getZTreeObj("ztreedemo"); // 得到权限树
            var nodes = zTreeObj.getCheckedNodes(true); // 得到被选中的节点

            if(nodes.length == 0) {
                layer.msg('你还未选中要分配的权限...', {icon:1,time:3000});
                return;
            }

            var ids = []; // 权限值数组
            for(var i = 0; i < nodes.length; i++) {
                ids.push(nodes[i].id); // 选中的权限值存入到数组里面
            }
            var role_id = $(obj).parents(".text-c").find("#roleid").text(); // 查找角色的ID
            // console.log(ids.join('-')); // 把数组的所有元素放入一个字符串。元素通过指定的分隔符进行分隔
            // console.log(role_id);

            // 提交需要更新的权限数据
            $.ajax({
                url: '../authority/updatepermissionbyroleid',
                type: 'POST',
                dataType: 'json',
                data: {'role_id':role_id, 'permission_ids': ids},
                success: function(data) {
                    console.log("**************8",data);

                   if(data==1){
                     alert('权限分配成功...',{icon:1,time:3000});
                    }
                },
                error: function() {
                   alert('权限分配失败...',{icon:1,time:3000});
                }
            });
        }

        $(function() {
            initZTree(); // 执行加载权限树的数据
            initRole(); // 加载角色数据
        });
    </script>

</head>
<body>
<div class="page-container">
    <div class="page-settings">
        <ul id="ztreedemo" class="ztree"></ul>
        <ul  class="ztree" style="width:85%;" >
            <table class="layui-table" style="width: 60%" id="table-role">
                <thead>
                <tr>
                    <th scope="col" colspan="6">角色管理</th>
                </tr>
                <tr class="text-c">
                    <th >角色编号</th>
                    <th >角色名称</th>
                    <th >角色描述</th>
                    <th >角色操作</th>
                </tr>
                </thead>
                <tbody>
                <!--数据模板-->
                <!--其中td中id=xx就是对应实体类里面的属性-->
                <tr class="text-c" id="template">
                    <td id="roleid">1</td>
                    <td id="name">超级管理员</td>
                    <td id="description">拥有至高无上的权利</td>
                    <td class="f-14"><a title="查看" href="javascript:;" onclick="admin_role_query(this)" style="text-decoration:none">查看</a> <a title="分配" href="javascript:;" onclick="admin_role_settings(this)" class="ml-5" style="text-decoration:none">分配</a></td>
                </tr>
                </tbody>
            </table>
        </ul>
    </div>
</div>
</body>
</html>
