<!doctype html>
<html lang="en">
<#assign basePath = request.contextPath />
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-light">
                                新增
                            </div>
                            <div class="card-body">
                                <form action="${basePath}/manage/setting/saveVote.htm" method="post" enctype="multipart/form-data">
                                    <div class="row">

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="normal-input" class="form-control-label">标题</label>
                                                <input id="normal-input" class="form-control" value="" name="voteTittle">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="read-only" class="form-control-label">活动地址</label>
                                                <input id="read-only" class="form-control" value="自动生成" name="voteUrl" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="placeholder-input" class="form-control-label">封面图片</label>
                                                <input type="file" required="required" name="pic" id="exampleInputFile">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">参与数</label>
                                                <input id="required-input" class="form-control" value="" name="voteUsersNum">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">累计投票</label>
                                                <input id="required-input" class="form-control" value="" name="voteCount">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">访问量</label>
                                                <input id="required-input" class="form-control" value="" name="pvCount">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">活动简介</label>
                                                <input id="required-input" class="form-control" value="" name="voteProfile">
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">活动规则</label>
                                                <input id="required-input" class="form-control" value="" name="voteRule">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="required-input" class="require">活动奖品</label>
                                                <input id="required-input" class="form-control" value="" name="votePrize">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-12">
                                        <div class="col-md-12">
                                            <input type="submit" value="提交">
                                        </div>
                                    </div>
                                </form>
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
