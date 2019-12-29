<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Purple_loginform Website Template | Home :: w3layouts</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- -->
<%--    <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++)--%>
<%--    {if ( __links[i].getAttribute('data-t') == '_blank' ) --%>
<%--    { __links[i].addEventListener('click', __linkClick, false);}}</script>--%>
    <script src="js/jquery.min.js"></script>
<%--    <script>$(document).ready(function(c) {--%>
<%--        $('.alert-close').on('click', function(c){--%>
<%--            $('.message').fadeOut('slow', function(c){--%>
<%--                $('.message').remove();--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--    </script>--%>
</script>
</head>
<body>
<script type="text/css">
    #dv{
        width: 120px;
        height: 50px;
        background-color: #5B395C;
    }
</script>
<!-- contact-form -->
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1>Login Form</h1>
            <div class="alert-close"> </div>
        </div>
        <form action="user/login" method="post">
            <li>
                <input type="text"  id="account" name="account" class="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}"><a href="#" class=" icon user"></a>
            </li>
            <div class="clear"> </div>
            <li>
                <input type="password" id="password" name="password"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
            </li>
            <div class="clear"> </div>
            <div  class="submit">
                <input type="submit"  value="登录" />
                <button style="width: 120px;height: 58px;background-color: #5B395C; border-radius: 15px;margin-top: -2px" ><a style="color: #FFFFFF" href="zhuce.jsp">注册</a></button>
            </div>
        </form>
    </div>
</div>
</div>
<div class="clear"> </div>
<!--- footer --->
</body>
</html>