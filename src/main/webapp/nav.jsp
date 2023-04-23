<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.dg.board.IPlookup" %>
<%
    String username = (String)session.getAttribute("username");
%>
<nav class="navbar navbar-expand-lg bg-light" style="background: linear-gradient(to left, rgb(19, 99, 223), rgb(71, 181, 255));">
    <div class="container-fluid">
        <a class="navbar-brand" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);">메뉴</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/index.jsp">메인페이지</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        게시판
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/am/board.jsp?page=1">익명게시판</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/mb/board.jsp?page=1">멤버게시판</a></li>
                    </ul>
                </li>
            </ul>
            <div class="d-flex" role="search" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);">
                <%
                    if(username == null){
                %>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/signup.jsp">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/login.jsp">로그인</a>
                    </li>
                </ul>
                <%
                }else if(username != null && username.equals("admin")){
                %>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);"><%=username%>님 안녕하세요</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/logout.jsp">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/userlist.jsp">관리자 설정</a>
                    </li>
                </ul>
                <%
                    }else{
                %>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);"><%=username%>님 안녕하세요</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/logout.jsp">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/mypage.jsp">정보 수정</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" style="padding: 7px 8px; color: #fff; text-decoration: none; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" aria-current="page" href="/ac/userdelete.jsp">회원 탈퇴</a>
                    </li>
                </ul>
                <%}%>
            </div>
        </div>
    </div>
</nav>
<style>
    #nav li{
        font-family: 'Noto Sans KR';
        font-style: normal;
        float: right;

        margin: 5px 30px;
        padding: 0;
    }
    #nav li a{
        display: block;
        font-family: 'Noto Sans KR';
        font-style: normal;
        font-size: 100%;

        margin:  0;


    }
</style>