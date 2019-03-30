package com.service.impl;

import com.dao.UserDao;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.pojo.PageBean;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }


    @Override
    public User checkUser(String userName) {
        return userDao.checkUser(userName);
    }

    @Override
    public int deleteUserById(long id) {
        return userDao.deleteUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public User queryById(long id) {
        return userDao.queryUserById(id);
    }

    @Override
    public PageBean queryByPage(User user, int pageCode, int pageSize) {
        PageHelper.startPage(pageCode, pageSize);
        Page<User> page = userDao.queryByPage(user);
        return new PageBean(pageCode, (int) Math.ceil((double) (page.getTotal() / (double) pageSize)), (int) page.getTotal(), pageSize, page.getResult());
    }

    public User login(String userName, String userPassword) {
        return userDao.login(userName, userPassword);
    }

}


