package com.freevote.controller;

import com.duansg.vote.entity.User;
import com.duansg.vote.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/manage/quick")
public class ManageQuickController {

    @Autowired
    private UserService userService;
    /**
     * 快捷修改
     * @param req
     * @param res
     * @param model
     * @return
     */
    @RequestMapping(value = "/modify")
    public String modify(HttpServletRequest req, HttpServletResponse res, Model model){
        //查询前十名。
        List<User> users = userService.quickModifyUser();
        model.addAttribute("users",users);
        return "quickModify";
    }

    /**
     * @param req
     * @param res
     * @param model
     * @return
     */
    @RequestMapping(value = "/saveModify",method = RequestMethod.POST)
    @ResponseBody
    public String saveModify(HttpServletRequest req, HttpServletResponse res, Model model){
        String userId = req.getParameter("userId");
        String addNums = req.getParameter("addNums");
        if (StringUtils.isNotBlank(userId)){
           User user =  userService.getUserById(Long.valueOf(userId));
           if (StringUtils.isNotBlank(addNums)){
               user.setUserVoteCount(addNums);
               userService.updateUser(user);
               return Boolean.TRUE.toString();
           }
        }
        return Boolean.FALSE.toString();
    }
}
