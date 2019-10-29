<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>翰林院后台管理系统</title>
    <#include "manageCommonJS.ftl"/>
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <div class="page-header">
        <nav class="navbar page-header">
            <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
                <i class="fa fa-bars"></i>
            </a>
            <a class="navbar-brand" href="#">
                <img src="${basePath}/static/manage/imgs/logo.png" alt="logo">
            </a>
            <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
                <i class="fa fa-bars"></i>
            </a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="${basePath}/static/manage/imgs/avatar-1.png" class="avatar avatar-sm" alt="logo">
                        <span class="small ml-1 d-md-down-none">徐婧</span>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">

                        <div class="dropdown-header">设置</div>

                        <a href="#" class="dropdown-item">
                            <i class="fa fa-lock"></i> 退出账户
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
    </div>

    <div class="main-container">
        <#include "manage/managePublicInfo.ftl"/>
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-light">
                            排行榜(前十名)
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>用户排名</th>
                                        <th>用户姓名</th>
                                        <th>用户编码</th>
                                        <th>用户票数</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <#list users as u>
                                            <tr>
                                                <td class="text-nowrap">${u_index + 1}</td>
                                                <td class="text-nowrap">${u.userName}</td>
                                                <td>${u.userCode}</td>
                                                <td>${u.userVoteCount}</td>
                                                <td>
                                                    <button class="btn btn-primary" onclick="quick(${u.id},${u.userVoteCount?number + 20})">+ 10 = ${u.userVoteCount?number + 20}</button>
                                                    <button class="btn btn-primary" onclick="quick(${u.id},${u.userVoteCount?number + 196})">+ 98 = ${u.userVoteCount?number + 196}</button>
                                                    <button class="btn btn-primary" onclick="quick(${u.id},${u.userVoteCount?number + 1040})">+ 520 = ${u.userVoteCount?number + 1040}</button>
                                                    <button class="btn btn-primary" onclick="quick(${u.id},${u.userVoteCount?number + 2000})">+ 1000 = ${u.userVoteCount?number + 2000}</button>
                                                    <button class="btn btn-primary" onclick="quick(${u.id},${u.userVoteCount?number + 5776})">+ 2888 = ${u.userVoteCount?number + 5776}</button>
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    function quick(userId,addNums) {
       // alert(userId + "|" + addNums);
        var url = "${basePath}/manage/quick/saveModify.htm";
        $.ajax({
            url:url,
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{'userId':userId,'addNums':addNums,},
            dataType : "text",
            success:function (res) {
                //var jsonObject=eval("("+res+")");
                //alert(jsonObject);
                layui.use("layer",function(){
                    var layer = layui.layer;  //layer初始化
                    if ("true"==res){
                        layer.msg("投票成功!页面自动刷新中.....请勿重复点击！");  //此时便可成功
                        setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.reload();//页面刷新
                        },1000);
                    }
                    if ("false"==res){
                        layer.msg("投票失败,请重试!页面自动刷新中.....请勿重复点击！");  //此时便可成功
                        setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.reload();//页面刷新
                        },1000);
                    }
                });
            },
            error:function (err) {
                layer.open("系统异常！");
            }
        });

    }
</script>
</body>
</html>
