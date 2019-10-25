package com.freevote.dto;

import java.io.Serializable;

public class WeChatPayClientDto implements Serializable {

    private static final long serialVersionUID = -1814701144629040242L;

    private String appid;

    private String timeStampTime;

    private String nonceStr;

    private String packageStr;

    private String paySign;

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String  getTimeStampTime() {
        return timeStampTime;
    }

    public void setTimeStampTime(String timeStampTime) {
        this.timeStampTime = timeStampTime;
    }

    public String getNonceStr() {
        return nonceStr;
    }

    public void setNonceStr(String nonceStr) {
        this.nonceStr = nonceStr;
    }

    public String getPackageStr() {
        return packageStr;
    }

    public void setPackageStr(String packageStr) {
        this.packageStr = packageStr;
    }

    public String getPaySign() {
        return paySign;
    }

    public void setPaySign(String paySign) {
        this.paySign = paySign;
    }
}
