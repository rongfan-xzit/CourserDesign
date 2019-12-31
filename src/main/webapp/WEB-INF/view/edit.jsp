<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加员工信息</title>
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
        <legend>员工信息信息</legend>
    </fieldset>

    <form class="layui-form" action="" id="courseform">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">员工编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="kch" lay-verify="required" autocomplete="off" class="layui-input" value="${staff.workId}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">员工类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="kcm" lay-verify="required" autocomplete="off" class="layui-input" value="${staff.type}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">员工姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="kxh" lay-verify="required|number" autocomplete="off" class="layui-input" value="1" value="${staff.name}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="text" name="kxh" lay-verify="required|number" autocomplete="off" class="layui-input" value="1" value="${staff.phone}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">授课老师</label>
                <div class="layui-input-inline">
                    <input type="text" name="skls" lay-verify="required" autocomplete="off" class="layui-input" value="${courseInfo.skls}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">教师职称</label>
                <div class="layui-input-inline">
                    <input type="text" name="lszc" lay-verify="required" autocomplete="off" class="layui-input" value="${courseInfo.lszc}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">课程属性</label>
                <div class="layui-input-inline">
                    <input type="text" name="kcsx" lay-verify="required" placeholder="填写专业必修|选修|校任选" autocomplete="off" class="layui-input" value="${courseInfo.kcsx}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">授课班级</label>
                <div class="layui-input-inline" style="width:520px;">
                    <input type="tel" name="bjmc" lay-verify="" autocomplete="off" class="layui-input" value="${courseInfo.bjmc}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">选课人数</label>
                <div class="layui-input-inline">
                    <input type="text" name="xkrs" lay-verify="required|number" autocomplete="off" class="layui-input" value="${courseInfo.xkrs}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">总学时</label>
                <div class="layui-input-inline">
                    <input type="text" name="zxs" lay-verify="required|number" autocomplete="off" class="layui-input" value="${courseInfo.zxs}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">授课学时</label>
                <div class="layui-input-inline">
                    <input type="text" name="skxs" lay-verify="number" autocomplete="off" class="layui-input" value="${courseInfo.skxs}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">实践学时</label>
                <div class="layui-input-inline">
                    <input type="text" name="sjxs" lay-verify="number" autocomplete="off" class="layui-input" value="${courseInfo.sjxs}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">实验学时</label>
                <div class="layui-input-inline">
                    <input type="text" name="syxs" lay-verify="number" autocomplete="off" class="layui-input" value="${courseInfo.syxs}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">学分</label>
                <div class="layui-input-inline">
                    <input type="text" name="xf" lay-verify="required|number" autocomplete="off" class="layui-input" value="${courseInfo.xf}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                    <select name="bz">
                        <option value="">无(不填写)</option>
                        <optgroup label="实践类课程类">
                            <option value="实习实训">实习实训</option>
                            <option value="学年论文">学年论文</option>
                            <option value="课程设计">课程设计</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">课程类型1</label>
                <div class="layui-input-inline">
                    <select name="kclx1">
                        <option value="">无(不填写)</option>
                        <optgroup label="网络、双语、计算机公共基础课类">
                            <option value="网络自主学习课">网络自主学习课</option>
                            <option value="双语课">双语课</option>
                            <option value="计算机公共基础课">计算机公共基础课</option>
                        </optgroup>
                        <optgroup label="实习实训类">
                            <option value="校内实习(实训)">校内实习(实训)</option>
                            <option value="校内金工实习">校内金工实习</option>
                            <option value="校内数控实习">校内数控实习</option>
                            <option value="校外集中实训(校企合作)">校外集中实训(校企合作)</option>
                            <option value="校外集中实习(市内)">校外集中实习(市内)</option>
                            <option value="校外集中实习(市外)">校外集中实习(市外)</option>
                            <option value="校外分散实习">校外分散实习</option>
                            <option value="寒暑假社会实践">寒暑假社会实践</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">课程类型2</label>
                <div class="layui-input-inline">
                    <select name="kclx2">
                        <option value="">无(不填写)</option>
                        <option value="艺术类课">艺术类课</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="savebtn">保存</button>
                <button class="layui-btn" lay-submit="" lay-filter="ajaxsavebtn">保存(ajax)</button>
                <button class="layui-btn layui-btn-primary btn-close">关闭</button>
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
                    url:"${pageContext.request.contextPath}/courseinfo/ajaxvalid",
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
                        if(msgkey=="validerror"){
                            //验证失败
                            //对json数组进行遍历
                            var errorMsg="";
                            $.each(result.data,function (index,value) {
                                errorMsg+= value.defaultMessage;
                            });
                          $(".ajaxerrordiv").html(errorMsg);
                        }else{
                            //成功后
                            // 关闭当前窗体
                            alert("提交成功");
                            progressClose();
                            //数据表格reload
                            //window.parent.location.reload();
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