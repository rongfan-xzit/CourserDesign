<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>上传图片凭证</title>
</head>
<body>

<form action="/CourseDeign_war_exploded/workOrder/upinfo" method="post" enctype="multipart/form-data">
    图片： <input type="file"     name = "pictureFile" /><br>
    <input type = "submit" value = "提交" >
</form>

</body>
</html>



