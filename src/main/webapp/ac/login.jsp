<%--
  Created by IntelliJ IDEA.
  User: KRKimwoo
  Date: 2022-05-18
  Time: 오후 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrap">
    <div class="login">
        <h2>Login</h2>
        <form action="loginproc.jsp">
            <div class="login_id">
                <h4>Username</h4>
                <input type="text" name="username" id="username" placeholder="Username">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="password" id="password" placeholder="Password">
            </div>
            <div class="submit">
                <input type="submit" value="로그인">
            </div>
        </form>
    </div>
</div>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Noto Sans KR", sans-serif;
    }

    a {
        text-decoration: none;
        color: black;
    }

    li {
        list-style: none;
    }

    .wrap {
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.1);
    }

    .login {
        width: 30%;
        height: 600px;
        background: white;
        border-radius: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    h2 {
        color: turquoise;
        font-size: 2em;
    }


    .login_id {
        margin-top: 20px;
        width: 100%;
    }

    .login_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .login_pw {
        margin-top: 20px;
        width: 100%;
    }

    .login_pw input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .submit {
        margin-top: 50px;
        width: 80%;
    }
    .submit input {
        width: 100%;
        height: 50px;
        border: 0;
        outline: none;
        border-radius: 40px;
        background: linear-gradient(to left, rgb(168, 213, 212), rgb(78, 138, 186));
        color: white;
        font-size: 1.2em;
        letter-spacing: 2px;
    }

</style>
</body>
</html>
