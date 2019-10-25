package com.freevote.dto;

import java.io.Serializable;

public class WeChatConfigDto implements Serializable {

    private static final long serialVersionUID = 2677314541965518984L;

    private String signature;

    private long timestamp;

    private String nonceStr;

    private String appid;

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public String getNonceStr() {
        return nonceStr;
    }

    public void setNonceStr(String nonceStr) {
        this.nonceStr = nonceStr;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }
}
