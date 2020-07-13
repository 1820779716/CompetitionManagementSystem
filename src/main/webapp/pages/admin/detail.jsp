<%--
  Created by IntelliJ IDEA.
  User: Jeff
  Date: 2020/7/7
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*, com.cms.entity.*,  javax.servlet.http.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>赛事详情</title>

    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../assets/css/datepicker3.css" rel="stylesheet">
    <link href="../../assets/css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="../../assets/js/html5shiv.min.js"></script>
    <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
    <style>
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>赛程管理系统</span></a>
            <div id="loginSuccess">
                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span> <span class="caret"></span>
                            <span id="userName"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> 个人资料</a></li>
                            <li class="logout"><a href="#"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div id="noLogin"><a href="../../index.jsp">
                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="../../index.jsp">
                            <span class="glyphicon glyphicon-user"></span> 登录
                        </a>
                    </li>
                </ul>
            </a>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <ul class="nav menu">
        <li><a href="default.jsp"><span class="glyphicon glyphicon-chevron-left"></span> 返回我的赛事 </a></li>
        <li class="active"><a href="#"><span class="glyphicon glyphicon-leaf"></span> 赛事详情 </a></li>
        <li><a href="arrangePlace.jsp"><span class="glyphicon glyphicon-tags"></span> 赛场管理 </a></li>
        <li><a href="uploadOrder.jsp"><span class="glyphicon glyphicon-upload"></span> 上传赛场秩序册 </a></li>
        <li><a href="searchLicense.jsp"><span class="glyphicon glyphicon-file"></span> 查询参赛证 </a></li>
        <li><a href="analysisGrade.jsp"><span class="glyphicon glyphicon-stats"></span> 赛绩分析 </a></li>
        <li role="presentation" class="divider"></li>
    </ul>
    <div class="logout">
        <ul class="nav menu">
            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>
        </ul>
    </div>
    <div id="login">
        <ul class="nav menu">
            <li><a href="../../index.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
    <div class="attribution">Copyright &copy; 2020 陈欢成小组</div>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">赛事详情</li>
        </ol>
    </div><!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12" style="margin-top: 2%;">
                    <div id="publishButton" class="row" style="margin-left: 2%;">
                        <a href="javascript:;" class="file">
                            <span class="glyphicon glyphicon-folder-open"></span>
                            点我发布成绩
                            <input type="file" onchange="importFile(this)"/>
                        </a>
                    </div><!--/.row-->

                    <h1 align="center" id="noEvent"><span class="glyphicon">暂无参赛记录</span></h1>
                    <table class="table" id="myTable"
                           style="margin-top: 2%; margin-bottom: 0; width: 90%; font-size: 16px; text-align: center;">
                        <tr id="trOne" style="font-size: 18px; font-family: 'Microsoft YaHei UI';">
                            <td><b>参赛证号</b></td>
                            <td><b>赛场</b></td>
                            <td><b>监考人员</b></td>
                            <td><b>座位号</b></td>
                            <td><b>姓名</b></td>
                            <td><b>成绩</b></td>
                        </tr>
                        <tr id="trTow" style="font-size: 18px; font-family: 'Microsoft YaHei UI';">
                            <td><b>参赛证号</b></td>
                            <td><b>赛场</b></td>
                            <td><b>监考人员</b></td>
                            <td><b>座位号</b></td>
                            <td><b>团队名</b></td>
                            <td><b>成绩</b></td>
                        </tr>
                    </table>
                    <table class="table" id="page"
                           style="margin-top: 0; width: 90%; font-size: 16px; text-align: center;">
                        <tr>
                            <td>
                                <div style="float: right; font-size: 14px;">
                                    <button name="last" class="btn btn-primary btn-outline-primary">
                                        &lt;上一页
                                    </button>
                                    <input type="text" style="width: 40px;" readonly="readonly" value="1">
                                    <button name="next" class="btn btn-primary btn-outline-primary">
                                        下一页&gt;</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div><!--/.row-->
        </div>
    </div><!--/.row-->
</div><!--/.main-->

