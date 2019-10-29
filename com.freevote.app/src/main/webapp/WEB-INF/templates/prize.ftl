<!DOCTYPE html>
<html>
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
            <input id="code" type="hidden" value="${code}">
            <div  style=" border: 3px #D2B48C double ;background-color: #F5F5F5;text-align:center;position:fixed;right: 5%; top: 0px;border-radius:3px 0 0 4px;z-index: 99999; -moz-border-radius: 15px; -webkit-border-radius: 25px; ">
                <div class="grid-demo" style="padding-top: 2px;" onclick="complaint()">
                    <font size="2"><b>投诉</b></font>
                </div>
            </div>
            <hr />
            <div style="border-top: 1px dashed ;">
                <div class="grid-demo grid-demo-bg1 one3" style="background-color: #F5F5F5;text-align:center;font-size: 16; color: #696969;padding-top: 23px;">
                    活动结束倒计时
                </div>
                <div class="grid-demo grid-demo-bg1 " style="background-color: #F5F5F5;text-align:center;font-size: 16; color: #696969;padding-bottom: 33px;">
                    <span class="layui-badge">${day}天</span>
                    <span class="layui-badge">${hour}时</span>
                    <span class="layui-badge">${min}分</span>
                    <span class="layui-badge">${second}秒</span>
                </div>
            </div>
            <input id="voteCode" type="hidden" value="${vote.voteCode}">
            <hr width=80% size=3 color=#5151A2 style="FILTER: alpha(opacity=100,finishopacity=0,style=3)">
            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <span class="layui-badge-dot"></span>
                                <span class="layui-badge-dot layui-bg-orange"></span>
                                <span class="layui-badge-dot layui-bg-green"></span>
                                <span class="layui-badge-dot layui-bg-cyan"></span>
                                <span class="layui-badge-dot layui-bg-blue"></span>
                                <span class="layui-badge-dot layui-bg-black"></span>
                                <span class="layui-badge-dot layui-bg-gray"></span>
                                <b>活动奖品</b>
                            </div>
                            <div class="layui-card-body">

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
                                    <b>第四名）：${votePrizeFour}</b>
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
            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0.5), rgba(252,252,252,0));text-align:center;position:fixed; left:33.3%; bottom: 0px;border-radius:3px 0 0 4px;" onclick="goPrize()">
                <div class="grid-demo" style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-rate" style="font-size: 20px; color: #9f35ff;"><b>奖品</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" onclick="goBillboard()"style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed;right: 0%; bottom: 0px;border-radius:3px 0 0 4px;">
                <div class="grid-demo" style="padding-top: 10px;">
                    <i class="layui-icon layui-icon-fire" style="font-size: 20px; color: #9f35ff;"><b>榜单</b></i>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['element', 'layer', 'carousel'], function() {
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
        element.on('collapse(test)', function(data) {
            layer.msg('展开状态：' + data.show);
        });
    });
    function goHome() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/voteInfo/"+ voteCode + ".htm?code=" + code;
        location.href = url;
    }
    function goPrize() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/prize/getPrize/"+ voteCode + ".htm?code=" + code;
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
