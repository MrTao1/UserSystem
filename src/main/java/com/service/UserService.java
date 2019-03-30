package com.service;
import com.pojo.PageBean;
import com.pojo.User;
import java.util.List;

public interface UserService {
    int addUser(User user);

    User checkUser(String userName);

    int deleteUserById(long id);

    int updateUser(User user);

    User queryById(long id);

    PageBean queryByPage(User user,int pageCode,int pageSize );

    User login(String userName, String userPassword);
}
