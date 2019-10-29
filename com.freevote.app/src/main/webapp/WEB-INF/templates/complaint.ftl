<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>投诉</title>
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
        .check1 {
            border: 2px black double;
            text-align: center;
            background-color: white
        }
        .check2 {
            border: 2px greenyellow double;
            text-align: center;
            background-color: white
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-xs12 layui-col-md8">
            <hr />
            <div style="padding: 20px; ">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-about" style="font-size: 16px; color: black;"><b>投诉</b></i>
                            </div>
                            <input id="code" type="hidden" value="${code}">
                            <div class="layui-card-body">
                                <div class="layui-row">
                                    <hr />
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo ">联系手机号：</div>
                                    </div>
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo "><input id="tel" type="text" value="" style="width: 100%" required="required"></div>
                                    </div>
                                    <hr />
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo ">投诉内容：</div>
                                    </div>
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo "><input id="complaintText" type="text" value="" style="width: 100%" required="required"></div>
                                    </div>
                                    <hr />
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo ">投诉建议：</div>
                                    </div>
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <div class="grid-demo "><input id="complaintAdvise" type="text" value="" style="width: 100%" required="required"></div>
                                    </div>
                                    <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
                                        <i class="layui-icon layui-icon-about" style="font-size: 16px; color: black;"><b>注意：投诉成功后,3个工作日内,客服代表将会通过电话/微信等方式与您联络！</b></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 one2" style="background: #fff4f6 linear-gradient(to right, rgba(0,255,0,0), rgba(252,255,234,0.5));text-align:center;position:fixed; left: 0px; bottom: 0px;border-radius:5px 0 0 6px;" onclick="complaint()">
                <div class="grid-demo grid-demo-bg1" style="padding-top: 10px;">
                    <b>投诉</b>
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

    function complaint() {
        var url = "${basePath}/complaint/msg.htm";
        var tel = document.getElementById("tel").value;
        var code = document.getElementById("code").value;
        var complaintText = document.getElementById("complaintText").value;
        var complaintAdvise = document.getElementById("complaintAdvise").value;
        if (tel=="" || complaintText=="" || complaintAdvise =="") {
            layui.use("layer",function(){
                var layer = layui.layer;  //layer初始化
                layer.msg('信息不能为空！');  //此时便可成功
            });
            return;
        }
        $.ajax({
            url:url,
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{'code':code,'tel':tel,'complaintText':complaintText,'complaintAdvise':complaintAdvise},
            dataType : "text",
            success:function (res) {
                var layer = layui.layer;  //layer初始化
                if ("true"==res){
                    layer.msg('投诉成功!');  //此时便可成功
                    setTimeout('WeixinJSBridge.call("closeWindow")', 1500);
                }
                if ("false"==res){
                    layer.msg("请稍后重试!");  //此时便可成功
                }
            },
            error:function (err) {
                layer.open("系统异常,请联系服务号解决。");
            }
        });

    }
</script>
</body>
</html>
