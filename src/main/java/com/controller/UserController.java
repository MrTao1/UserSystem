package com.controller;

import com.pojo.User;
import com.service.UserService;
import com.utils.AESUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.logging.Logger;

@Controller
@RequestMapping("/user")
public class UserController {

    private final Logger logger = Logger.getLogger("UserController");

    @Autowired
    private UserService userService;

    @RequestMapping("/toAddUser")
    public String toAddUser() {
        return "addUser";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(User user, Model model) {
        User exists = userService.checkUser(user.getUserName());
        logger.info("当前新增用户的用户名:" + user.getUserName());
        if (exists != null) {
            model.addAttribute("message", "用户名已存在");
            return "addUser";
        } else {
            String encryptString = AESUtils.aesEncode(user.getUserPassword());
            user.setUserPassword(encryptString);
            userService.addUser(user);
            return "redirect:/user/queryByPage";
        }
    }

    @RequestMapping("/del/{userId}")
    public String deleteUser(@PathVariable("userId") Long id) {
        logger.info("当前删除用户的用户名:" + id);
        userService.deleteUserById(id);
        return "redirect:/user/queryByPage";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Model model, long id) {
        model.addAttribute("user", userService.queryById(id));
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(Model model, User user) {
        userService.updateUser(user);
        user = userService.queryById(user.getUserId());
        model.addAttribute("user", user);
        return "redirect:/user/queryByPage";
    }

    @RequestMapping("/queryByPage")
    public String queryByPage(User user,
                              @RequestParam(value = "pageCode", required = false, defaultValue = "1") int pageCode,
                              @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
                              Model model) {
        // 回显数据
        model.addAttribute("page", userService.queryByPage(user, pageCode, pageSize));
        return "allUser";
    }

    @RequestMapping(value = "/login")
    public String login(@RequestParam String userName, @RequestParam String userPassword, Model model) {
        User user = userService.login(userName, AESUtils.aesEncode(userPassword));
        if (user != null) {
            return "redirect:/user/queryByPage";
        } else {
            model.addAttribute("message", "你输入的用户名或密码有误");
            return "loginInfo";
        }
    }

}
