package com.freevote.dto;

import java.io.Serializable;

public class VoteAddTempDto implements Serializable {

    private static final long serialVersionUID = 5397762952470513942L;

    private String code ;

    private String voteCode;

    private String userCode;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getVoteCode() {
        return voteCode;
    }

    public void setVoteCode(String voteCode) {
        this.voteCode = voteCode;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }
}
