package com.freevote.api.controller;

import com.freevote.base.facade.FreeVoteInfoFacade;
import com.freevote.base.vo.VoteInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class VoteIndexController {

    @Autowired
    private FreeVoteInfoFacade freeVoteInfoFacade;
    /**
     * 具体哪一个活动展示
     * @return
     */
    @RequestMapping("/voteInfo/{voteCode}")
    public String showIndex(HttpServletRequest req, HttpServletResponse res, Model model,@PathVariable("voteCode")String voteCode){
        VoteInfoVo voteInfoVo  = freeVoteInfoFacade.getVoteInfoAndUsers(voteCode,null);
        model.addAttribute("voteInfoVo",voteInfoVo);//加密的Code
        return "exp";
    }

}
