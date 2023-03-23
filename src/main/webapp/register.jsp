<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎注册</title>
    <link href="css/register.css" rel="stylesheet">
</head>
<body>

<div class="form-div">
    <div class="reg-content">
        <h1>欢迎注册</h1>
        <span>已有帐号？</span> <a href="login.html">登录</a>
    </div>
    <form id="reg-form" action="/brand-demo/registerServlet" method="post">

        <table>

            <tr>
                <td>用户名</td>
                <td class="inputs">
                    <input name="username" type="text" id="username">
                    <br>
                    <span id="username_err" class="err_msg" >${register_msg}</span>
                </td>

            </tr>

            <tr>
                <td>密码</td>
                <td class="inputs">
                    <input name="password" type="password" id="password">
                    <br>
                    <span id="password_err" class="err_msg" style="display: none">密码格式有误</span>
                </td>
            </tr>


            <tr>
                <td>验证码</td>
                <td class="inputs">
                    <input name="checkCode" type="text" id="checkCode">
                    <%-- 图片的src输出流来自于/brand-demo/checkCodeServelet中的response  --%>
                    <img id="checkCodeImg" src="/brand-demo/checkCodeServlet">
                    <a href="#" id="changeImg" >看不清？</a>
                </td>
            </tr>

        </table>

        <div class="buttons">
            <input value="注 册" type="submit" id="reg_btn">
        </div>
        <br class="clear">
    </form>

</div>

<script>
    // 设置单机事件
    document.getElementById("changeImg").onclick = function () {
        // 在请求地址后面加上随机数，这样浏览器就会认为这是不一样的请求的，达到点击刷新验证码的目的，避免浏览器缓存
        // 相当于每点击一下 重新生成一次生成验证码的相应 checkCodeServlet
        // 可以复制以下url体验以下
        // http://localhost:8080/brand-demo/checkCodeServlet   如果浏览器不关闭缓存，那可能每次可能都是得到相同的图片
        // http://localhost:8080/brand-demo/checkCodeServlet?2131231231   问号后面的数字可以随意更换，每更换一次就刷新一次图片
        document.getElementById("checkCodeImg").src = "/brand-demo/checkCodeServlet?"+new Date().getMilliseconds();
    }

</script>
</body>
</html>