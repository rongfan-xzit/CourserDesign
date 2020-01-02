<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>

<head>
    <meta charset="utf-8">
    <title>确认工单信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layui/css/layui.css" media="all">
</head>

<body>

<%--<blockquote class="layui-elem-quote layui-text" style="background-color: #33DF83;color:white;">--%>
<%--    本模块实现员工信息的维护，在员工信息更新时,务必确保数据的准确性和合法性。--%>
<%--</blockquote>--%>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>确认工单信息</legend>
</fieldset>

<!--数据查询-->
<div class="layui-form-item">
    <div class="layui-inline">
        <label class="layui-form-label">工单编号</label>
        <div class="layui-input-inline">
            <input type="text" autocomplete="off" placeholder="请输入订单编号"  class="layui-input" id="inputOrderId" value="">
        </div>
    </div>
    <a class="layui-btn mgl-20" data-type="reload" id="queryBtn">查询</a>
</div>


<form class="layui-form" action="" id="courseform">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">工单编号</label>
            <div class="layui-input-inline">
                <input type="text" name="workorderid" id="workorderid"  class="layui-input" value="">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">保修卡编号</label>
            <div class="layui-input-inline">
                <input type="text" name="aftersalecardid" id="aftersalecardid" lay-verify="required" autocomplete="off" class="layui-input" value="${aftersalecardid}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">问题类型</label>
            <div class="layui-input-inline">
                <select id="questionType" name="questionType"  value="">
                    <option value="">选择问题类型</option>
                    <option value="退货"${courseInfo.questionType=="退货"?"selected":""}>退货</option>
                    <option value="换货"${courseInfo.questionType=="换货"?"selected":""}>换货</option>
                    <option value="维修"${courseInfo.questionType=="维修"?"selected":""}>维修</option>
                    <option value="服务预约"${courseInfo.questionType=="服务预约"?"selected":""}>服务预约</option>
                    <option value="补发商品"${courseInfo.questionType=="补发商品"?"selected":""}>补发商品</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">问题描述</label>
                    <div class="layui-input-inline">
                        <textarea  type="text" id="question" name="question"  autocomplete="off" class="layui-input" value=""></textarea>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">问题描述图片</label>
                <div class="layui-input-inline">
                    <img id="imagePath" name="imagePath" src="">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" lay-verify="required|number" autocomplete="off" class="layui-input" value="">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">住址</label>
                <div class="layui-input-inline">
                    <input type="text" id="address" name="address"  autocomplete="off" class="layui-input" value="">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">支付方式</label>
                <div class="layui-input-inline">
                    <select id="paymethod" name="paymethod" lay-verify="required">
                        <option value="">选择支付方式</option>
                        <option value=""${courseInfo.paymethod=="支付宝支付"?"selected":""}>支付宝支付</option>
                        <option value=""${courseInfo.paymethod=="微信支付"?"selected":""}>微信支付</option>
                        <option value="" ${courseInfo.paymethod=="银行卡支付"?"selected":""}>银行卡支付</option>
                        <option value="" ${courseInfo.paymethod=="-"?"selected":""}>其它</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">支付金额</label>
                <div class="layui-input-inline">
                    <input type="text" id="payment" name="payment" lay-verify="required|number" autocomplete="off" class="layui-input" value="">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <div class="layui-inline">
                    <label class="layui-form-label">是否需要派人上门维修</label>
                    <div class="layui-input-inline">
                        <select id="status" name="status"  lay-verify="required">
                            <option value="">选择</option>
                            <option value=""${courseInfo.status=="是"?"selected":""}>是</option>
                            <option value=""${courseInfo.status=="否"?"selected":""}>否</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">预约处理时间</label>
                <div class="layui-input-inline">
                    <input id="appointment" name="appointment" lay-verify="required" autocomplete="off" class="layui-input" value="">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">是否需要耗材</label>
                <div class="layui-input-inline">
                    <select id="consumables" name="consumables" >
                        <option value="">选择</option>
                        <option value=""${courseInfo.consumables=="是"?"selected":""}>是</option>
                        <option value=""${courseInfo.consumables=="否"?"selected":""}>否</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input class="layui-btn" type="checkbox"  lay-filter="savebtn"/>
                我已阅读并同意<a style="color: #0000FF">《上门取件服务协议》</a>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="savebtn">确认提交</button>
                <button class="layui-btn layui-btn-primary btn-close">返回</button>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="color:red;">
                <!--错误消息显示-->
                <!--呈现错误信息-->
                <c:forEach items="${allErrors}" var="error">
                    ${error.defaultMessage} &nbsp;&nbsp;
                </c:forEach>
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

        //执行一个laydate实例
        laydate.render({
            elem: '#appointment' //指定元素
        });

//按钮查询
        $('#queryBtn').on('click', function(){
            console.log($('#inputOrderId').val().toString());
            $.ajax({
                type: "post",
                url:'${pageContext.request.contextPath}/workOrder/yesWorkOrderSelect/'+$('#inputOrderId').val().toString(),
                contentType: "application/json;charset=utf-8",
                success:function(result){
                    //请求发送成功后
                    var msgkey =result.msgkey;
                    var message =result.message;
                    $("#workorderid").val(result.data.workorderid);
                    $("#aftersalecardid").val(result.data.aftersalecardid);
                    // $("#questionType").val(result.data.questionType);
                    $("#questionType").find("option[value='result.data.questionType']").attr("selected",true);
                    var select = document.querySelector('#questionType');
                    select.value = result.data.questionType;
                    console.log("select.value"+select.value)
                    $("#question").val(result.data.question);

                    $("#imagePath").val(result.data.imagePath);
                    $("#phone").val(result.data.phone);
                    $("#address").val(result.data.address);
                    $("#paymethod").val(result.data.paymethod);

                    $("#payment").val(result.data.payment);
                    $("#status").val(result.data.status);
                    $("#appointment").val(result.data.appointment);
                    $("#consumables").val(result.data.consumables);

                    if(msgkey=="vailderror"){
                        alert(message);
                    }
                },
            });
        });


        //监听提交
        <%--form.on('submit(savebtn)', function(data) {--%>
        <%--    var form = document.getElementById('courseform');--%>
        <%--    console.log(form+"0---------------");--%>
        <%--    form.action = "${pageContext.request.contextPath}/workOrder/addWorkOrder";--%>
        <%--    form.method = "post";--%>
        <%--    form.submit();--%>
        <%--});--%>

        //监听提交
        form.on('submit(savebtn)', function(data) {
                //layui把表单中的数据封装到data
                var json = JSON.stringify(data.field);
                $(".ajaxerrordiv").html();
                //发起ajax请求
                $.ajax({
                    url:"${pageContext.request.contextPath}/workOrder/addWorkOrder",
                    type:"json",
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
                        if(msgkey=="vailderror"){
                            alert(message);
                            $('#courseform')[0].reset();
                        }
                    },
                    complete:function(XMLHttpRequest,textStatus){
                        //请求发送完成
                    },
                    error:function(XMLHttpRequest,textStatus){
                        //请求发送失败
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