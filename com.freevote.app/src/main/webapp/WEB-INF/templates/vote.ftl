<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${vote.voteTittle}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath}/static/layui/css/layui.css" media="all">
    <script src="${basePath}/static/layui/layui.js" charset="utf-8"></script>
    <link href="${basePath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${basePath}/static/js/jquery.min.js"></script>
    <script src="${basePath}/static/js/bootstrap.min.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
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
            <input id="code" type="hidden" value="${code}">
            <input id="voteCode" type="hidden" value="${user.voteCode}">
            <input id="userCode" type="hidden" value="${user.userCode}">
            <div class="layui-col-xs12 one2" style="background-color: #F5F5F5;text-align:center;border-radius:3px 0 0 4px;padding-top: 13px;">
                <div class="grid-demo grid-demo-bg1">
                    <i class="layui-icon layui-icon-user" style="font-size: 14; color: #696969;"><b>${user.userName}</b></i>
                </div>
            </div>
            <hr />
            <div class="layui-col-xs6 one2" style="background-color: #F5F5F5;text-align:center;border-radius:3px 0 0 4px;">
                <div class="grid-demo grid-demo-bg1">
                    <i class="layui-icon layui-icon-user" style="font-size: 14; color: #696969;">编号[${user.userCode}]</i>
                </div>
            </div>
            <div class="layui-col-xs6 one2" style="background-color: #F5F5F5;text-align:center;border-radius:0 0 0 0;">
                <div class="grid-demo">
                    <i class="layui-icon layui-icon-praise" style="font-size: 14; color: #696969;">票数[${user.userVoteCount}]</i>
                </div>
            </div>
            <hr />
            <div class="layui-col-xs12" style="border: 9px #FFFFFF double;">
                <img src="${user.userImgUrl}" class="img-responsive" />
            </div>
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
                                <b>个人资料</b>
                            </div>
                            <div class="layui-card-body">
                                <hr />
                                <p style="text-indent:30px">
                                    <b>座右铭：${userDecOne}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>星座：${userDecTwo}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>爱好：${userDecThree}</b>
                                </p>
                                <hr />
                                <p style="text-indent:30px">
                                    <b>活动宣言：${userDecFour}</b>
                                </p>
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed; left: 0px; bottom: 0px;border-radius:5px 0 0 6px;" onclick="goHome()">
                <div class="grid-demo grid-demo-bg1" style="padding-top: 10px;" >
                    <i class="layui-icon layui-icon-home" style="font-size: 20px; color: #9f35ff;"><b>回到首页</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0.5), rgba(252,252,252,0));text-align:center;position:fixed; left:33.3%; bottom: 0px;border-radius:3px 0 0 4px;" onclick="voteAddNum(${user.userCode})">
                <div class="grid-demo" style="padding-top: 10px;" >
                    <i class="layui-icon layui-icon-praise" style="font-size: 20px; color: #9f35ff;"><b>投票</b></i>
                </div>
            </div>
            <div class="layui-col-xs4 one2" style="background: #fcfcfc linear-gradient(to right, rgba(252,252,252,0), rgba(252,252,252,0.5));text-align:center;position:fixed;right: 0%; bottom: 0px;border-radius:3px 0 0 4px;" onclick="showPrize(${user.userCode})">
                <div class="grid-demo" style="padding-top: 10px;" >
                    <i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #9f35ff;"><b>礼物</b></i>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        var voteCode = document.getElementById("voteCode").value;
        var userCode = document.getElementById("userCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/config/get.htm";
       // var localUrl =  "${basePath}/handler/voteAdd/" + voteCode + "/" + userCode + ".htm?code=" + code;
        var localUrl = location.href.split('#').toString();//url不能写死
        //alert(localUrl);
        $.ajax({
            type : "post",
            url : url,
            contentType : "application/x-www-form-urlencoded",
            dataType : "text",
            async : false,
            data:{'localUrl':localUrl},
            success : function(data) {
                var info =eval("("+data+")");
                wx.config({
                    debug: false,////生产环境需要关闭debug模式
                    appId: info.appid,//appId通过微信服务号后台查看
                    timestamp: info.timestamp,//生成签名的时间戳
                    nonceStr: info.nonceStr,//生成签名的随机字符串
                    signature: info.signature,//签名
                    jsApiList: [//需要调用的JS接口列表
                        'checkJsApi',//判断当前客户端版本是否支持指定JS接口
                        'onMenuShareTimeline',//分享给好友
                        'onMenuShareAppMessage'//分享到朋友圈
                    ]
                });
            },
            error: function(xhr, status, error) {
                //alert(status);
                //alert(xhr.responseText);
            }
        })
    });
    wx.ready(function () {
        var link = window.location.href;
        var protocol = window.location.protocol;
        var host = window.location.host;
        //分享朋友圈
        wx.onMenuShareTimeline({
            title: '我是${user.userName},编号${user.userCode}',
            link: link,
            imgUrl: '${imgUrl}',// 自定义图标
            trigger: function (res) {
                // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回.
                //alert('click shared');
            },
            success: function (res) {
                //alert('shared success');
                //some thing you should do
            },
            cancel: function (res) {
                //alert('shared cancle');
            },
            fail: function (res) {
                //alert(JSON.stringify(res));
            }
        });
        //分享给好友
        wx.onMenuShareAppMessage({
            title: '我是${user.userName},编号${user.userCode}', // 分享标题
            desc: '我正在参加评选活动,请大家帮我投上宝贵的一票吧！', // 分享描述
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: '${imgUrl}', // 自定义图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.error(function (res) {
            alert(res.errMsg);
        });
    });
    layui.use('carousel', function() {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1',
            width: '100%' //设置容器宽度
            ,
            arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
    function goHome() {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/voteInfo/"+ voteCode +  ".htm?code=" + code;
        location.href = url;
    }
    function voteAddNum(userCode) {
        var code = document.getElementById("code").value;
        var voteCode = document.getElementById("voteCode").value;
        var url = "${basePath}/handler/voteAddNum.htm";
        $.ajax({
            url:url,
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{'userCode':userCode,'voteCode':voteCode,'code':code},
            dataType : "text",
            success:function (res) {
                layui.use("layer",function(){
                    var layer = layui.layer;  //layer初始化
                    if ("true"==res){
                        layer.msg("投票成功!");  //此时便可成功
                            setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                                window.location.reload();//页面刷新
                            },1000);
                    }
                    if ("false"==res){
                        layer.msg("您每天只能投一票,记得明天来在哦!");  //此时便可成功
                    }
                    if ("TYPE"==res){
                        layer.msg("当前投票用户过多,请刷新后重试!");  //此时便可成功
                    }
                    if ("Surprised"==res){
                        layer.msg("当前投票用户过多,请刷新后重试!");  //此时便可成功
                    }
                    if ("close"==res){
                        layer.msg("活动已结束!");  //此时便可成功
                    }

                });
            },
            error:function (err) {
                layer.open("系统异常！");
            }
        });
    }
    function showPrize(userCode) {
        var voteCode = document.getElementById("voteCode").value;
        var code = document.getElementById("code").value;
        var url = "${basePath}/money/getMoney/"+ voteCode + "/" + userCode + ".htm?code=" + code;
        location.href = url;
    }
    function complaint() {
        var url = "${basePath}/complaint/index.htm";
        location.href = url;
    }
</script>
</body>
</html>
