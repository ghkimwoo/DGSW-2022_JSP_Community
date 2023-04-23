<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrap">
    <div class="login">
        <h2>Sign Up</h2>
        <form action="signupproc.jsp">
            <div class="register_id">
                <h4>Username</h4>
                <input type="text" name="username" id="username" placeholder="Username">
            </div>
            <div class="register_pw">
                <h4>Password</h4>
                <input type="password" name="password" id="password" placeholder="Password">
            </div>
            <div class="register_gender">
                <h4>Gender</h4>
                <label class="box-radio-input"><input type="radio" name="gender" value="남" checked="checked"><span>남자</span></label>
                <label class="box-radio-input"><input type="radio" name="gender" value="여"><span>여자</span></label>
            </div>
            <div class="submit">
                <input type="submit" value="저장">
            </div>
        </form>
    </div>
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


    .register_id {
        margin-top: 20px;
        width: 100%;
    }

    .register_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }

    .register_pw {
        margin-top: 20px;
        width: 100%;
    }

    .register_pw input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
    }
    .register_gender {
        margin-top: 20px;
        width: 100%;
    }

    .box-radio-input input[type="radio"]{
        display:none;
    }

    .box-radio-input input[type="radio"] + span{
        display:inline-block;
        background:none;
        border:1px solid #dfdfdf;
        padding:0px 10px;
        text-align:center;
        height:35px;
        line-height:33px;
        font-weight:500;
        cursor:pointer;
    }

    .box-radio-input input[type="radio"]:checked + span{
        border:1px solid #23a3a7;
        background:#23a3a7;
        color:#fff;
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