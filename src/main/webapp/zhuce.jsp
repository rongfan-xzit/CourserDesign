<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/18
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <link rel="stylesheet" type="text/css" href="css/regist.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        function checkUserName() {
            var name = document.getElementById("userName").value;
            var spanNode = document.getElementById("name");
            var reg =/^[\u4e00-\u9fa5]{0,}$/i;
            if (reg.test(name))
            {
                //符合规则
                spanNode.innerHTML="".fontcolor("green");
                return true;
            }
            else {
                spanNode.innerHTML="姓名必须是中文".fontcolor("red");
                return false;
            }

        }
        function checkPassword() {
            var password = document.getElementById("pwd").value;
            var enPassword = document.getElementById("pwd1").value;
            var spanNode = document.getElementById("pass");
            var spanNode1 = document.getElementById("pass1");
            if(password==enPassword)
            {
                spanNode.innerHTML="".fontcolor("green");
                spanNode1.innerHTML="".fontcolor("green");
                return true;
            }
            else {
                spanNode.innerHTML="两次密码不一致".fontcolor("red");
                return false;
            }

        }
        function checkAge() {
            var age = document.getElementById("age").value;
            var spanNode = document.getElementById("age1");
            var reg = /^[0-9]*$/i
            if (reg.test(age))
            {
                if(age<130&&age>=18){
                //符合规则
                spanNode.innerHTML="".fontcolor("green");
                return true;
                }
                else {
                    spanNode.innerHTML="年龄要在18-130岁之间".fontcolor("red");
                    return false;
                }
            }
            else {
                spanNode.innerHTML="年龄不合法".fontcolor("red");
                return false;
            }

        }
        function checkPhone() {
            var phone = document.getElementById("phone").value;
            var spanNode = document.getElementById("tel");
            var reg =/^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/i;
            if (reg.test(phone))
            {
                //符合规则
                spanNode.innerHTML="".fontcolor("green");
                return true;
            }
            else {
                spanNode.innerHTML="手机号不合法".fontcolor("red");
                return false;
            }

        }
    </script>
</head>
<body>
<div class="wrapper">
    <article>
        <div class="main" >
            <form action="user/register" method="post">
                <div >
                    <h1>注册</h1>
                </div>
                <div class="userName">
                    <input id="account" type="text" name="account" placeholder="账户" maxlength="15">
                </div>
                <div class="password">
                    <input id="pwd" type="password" name="password" placeholder="密码"><em id="pass1"></em>
                </div>
                <div class="againpwd">
                    <input id="pwd1" type="password" name="password1" placeholder="再次输入密码" onblur="checkPassword();"><span id="pass"></span>
                </div>
                <button>注册</button>
            </form>
        </div>
    </article>
</div>

</body>
</html>

