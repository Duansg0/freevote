package com.freevote.config;

import lombok.Data;

import java.io.Serializable;

@Data
public class Config implements Serializable {

    private static final long serialVersionUID = 8430345218505722081L;
    /**
     * 本地图片地址
     */
    private String localImgUrl;

    /**
     *  项目地址
     */
    private String projectAddress;
    /**
     * 公众号应用id
     */
    private String appid;
    /**
     * 加密Key
     */
    private String desKey;
    /**
     * 公众号的私钥
     */
    private String secretKey;

}