<script src="../../assets/js/jquery-1.11.1.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/chart.min.js"></script>
<script src="../../assets/js/chart-data.js"></script>
<script src="../../assets/js/easypiechart.js"></script>
<script src="../../assets/js/easypiechart-data.js"></script>
<script src="../../assets/js/bootstrap-datepicker.js"></script>
<script src="../../assets/js/jquery.cookie.js"></script>
<script src="../../assets/js/xlsx.full.min.js"></script>
<script>

    function importFile(obj) {//导入
        var event = $.cookie("event");
        event = JSON.parse(event);
        if (!obj.files) {
            return;
        }
        var f = obj.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var data = e.target.result;
            var wb = XLSX.read(data, {
                type: 'binary' //以二进制的方式读取
            });
            var sheet0 = wb.Sheets[wb.SheetNames[0]];//sheet0代表excel表格中的第一页
            var excelData = XLSX.utils.sheet_to_json(sheet0);//利用接口实现转换
            console.log(excelData);
            console.log(JSON.stringify(excelData));
            $.ajax({
                url: "http://39.96.59.27:8080/CompetitionManagementSystem/Schedule/publishGrade",
                type: "POST",
                data: {excelData: JSON.stringify(excelData), cid: event.competitionId},
                dataType: "json",
                success: function (result) {
                    alert("成绩发布成功")
                    window.location.reload()
                },
                error:function (result) {
                    alert("成绩发布成功")
                    window.location.reload()
                }
            });
        }
        reader.readAsBinaryString(f);
    }

    function loan() {
        if (sessionStorage.getItem("username") != null) {
            $("#loginSuccess").show()
            $("#noLogin").hide()
            $("#login").hide()
            $(".logout").show()
            $("#userName").html(sessionStorage.getItem("username"));
        } else {
            $("#loginSuccess").hide()
            $("#noLogin").show()
            $(".login").show()
            $("#logout").hide()
        }
        var UserList = [];
        var event = $.cookie("event");
        event = JSON.parse(event)
        document.getElementById("publishButton").style.display = "none";
        $.ajax({
            url: 'http://120.25.255.183:8088/Curriculum/Enlist/getCidEnlist/' + event.competitionId,
            type: "GET",
            headers: {
                "TOKEN": sessionStorage.getItem("TOKEN")
            },
            async: false,
            dataType: "json",
            success: function (result) {
                if (result.code == 0) {
                    if (result.count == 0) {
                        $(".table").hide();
                        $("#noEvent").show();
                    } else {
                        showTable(event)
                        for (var i = 0; i < result.data.length; i++) {
                            var id = result.data[i].competitionId;
                            if (event.type == "1") {
                                addUser(event, result.data[i].userid, result.data[i].teamname);
                            } else if (event.type == "0") {
                                addUser(event, result.data[i].userid, result.data[i].teamname);
                            }
                        }
                    }
                } else if (result.code == 404) {
                }
            }
        });

        function insertLicense(event, user, teamname) {
            $.ajax({
                url: 'http://39.96.59.27:8080/CompetitionManagementSystem/License/insertLicense',
                type: "GET",
                headers: {
                    "TOKEN": sessionStorage.getItem("TOKEN")
                },
                async: false,
                data: {
                    competitorId: user.userid,
                    name: user.username,
                    cname: event.competitionName,
                    teamName: teamname,
                    cid: event.competitionId
                },
                dataType: "json",
                success: function (result) {
                    if (result.flag == "true") {
                    }
                }
            });
        }

        //获取竞赛人员信息
        function addUser(event, id, teamname) {
            $.ajax({
                url: 'http://120.25.255.183:8088/Curriculum/User/getUser/' + id,
                type: "get",
                headers: {
                    "TOKEN": $.cookie("TOKEN")
                },
                async: false,
                dataType: "json",
                success: function (result) {
                    if (result.code == 0) {
                        var user = result.data;
                        UserList.push(user);
                        $.cookie("UserList", JSON.stringify(UserList))
                        insertLicense(event, user, teamname)
                    }
                },
                error: function () {
                    alert("查询失败");
                }
            });
            return;
        };

        getInfomation(event.competitionId)
    }

    //动态现实表格
    function showTable(event) {
        if (event.type == "1") {
            $(".table").show();
            $("#trOne").hide();
            $("#trTow").show();
            $("#noEvent").hide();
        } else {
            $(".table").show();
            $("#trTow").hide();
            $("#trOne").show();
            $("#noEvent").hide();
        }
    }

    window.onload = loan;

    function getInfomation(cid) {
        $.ajax({
            url: "http://39.96.59.27:8080/CompetitionManagementSystem/License/getInformation",
            type: "POST",
            data: {cid: cid},
            dataType: "json",
            aysn: false,
            success: function (result) {
                console.log(result)
                if (result.flag === true) {
                    if (result.data[0].flag === "false") {
                        alert(result.data[1].msg)
                    } else {
                        for (var i = 0; i < result.data.length; i++) {
                            if (result.data[i].grade < 0) {
                                var grade = "未发布";
                                document.getElementById("publishButton").style.display = "";
                            } else {
                                var grade = result.data[i].grade;
                                document.getElementById("publishButton").style.display = "none";
                            }
                            if (result.data[i].teamname != null) {

                                $("#myTable").append("<tr> " +
                                    "<td>" + result.data[i].licenseId + "</td>" +
                                    "<td>" + result.data[i].pname + result.data[i].pnum + "</td>" +
                                    "<td>" + result.data[i].manager + "</td>" +
                                    "<td>" + result.data[i].seat + "</td>" +
                                    "<td>" + result.data[i].name + "</td>" +
                                    "<td>" + grade + "</td>" +
                                    "</tr>"
                                )
                            } else {

                                $("#myTable").append("<tr> " +
                                    "<td>" + result.data[i].licenseId + "</td>" +
                                    "<td>" + result.data[i].pname + result.data[i].pnum + "</td>" +
                                    "<td>" + result.data[i].manager + "</td>" +
                                    "<td>" + result.data[i].seat + "</td>" +
                                    "<td>" + result.data[i].cname + "</td>" +
                                    "<td>" + grade + "</td>" +
                                    "</tr>"
                                )
                            }
                        }
                    }
                }
            }
        });
    }

    // 清除所有的cookie
    function deleteCookie() {
        var cookies = document.cookie.split(";");
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i];
            var eqPos = cookie.indexOf("=");
            var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
            document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
        }
        if (cookies.length > 0) {
            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i];
                var eqPos = cookie.indexOf("=");
                var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
                var domain = location.host.substr(location.host.indexOf('.'));
                document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; domain=" + domain;
            }
        }
    }

    $(".logout").click(function () {
        sessionStorage.clear();
        deleteCookie();
        window.location.href = "../../index.jsp";
    })
</script>

</body>

</html>
