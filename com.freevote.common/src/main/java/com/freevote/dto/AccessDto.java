package com.freevote.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Duasng
 * 错误示例{"errcode":40029,"errmsg":"invalid code"}
 */
@Data
public class AccessDto implements Serializable {

    private static final long serialVersionUID = 4731935029093195771L;
    /**
     * 网页授权接口调用凭证,注意：此access_token与基础支持的access_token不同
     */
    private String access_token;
    /**
     * access_token接口调用凭证超时时间，单位（秒）
     */
    private long expires_in;
    /**
     * 用户唯一标识，请注意，在未关注公众号时，用户访问公众号的网页，也会产生一个用户和公众号唯一的OpenID
     */
    private String openid;
    /**
     * 用户授权的作用域，使用逗号（,）分隔
     */
    private String scope;
    /**
     * 用户刷新access_token
     */
    private String refresh_token ;
    /**
     * 错误信息
     */
    private String errmsg ;
    /**
     * 错误编码
     */
    private long errcode;

}
