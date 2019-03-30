package com.dao;
import com.github.pagehelper.Page;
import com.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    int addUser(User user);

    int deleteUserById(long id);

    int updateUser(User user);

    User checkUser(String userName);

    User queryUserById(long id);

    Page<User> queryByPage(User user);

    User login(@Param("userName") String userName, @Param("userPassword") String userPassword);
}
