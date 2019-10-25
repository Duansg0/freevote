package com.freevote.dto;

import java.io.Serializable;

/**
 * @author Duansg
 * @date 2019-09-22
 * @dec 投诉数据实体
 */
public class ComplaintDto implements Serializable {

    private static final long serialVersionUID = 3708126179342916728L;

    private String weChatCode;

    private String tel;

    private String complaintText;

    private String complaintAdvise;

    public ComplaintDto(Builder builder) {
        this.weChatCode = builder.weChatCode;
        this.tel = builder.tel;
        this.complaintText = builder.complaintText;
        this.complaintAdvise = builder.complaintAdvise;
    }
    /**
     * @author Duansg
     * @date 2019-09-22
     * @dec 匿名构建类
     */
    public static class Builder{
        /**
         * weChatCode
         */
        private String weChatCode;
        /**
         * 联系方式
         */
        private String tel;
        /**
         * 投诉内容
         */
        private String complaintText;
        /**
         * 投诉建议
         */
        private String complaintAdvise;

        public Builder setWeChatCode(String weChatCode) {
            this.weChatCode = weChatCode;
            return this;
        }
        public Builder setTel(String tel) {
            this.tel = tel;
            return this;
        }
        public Builder setComplaintText(String complaintText) {
            this.complaintText = complaintText;
            return this;
        }
        public Builder setComplaintAdvise(String complaintAdvise) {
            this.complaintAdvise = complaintAdvise;
            return this;
        }

        public Builder setData(String weChatCode, String tel, String complaintText, String complaintAdvise) {
            this.weChatCode = weChatCode;
            this.tel = tel;
            this.complaintText = complaintText;
            this.complaintAdvise = complaintAdvise;
            return this;
        }

        public ComplaintDto build(){
            return new ComplaintDto(this);
        }
    }

    public String getWeChatCode() {
        return weChatCode;
    }

    public void setWeChatCode(String weChatCode) {
        this.weChatCode = weChatCode;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getComplaintText() {
        return complaintText;
    }

    public void setComplaintText(String complaintText) {
        this.complaintText = complaintText;
    }

    public String getComplaintAdvise() {
        return complaintAdvise;
    }

    public void setComplaintAdvise(String complaintAdvise) {
        this.complaintAdvise = complaintAdvise;
    }
}
