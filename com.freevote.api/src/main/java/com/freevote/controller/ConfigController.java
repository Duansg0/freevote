package com.freevote.controller;

import com.alibaba.fastjson.JSON;
import com.duansg.vote.config.Config;
import com.duansg.vote.dto.AccessDto;
import com.duansg.vote.dto.JsTicketDto;
import com.duansg.vote.dto.WeChatConfigDto;
import com.duansg.vote.ehcache.EhcacheService;
import com.duansg.vote.util.WeChatJsSign;
import com.duansg.vote.util.WeChatUrlHandlerUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@RequestMapping("/config")
public class ConfigController {

    @Autowired
    private Config config;
    @Autowired
    private EhcacheService ehcacheService;

    @RequestMapping("/get")
    @ResponseBody
    public String showIndex(HttpServletRequest req, HttpServletResponse res, Model model){
        String localUrl = req.getParameter("localUrl");
        String appid = config.getAppid();
        String js_token = ehcacheService.get("JS_TOKEN");
        if (StringUtils.isBlank(js_token)){
            AccessDto accessDto= WeChatUrlHandlerUtil.getJsAccessToken(config);
            if (null!= accessDto && StringUtils.isBlank(accessDto.getErrmsg())){
                js_token = accessDto.getAccess_token();
                ehcacheService.set("JS_TOKEN", js_token);
            }
        }
        String js_ticket = ehcacheService.get("JS_TICKET");
        if (StringUtils.isBlank(js_ticket)){
            JsTicketDto jsTicketDto = WeChatUrlHandlerUtil.getJsTicket(js_token);
            if (null!= jsTicketDto && "ok".equals(jsTicketDto.getErrmsg())){
                js_ticket = jsTicketDto.getTicket();
                ehcacheService.set("JS_TICKET", js_ticket);
            }
        }
        Map<String, String> sign = WeChatJsSign.sign(js_ticket,  localUrl);
        String signature = sign.get("signature");
        String timestamp = sign.get("timestamp");
        String nonceStr = sign.get("nonceStr");
        String url = sign.get("url");
        String jsapi_ticket = sign.get("jsapi_ticket");
        WeChatConfigDto weChatConfigDto = new WeChatConfigDto();
        weChatConfigDto.setAppid(appid);
        weChatConfigDto.setNonceStr(nonceStr);
        weChatConfigDto.setSignature(signature);
        weChatConfigDto.setTimestamp(Long.valueOf(timestamp));
        return JSON.toJSONString(weChatConfigDto);
    }
}
