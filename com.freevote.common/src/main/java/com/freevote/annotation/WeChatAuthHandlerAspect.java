package com.freevote.annotation;

import com.duansg.vote.util.WeChatUrlHandlerUtil;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
public class WeChatAuthHandlerAspect {


    @Pointcut(value = "@annotation(com.duansg.vote.annotation.WeChatAuthHandler)")
    private void pointcut() {

    }
    @Autowired
    private Config config;
    /**
     * 在方法执行前后
     * @param point
     * @return
     * @throws Throwable
     */
    @Around(value = "pointcut() && @annotation(weChatAuthHandler)")
    public Object around(ProceedingJoinPoint point, WeChatAuthHandler weChatAuthHandler) throws Throwable {
        Object[] args = point.getArgs();
        HttpServletRequest request = (HttpServletRequest) args[0];
        String voteCode = (String) args[3];
        String userCode = (String) args[4];
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        if (StringUtils.isBlank(code)){
            WeChatAuthContextHolder.setAuth(new AuthDto.Builder().setUrl(WeChatUrlHandlerUtil.getVoteIndexUrl(config.getProjectAddress(),voteCode,config.getAppid(),userCode)).build());
        }else{
            String codeEncrypt = DesUtil.toHexString(DesUtil.encrypt(code, config.getDesKey()));
            WeChatAuthContextHolder.setAuth(new AuthDto.Builder().setCode(codeEncrypt.toUpperCase()).build());
        }
        return point.proceed();
    }
}
