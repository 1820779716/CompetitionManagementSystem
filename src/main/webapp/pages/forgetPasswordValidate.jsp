<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>forgetPasswordValidate</title>
    <link rel="shortcut icon" type="image/x-icon" href="../resources/assets/images/icon-cat.png"/>
</head>
<body>
<%
    String msg = (String) session.getAttribute("msg");
    request.getSession().removeAttribute("msg"); //销毁消息变量,只让它生效一次
    if (msg.equals("resetPwdOK")) {
        out.println("<script>alert('修改密码成功！'); window.location.href='login.jsp';</script>");
    } else if (msg.equals("resetPwdFail")) {
        out.println("<script>alert('修改密码失败！'); window.location.href='forgetPassword.html';</script>");
    } else if (msg.equals("wrongTel")) {
        out.println("<script>alert('手机号错误！'); window.location.href='forgetPassword.html';</script>");
    } else {
        out.println("<script>alert('账号不存在！'); window.location.href='login.jsp';</script>");
    }
%>
</body>
</html>