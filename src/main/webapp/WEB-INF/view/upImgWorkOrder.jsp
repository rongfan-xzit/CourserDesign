<%--<form class="layui-form" action="" id="courseform" enctype="multipart/form-data">--%>
<%--    <div class="layui-form-item">--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-inline">--%>
<%--                <label class="layui-form-label">问题描述图片</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="file" name="imagePath"  autocomplete="off" class="layui-input" value="1" value="">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-form-item">--%>
<%--        <div class="layui-input-block">--%>
<%--            &lt;%&ndash;            <button class="layui-btn" lay-submit="" lay-filter="savebtn">保存</button>&ndash;%&gt;--%>
<%--            <button class="layui-btn" lay-submit="" lay-filter="ajaxsavebtn">保存(ajax)</button>--%>
<%--            &lt;%&ndash;            <button class="layui-btn layui-btn-primary btn-close">关闭</button>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>

<%--</form>--%>

<!DOCTYPE html>
 <html>
 <head>
             <meta charset="utf-8" />
             <title>图片上传</title>
         </head>
     <body>
        <h2>图片上传</h2>
     <form action="workOrder/upinfo" method="post" enctype="multipart/form-data">
         图片:<input type="file"  name="upload"/><br/>
         <input type="submit" value="提交"/>
        </form>
    </body>
 </html>

<script>


</script>



