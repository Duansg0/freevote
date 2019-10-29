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
                            用户总览
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <#--<th>主键</th>-->
                                        <th>用户姓名</th>
                                        <th>用户照片</th>
                                        <th>用户编码</th>
                                        <th>用户票数</th>
                                        <th>投票编码</th>
                                        <th>用户描述</th>
                                        <th>编辑</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <#list users as u>
                                        <tr>
                                            <td class="text-nowrap">${u.userName}</td>
                                            <td>
                                                <div style="width: 200px;height: 350px;">
                                                    <img style="height: 100%;height: 100%" src="${u.userImgUrl}" alt="Image" >
                                                </div>
                                            </td>
                                            <td>${u.userCode}</td>
                                            <td>${u.userVoteCount}</td>
                                            <td>${u.voteCode}</td>
                                            <td>******</td>
                                            <td><button class="btn btn-primary"><a href="${basePath}/manage/setting/modifyUser/${u.id}.htm">修改</a></button></td><#--${v.voteCode}-->
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
</body>
</html>
