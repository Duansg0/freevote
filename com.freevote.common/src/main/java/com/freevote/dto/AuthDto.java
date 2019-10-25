package com.freevote.dto;

import java.io.Serializable;

public class AuthDto implements Serializable {

    private static final long serialVersionUID = -4064086218898629596L;
    /**
     * 微信认证Code
     */
    private String code ;
    /**
     * 认证地址
     */
    private String url;

    private AuthDto (Builder builder){
        this.code = builder.code;
        this.url = builder.url;
    }

    public static class Builder{
        /**
         * 微信认证Code
         */
        private String code ;
        /**
         * 认证地址
         */
        private String url;

        public Builder setCode(String code) {
                this.code = code;
                return this;
        }
        public Builder setUrl(String url) {
            this.url = url;
            return this;
        }
        public AuthDto build(){
            return new AuthDto(this);
        }
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
