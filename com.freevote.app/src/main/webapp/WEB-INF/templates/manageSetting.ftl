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
                        <img src="${basePath}/vote/static/manage/imgs/avatar-1.png" class="avatar avatar-sm" alt="logo">
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
                            活动总览
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>活动地址</th>
                                        <th>标题</th>
                                        <th>禁启用</th>
                                        <th>参与数</th>
                                        <th>累计投票</th>
                                        <th>浏览量</th>
                                        <th>倒计时</th>
                                        <th>编辑</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <#list votes as v>
                                            <tr>
                                                <#--<td>${v.id}</td>-->
                                                <td>
                                                    <#--<div style="width: 100px;height: 350px;">-->
                                                        <#--<img style="height: 100%;height: 100%" src="${v.voteUrl}" alt="Image" >-->
                                                    <#--</div>-->
                                                        ${v.voteUrl}
                                                </td>
                                                <td class="text-nowrap">${v.voteTittle}</td>
                                                <td>
                                                    <#if v.deleted=="F">
                                                    开启
                                                    <#elseIf v.deleted=="T">
                                                    结束
                                                    </#if>
                                                </td>
                                                <td>${v.voteUsersNum}</td>
                                                <td>${v.voteCount}</td>
                                                <td>${v.pvCount}</td>
                                                <td>${v.voteCountDown}</td>
                                                <td><button class="btn btn-primary">
                                                    <a href="${basePath}/manage/setting/modifyVote/${v.voteCode}.htm"> 修改 </a>
                                                    </button>-<button class="btn btn-primary" onclick="deleteVote(${v.voteCode})">
                                                    禁/启用
                                                </button>-<button class="btn btn-primary">
                                                        <a href="${basePath}/manage/setting/modify/getUsers/${v.voteCode}.htm"> 详情设置 </a>
                                                    </button>-<button class="btn btn-primary">
                                                    <a href="${basePath}/manage/setting/addUser/${v.voteCode}.htm"> 详情新增 </a>
                                                </button>
                                                </td><#--${v.voteCode}-->
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
    function deleteVote(voteCode) {
        var url = "${basePath}/manage/setting/modify/" + voteCode + ".htm";
        $.ajax({
            url:url,
            type:'GET',
            contentType : "application/x-www-form-urlencoded",
            data:{'voteCode':voteCode},
            dataType : "text",
            success:function (res) {
                layui.use("layer",function(){
                    var layer = layui.layer;  //layer初始化
                    layer.msg(res);  //此时便可成功
                });
                location.reload();
            },
            error:function (err) {
                layer.open("系统异常！");
            }
        });
    }
</script>
</body>
</html>
