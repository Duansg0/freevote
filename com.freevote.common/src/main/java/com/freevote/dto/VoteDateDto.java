package com.freevote.dto;

import java.io.Serializable;

public class VoteDateDto implements Serializable {

    private static final long serialVersionUID = 2241214522795700482L;

    private String day;

    private String hour;

    private String min;

    private String sec;

    public VoteDateDto(Builder builder) {
        this.day = builder.day;
        this.hour = builder.hour;
        this.min = builder.min;
        this.sec = builder.sec;
    }

    public static class Builder{

        private String day;

        private String hour;

        private String min;

        private String sec;

        public Builder(String day, String hour, String min, String sec) {
            this.day = day;
            this.hour = hour;
            this.min = min;
            this.sec = sec;
        }
        public VoteDateDto build(){
            return new VoteDateDto(this);
        }
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getMin() {
        return min;
    }

    public void setMin(String min) {
        this.min = min;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }
}
