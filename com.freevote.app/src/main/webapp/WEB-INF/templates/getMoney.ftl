<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>礼物充值</title>
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
            <div  style=" border: 3px #D2B48C double ;background-color: #F5F5F5;text-align:center;position:fixed;right: 5%; top: 0px;border-radius:3px 0 0 4px;z-index: 99999; -moz-border-radius: 15px; -webkit-border-radius: 25px; ">
                <div class="grid-demo" style="padding-top: 2px;" onclick="complaint()">
                    <font size="2"><b>投诉</b></font>
                </div>
            </div>
            <input id="code" type="hidden" value="${code}">
            <input id="voteCode" type="hidden" value="${voteCode}">
            <input id="userCode" type="hidden" value="${userCode}">
            <input id="msg" type="hidden" value="${msg}">
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
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-md8">
                    <div class="layui-col-xs12 one2" style="background-color: #F5F5F5;text-align:center;border-radius:3px 0 0 4px;padding-top: 13px;">
                        <div class="grid-demo grid-demo-bg1">
                            <i class="layui-icon layui-icon-user" style="font-size: 14; color: #696969;"><b>${userName}</b></i>
                        </div>
                    </div>
                    <hr />
                    <div class="layui-col-xs6 one2" style="background-color: #F5F5F5;text-align:center;border-radius:3px 0 0 4px;">
                        <div class="grid-demo grid-demo-bg1">
                            <i class="layui-icon layui-icon-user" style="font-size: 14; color: #696969;">编号[${userCode}]</i>
                        </div>
                    </div>
                    <div class="layui-col-xs6 one2" style="background-color: #F5F5F5;text-align:center;border-radius:0 0 0 0;">
                        <div class="grid-demo">
                            <i class="layui-icon layui-icon-praise" style="font-size: 14; color: #696969;">票数[${userVoteCount}]</i>
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-note" style="font-size: 16px; color: black;"><b>礼物</b></i>
                            </div>
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-about" style="font-size: 16px; color: black;"><b>（1RMB = 2有效票数）</b></i>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo grid-demo-bg1">
                                    <img src="${basePath}/img/showImg/1.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">10</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo" >
                                    <img src="${basePath}/img/showImg/2.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">98</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo grid-demo-bg1" >
                                    <img src="${basePath}/img/showImg/3.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">365</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo" >
                                    <img src="${basePath}/img/showImg/4.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">520</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo grid-demo-bg1" >
                                    <img src="${basePath}/img/showImg/5.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">666</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo" >
                                    <img src="${basePath}/img/showImg/6.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">888</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo grid-demo-bg1" >
                                    <img src="${basePath}/img/showImg/7.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">1000</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-xs6 layui-col-sm6 layui-col-md4 check1"  onclick="checkBox(this)">
                                <div class="grid-demo" >
                                    <img src="${basePath}/img/showImg/8.png.htm" />
                                    <div style="position:absolute;position:absolute;bottom: 1px;right: 1px; ">
                                        <i class="layui-icon layui-icon-menu-fill" style="font-size: 13px; color: #C69500">2888</i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input id="moneyNum" type="hidden" value="">
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-about" style="font-size: 16px; color: black;"><b>请选择数量:</b>
                                    <select  id="selectNum"name="city" lay-verify="">
                                        <option value="1" selected>1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                        <option value="200">200</option>
                                        <option value="520">520</option>
                                        <option value="666">666</option>
                                        <option value="1314">1314</option>
                                    </select>
                                </i>
                            </div>
                        </div>
                        <div class="layui-card">
                            <div class="layui-card-header">
                                <i class="layui-icon layui-icon-about" style="font-size: 16px; color: black;"><b>礼物郑重声明:</b></i>
                            </div>
                            <div class="layui-card-body">
                                送礼物为第三方自带功能，用户自愿赠送，独自承担责任，切勿盲目攀比。
                                </br>
                                如您确定自愿赠送则表示对本次活动的认可。
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-col-xs12 one2" style="background: #a4ff91 linear-gradient(to right, rgba(0,255,0,0), rgba(136,255,81,0.5));text-align:center;position:fixed; left: 0px; bottom: 0px;border-radius:5px 0 0 6px;" onclick="getMoney()">
                <div class="grid-demo grid-demo-bg1" style="padding-top: 10px;">
                    <b>支付</b>
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
    function checkBox(obj) {
        //设置文本框获取焦点时候背景颜色变换
        var str = obj.getAttribute("class");
        if (str.indexOf("check1") != -1 ){
            //找其他的check2的,改成check1
            var x = document.getElementsByClassName("layui-col-xs6 layui-col-sm6 layui-col-md4 check2");
            var i;
            for (i = 0; i < x.length; i++) {
                x[i].setAttribute("class", "check1 layui-col-xs6 layui-col-sm6 layui-col-md4");
            }
            obj.setAttribute("class", "check2 layui-col-xs6 layui-col-sm6 layui-col-md4");//选中
        }else {
            obj.setAttribute("class", "check1 layui-col-xs6 layui-col-sm6 layui-col-md4");
        }
        document.getElementById("moneyNum").value = obj.childNodes[1].innerText;
    }
    function getMoney() {
        var msg = document.getElementById("msg").value;
        if ("T"==msg ) {
            layer.msg("活动已结束！");  //此时便可成功
            return;
        }
        var moneyNum = document.getElementById("moneyNum").value;
        var code = document.getElementById("code").value;
        var voteCode = document.getElementById("voteCode").value;
        var userCode = document.getElementById("userCode").value;
        var selectNum = document.getElementById("selectNum").value;
        var url = "${basePath}/money/addMoney.htm";
        // wx.config({
        //     debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        //     appId: appid, // 必填，公众号的唯一标识
        //     timestamp: , // 必填，生成签名的时间戳
        //     nonceStr: '', // 必填，生成签名的随机串
        //     signature: '',// 必填，签名
        //     jsApiList: [] // 必填，需要使用的JS接口列表
        // });
        if (null == moneyNum || ""==moneyNum || "undefined" == moneyNum) {
            layer.msg("请选择心仪的礼物!");  //此时便可成功
            return;
        }
        $.ajax({
            url:url,
            type:'post',
            contentType : "application/x-www-form-urlencoded",
            data:{'userCode':userCode,'voteCode':voteCode,'code':code,'moneyNum':moneyNum,'selectNum':selectNum},
            dataType : "text",
            success:function (res) {
                var jsonObject=eval("("+res+")");
                //alert(jsonObject);
                        WeixinJSBridge.invoke(
                        'getBrandWCPayRequest', {
                            "appId":jsonObject.appid,     //公众号名称，由商户传入
                            "timeStamp":jsonObject.timeStampTime,         //时间戳，自1970年以来的秒数
                            "nonceStr":jsonObject.nonceStr, //随机串
                            "package":jsonObject.packageStr,
                            "signType":"MD5",         //微信签名方式：
                            "paySign":jsonObject.paySign //微信签名
                            },function(res){
                            if(res.err_msg == "get_brand_wcpay_request:ok" ){
                                // 使用以上方式判断前端返回,微信团队郑重提示：
                                //res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
                            }
                        });
                        if (typeof WeixinJSBridge == "undefined"){
                            if( document.addEventListener ){
                                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                            }else if (document.attachEvent){
                                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                            }
                        }else{
                            onBridgeReady();
                        }
            },
            error:function (err) {
                layer.open("系统异常！");
            }
        });
    }
    function complaint() {
        var url = "${basePath}/complaint/index.htm";
        location.href = url;
    }
</script>
</body>
</html>
