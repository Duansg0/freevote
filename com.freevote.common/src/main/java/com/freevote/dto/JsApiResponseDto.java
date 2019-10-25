package com.freevote.dto;

import java.io.Serializable;

public class JsApiResponseDto implements Serializable {

    private static final long serialVersionUID = 8101737997886400425L;

    private long errcode;

    private String errmsg;

    private String ticket ;

    private long expires_in;

    public long getErrcode() {
        return errcode;
    }

    public void setErrcode(long errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public long getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(long expires_in) {
        this.expires_in = expires_in;
    }
}
