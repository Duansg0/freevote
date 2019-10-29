<!DOCTYPE html>
<html>
<#assign basePath = request.contextPath />
<head>
    <meta charset="utf-8">
    <title>${vote.voteTittle}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath}/static/layui/css/layui.css" media="all">
    <script src="${basePath}/static/layui/layui.js" charset="utf-8"></script>
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/static/js/jquery.min.js"></script>
    <script src="${basePath}/static/js/bootstrap.min.js"></script>
    <style type="text/css">
        .one1 {
            height: 400px;

        }

        .one2 {
            height: 50px;
        }

        .one3 {
            height: 50px;
        }

        .one4 {
            height: 30px;
        }

        .img-responsive {
            height: 100%;
            width: 100%;
        }

        .vote {
            border-radius: 50%
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-xs12 layui-col-md8">
            <div  style=" border: 3px #D2B48C double ;background-color: #F5F5F5;text-align:center;position:fixed;right: 5%; top: 0px;border-radius:3px 0 0 4px;z-index: 99999; -moz-border-radius: 15px; -webkit-border-radius: 25px; ">
                <div class="grid-demo" style="padding-top: 2px;" onclick="complaint()">
                    <font size="2"><b>投诉</b></font>
                </div>
            </div>
            <!-- <div class="grid-demo grid-demo-bg1">
          <div class="layui-carousel" id="test1">
                   <div carousel-item>
                     <div><img src="img/2-cropped.jpg"></div>
                     <div><img src="img/2-cropped.jpg"></div>
                     <div><img src="img/2-cropped.jpg"></div>
                     <div><img src="img/2-cropped.jpg"></div>
                     <div><img src="img/2-cropped.jpg"></div>
                   </div>
          </div>
      </div> -->
            <input id="voteCode" type="hidden" value="${vote.voteCode}">
            <input id="code" type="hidden" value="${code}">
            <div class="grid-demo grid-demo-bg1 one1">
                <img src="${basePath}${voteImg}" style="height: 100%;width: 100%;" />
            </div>
            <div class="layui-col-xs4 one2" style="background-color: #F5F5F5;text-align:center;border-radius:3px 0 0 4px;">
                <div class="grid-demo grid-demo-bg1" style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-user" style="font-size: 10; color: #696969;"><b>已报名[${vote.voteUsersNum}]</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background-color: #F5F5F5;text-align:center;border-radius:0 0 0 0;">
                <div class="grid-demo" style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-praise" style="font-size: 10; color: #696969;"><b>投票数[9999+]</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background-color: #F5F5F5;text-align:center;border-radius:0 5px 6px 0;">
                <div class="grid-demo"style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-star" style="font-size: 10; color: #696969;"><b>访问量[999+]</b></i>
                </div>
            </div>
            <hr />
            <div style="border-top: 1px dashed ;">

                <div class="grid-demo grid-demo-bg1 " style="background-color: #F5F5F5;text-align:center;font-size: 16; color: #696969;padding-bottom: 33px;">
                     <#if msg=="">
                         <div class="grid-demo grid-demo-bg1 one3" style="background-color: #F5F5F5;text-align:center;font-size: 16; color: #696969;padding-top: 23px;">
                             活动结束倒计时
                         </div>
                     <span class="layui-badge">${day}天</span>
                         <span class="layui-badge">${hour}时</span>
                         <span class="layui-badge">${min}分</span>
                         <span class="layui-badge">${second}秒</span>
                     <#else>
                         <div class="grid-demo grid-demo-bg1 one3" style="background-color: #F5F5F5;text-align:center;font-size: 16; color: #696969;padding-top: 23px;">
                             <span class="layui-badge">活动已结束</span>
                         </div>
                     </#if>
                </div>
            </div>
            <hr width=80% size=3 color=#5151A2 style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
            <div class="layui-col-xs6">
                <div class="grid-demo grid-demo-bg1">
                    <input id="searchUser" type="username" name="username" required lay-verify="required" placeholder="请输入编号或者姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-col-xs6" onclick="search()">
                <div class="grid-demo"><button type="reset" class="layui-btn layui-btn-radius layui-btn-warm ">
                    <i class="layui-icon layui-icon-search" style="font-size: 25px; color: black;"></i>
                    &nbsp;&nbsp;<font color="black" >搜索</font></button></div>
            </div>
            <hr width=0% size=3 color=#5151A2 style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
            <#list users as u>
             <div class="layui-col-xs6" style="border: 9px #FFFFFF double;box-shadow:#E0E0E0 0px 0px 5px">
                 <div style="border: 3px black ;position:absolute;border-radius: 0 0 6px 5px">
                     <span class="layui-badge">${u.userCode}号</span>
                     <span class="layui-badge layui-bg-gray"><b>${u.userVoteCount}票</b></span>
                 </div>
                 <img src="${basePath}${u.userImgUrl}" class="img-responsive" onclick="voteAdd(${u.userCode})"/>
                 <div style="position:absolute;position:absolute;bottom: 1px;">
                     <span class="layui-badge layui-bg-blue">${u.userName}</span>
                 </div>
                 <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; " onclick="voteAdd(${u.userCode})">
                     <div class="layui-anim layui-anim-up " style="border: 3px red bisque;">
                         <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" ><i class="layui-icon layui-icon-praise"><b>投票</b></i>
                         </button>
                     </div>
                 </div>
             </div>
            </#list>
            <div style="text-align: center">
                (每次随机展示20个哦)
            </div>
            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-note" style="font-size: 16px; color: black;"><b>活动规则</b></i>
                            </div>
                            <div class="layui-card-body">
                                <span class="layui-badge-dot"></span>
                                <span class="layui-badge-dot layui-bg-orange"></span>
                                <span class="layui-badge-dot layui-bg-green"></span>
                                <span class="layui-badge-dot layui-bg-cyan"></span>
                                <span class="layui-badge-dot layui-bg-blue"></span>
                                <span class="layui-badge-dot layui-bg-black"></span>
                                <span class="layui-badge-dot layui-bg-gray"></span>
                                <b>活动简介</b>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>${voteProfile}</b>
                                </p>
                            </div>
                            <div class="layui-card-body">
                                <span class="layui-badge-dot"></span>
                                <span class="layui-badge-dot layui-bg-orange"></span>
                                <span class="layui-badge-dot layui-bg-green"></span>
                                <span class="layui-badge-dot layui-bg-cyan"></span>
                                <span class="layui-badge-dot layui-bg-blue"></span>
                                <span class="layui-badge-dot layui-bg-black"></span>
                                <span class="layui-badge-dot layui-bg-gray"></span>
                                <b>活动规则</b>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>一）：${voteRuleOne}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>二）：${voteRuleTwo}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>三）：${voteRuleThree}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>四）：${voteRuleFour}</b>
                                </p>
                                <hr />
                            </div>
                            <div class="layui-card-body">
                                <span class="layui-badge-dot"></span>
                                <span class="layui-badge-dot layui-bg-orange"></span>
                                <span class="layui-badge-dot layui-bg-green"></span>
                                <span class="layui-badge-dot layui-bg-cyan"></span>
                                <span class="layui-badge-dot layui-bg-blue"></span>
                                <span class="layui-badge-dot layui-bg-black"></span>
                                <span class="layui-badge-dot layui-bg-gray"></span>
                                <b>活动奖品</b>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>第一名）：${votePrizeOne}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>第二名）：${votePrizeTwo}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>第三名）：${votePrizeThree}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>第四、五名）：${votePrizeFour}</b>
                                </p>
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed; left: 0px; bottom: 0px;border-radius:5px 0 0 6px;" onclick="goHome()">
                <div class="grid-demo grid-demo-bg1" style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-home" style="font-size: 20px; color: #9f35ff;"><b>首页</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed; left:33.3%; bottom: 0px;border-radius:3px 0 0 4px;" onclick="goPrize()">
                <div class="grid-demo" style="padding-top: 10px; color: #40ffb7;">
                    <i class="layui-icon layui-icon-rate" style="font-size: 20px; color: #9f35ff;"><b>奖品</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" onclick="goBillboard()"style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed;right: 0%; bottom: 0px;border-radius:3px 0 0 4px;">
                <div class="grid-demo" style="padding-top: 10px; color: #40ffb7;">
                    <i class="layui-icon layui-icon-fire" style="font-size: 20px; color: #9f35ff;"><b>榜单</b></i>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    layui.use(['element', 'layer','carousel'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '100%' //设置容器宽度
            ,
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
        //监听折叠
        element.on('collapse(test)', function(data){
            layer.msg('展开状态：'+ data.show);
        });
    });
    function search(){
        var userInfo = document.getElementById("searchUser").value;
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/voteInfo/"+ voteCode + "/" + userInfo +  ".htm?code=" + code;
        location.href = url;
    }

    function voteAdd(userCode){
        var voteCode = document.getElementById("voteCode").value;
       // var code = document.getElementById("code").value;
        var url = "${basePath}/handler/voteAdd/"+ voteCode + "/" + userCode +  ".htm";
        location.href = url;
        // var code = document.getElementById("code").value;
        // if(typeof code == "undefined" || code == null || code == ""){
        //     var url = document.getElementById("url").value;
        //     location.href = url;
        // }else{
        //
        // }
    }
    function goHome() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/voteInfo/"+ voteCode +  ".htm?code=" + code;
        location.href = url;
    }
    function goPrize() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/prize/getPrize/"+ voteCode +  ".htm?code=" + code;
        location.href = url;
    }
    function goBillboard() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/billboard/getBillboard/"+ voteCode + ".htm?code=" + code;
        location.href = url;
    }
    function complaint() {
        var url = "${basePath}/complaint/index.htm";
        location.href = url;
    }

</script>
</body>
</html>
